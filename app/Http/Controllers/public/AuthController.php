<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Mail\VerificationCodeMail;
use App\Models\Cart;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $remember = $request->remember ?? false;

        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email|min:5',
            'password' => 'required|min:4'
        ], [
            'email.required' => trans('validation.email_required'),
            'email.email' => trans('validation.email_email'),
            'email.exists' => trans('validation.email_not_exists'),
            'email.min' => trans('validation.email_min'),
            'password.required' => trans('validation.password_required'),
            'password.min' => trans('validation.password_min'),
        ]);

        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors(),
                ], 422);
            }
            return redirect()->route('home')
                ->withErrors($validator)
                ->withInput($request->except('password'));
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password], $remember)) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => trans('global.success_login'),
                    'redirect' => route('home'),
                ]);
            }
            return redirect()
                ->route('home')
                ->with('success', trans('global.success_login'));
        }

        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'success' => false,
                'errors' => ['general' => trans('global.invalid_credentials')],
            ], 401);
        }
        return redirect()->route('home')
            ->with('error', trans('global.invalid_credentials'))
            ->withInput($request->except('password'));
    }

    public function logout(Request $request)
    {
        Auth::guard('web')->logout();
        return redirect()->route('home')->with('success', trans("global.success_logout"));
    }

    public function register(Request $request)
    {
        // Validation
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|min:3',
            'lastName' => 'required|min:3',
            'phone' => 'required|min:10',
            'email' => 'required|email|unique:users,email|min:5',
            'password' => 'required|min:4',
        ], [
            'firstName.required' => trans('validation.first_name_required'),
            'firstName.min' => trans('validation.first_name_min'),
            'lastName.required' => trans('validation.last_name_required'),
            'lastName.min' => trans('validation.last_name_min'),
            'phone.required' => trans('validation.phone_required'),
            'phone.min' => trans('validation.phone_min'),
            'email.required' => trans('validation.email_required'),
            'email.min' => trans('validation.email_min'),
            'email.unique' => trans('validation.email_unique'),
            'email.email' => trans('validation.email_email'),
            'password.required' => trans('validation.password_required'),
            'password.min' => trans('validation.password_min'),
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors(),
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }
        try {
            DB::beginTransaction();
            // Create user
            $user = User::create([
                'name' => $request->input('firstName') . ' ' . $request->input('lastName'),
                'phone' => $request->input('phone'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password')),
            ]);
            DB::commit();

            // Auto login
            if (Auth::attempt(['email' => $request->input('email'), 'password' => $request->input('password')], false)) {
                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => true,
                        'message' => trans('global.success_login'),
                        'redirect' => route('home'),
                    ]);
                }
                return redirect()->route('home')->with('success', trans('global.success_login'));
            } else {
                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => true,
                        'message' => trans('global.success_register') . trans("global.please_login_manually"),
                        'redirect' => route('home'),
                    ]);
                }
                return redirect()->route('home')->with('success', trans('global.success_register') .  trans("global.please_login_manually"));
            }
        } catch (\Exception $e) {
            DB::rollBack();
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => ['general' => trans('global.error_occurred')],
                ], 500);
            }
            return redirect()->back()->with('error', trans('global.error_occurred'))->withInput();
        }
    }

    public function checkEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email|min:5',
        ], [
            'email.required' => trans('validation.email_required'),
            'email.min' => trans('validation.email_min'),
            'email.exists' => trans('validation.email_not_exists'),
            'email.email' => trans('validation.email_email'),
        ]);

        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors()->toArray(),
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            $email = $request->input('email');
            $user = User::where('email', $email)->first();
            $verificationCode = random_int(100000, 999999);
            $user->verification_code = $verificationCode;
            $user->verification_code_expires_at = Carbon::now()->addMinutes(10);
            $user->save();

            Mail::to($email)->queue(new VerificationCodeMail($verificationCode));

            return response()->json([
                'success' => true,
                'message' => trans('global.verification_code_sent')
            ]);
        } catch (\Exception $e) {
            \Log::error('Failed to send verification code: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'errors' => ['general' => trans('global.error_occurred')],
            ], 500);
        }
    }

    public function verifyCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'verification_code' => 'required|digits:6',
        ], [
            'email.required' => trans('validation.email_required'),
            'email.exists' => trans('validation.email_not_exists'),
            'email.email' => trans('validation.email_email'),
            'verification_code.required' => trans('validation.verification_code_required'),
            'verification_code.digits' => trans('validation.verification_code_min_6'),
        ]);

        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors()->toArray(),
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $email = $request->input('email');
        $code = $request->input('verification_code');
        $user = User::where('email', $email)->first();

        // التحقق من الكود ووقت الصلاحية
        if ($user->verification_code === $code && Carbon::now()->lessThanOrEqualTo($user->verification_code_expires_at)) {
            // إعادة تعيين الكود بعد التحقق
            $user->verification_code = null;
            $user->verification_code_expires_at = null;
            $user->save();

            return response()->json([
                'success' => true,
                'message' => trans('global.verification_code_success'),
            ]);
        }

        return response()->json([
            'success' => false,
            'errors' => ['verification_code' => trans('global.verification_code_invalid')],
        ], 422);
    }

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => 'required|min:4',
        ], [
            'email.required' => trans('validation.email_required'),
            'email.exists' => trans('validation.email_not_exists'),
            'email.email' => trans('validation.email_email'),
            'password.required' => trans('validation.password_required'),
            'password.min' => trans('validation.password_min'),
        ]);

        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors()->toArray(),
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            $email = $request->input('email');
            $password = $request->input('password');
            $user = User::where('email', $email)->first();

            // (اختياري) التحقق من أن رمز التحقق تم التحقق منه مسبقًا
            // if (!$user->verification_code_verified) {
            //     return response()->json([
            //         'success' => false,
            //         'errors' => ['general' => trans('global.verification_required')],
            //     ], 403);
            // }

            // تحديث كلمة المرور
            $user->update([
                'password' => Hash::make($password),
            ]);

            // محاولة تسجيل الدخول التلقائي
            if (Auth::attempt(['email' => $email, 'password' => $password], false)) {
                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => true,
                        'message' => trans('global.reset_password') . trans('global.success_login'),
                        'redirect' => route('home'),
                    ]);
                }
                return redirect()->route('home')->with('success', trans('global.reset_password') . trans('global.success_login'));
            }

            // إذا فشل تسجيل الدخول التلقائي
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => trans('global.reset_password') . '، يرجى تسجيل الدخول يدويًا.',
                    'redirect' => route('home'),
                ]);
            }
            return redirect()->route('home')->with('success', trans('global.reset_password') . '، يرجى تسجيل الدخول يدويًا.');
        } catch (\Exception $e) {
            \Log::error('Failed to reset password for email: ' . $request->input('email') . ' - Error: ' . $e->getMessage());
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => ['general' => trans('global.error_occurred')],
                ], 500);
            }
            return redirect()->back()->with('error', trans('global.error_occurred'))->withInput();
        }
    }
}
