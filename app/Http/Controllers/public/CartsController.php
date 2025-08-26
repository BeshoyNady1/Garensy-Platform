<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Favorite;
use App\Traits\cartTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;



class CartsController extends Controller
{
    use cartTrait;
    public function index()
    {
        $services = $this->getCartItems();
        return view('public.pages.cart', compact('services'));
    }

    public function remove(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:carts,id',
        ], [
            'id.required' => trans('validation.service_id_required'),
            'id.exists' => trans('validation.service_id_exists'),
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
            // check if the cart item exists
            $cartItem = Cart::where('id', $request->id)
                ->where('user_id', auth()->user()->id)
                ->first();

            if (!$cartItem) {
                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => false,
                        'errors' => ['general' => trans('validation.service_id_exists')],
                    ], 404);
                }
                return redirect()->back()->with('error', trans('validation.service_id_exists'));
            }

            // remove the cart item
            $cartItem->delete();

            // update cart count
            $userCartCount = Cart::where('user_id', auth()->user()->id)->count();

            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => trans('global.remove_from_cart_successfully'),
                    'userCartCount' => $userCartCount,
                ]);
            }
            return redirect()->back()->with('success', trans('global.remove_from_cart_successfully'));
        } catch (\Exception $e) {
            Log::error('Failed to remove cart item: ' . $e->getMessage());
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => ['general' => trans('global.error_occurred')],
                ], 500);
            }
            return redirect()->back()->with('error', trans('global.error_occurred'));
        }
    }

    public function removeAll(Request $request)
    {
        try {
            // check if the user has any cart items
            $cartItems = Cart::where('user_id', auth()->user()->id)->get();

            if ($cartItems->isEmpty()) {
                if ($request->ajax() || $request->wantsJson()) {
                    return response()->json([
                        'success' => false,
                        'errors' => ['general' => trans('validation.cart_empty')],
                    ], 404);
                }
                return redirect()->back()->with('error', trans('validation.cart_empty'));
            }

            // remove all cart items
            Cart::where('user_id', auth()->user()->id)->delete();

            // update cart count
            $userCartCount = 0;

            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => trans('global.removed_all_from_cart_successfully'),
                    'userCartCount' => $userCartCount,
                ]);
            }
            return redirect()->back()->with('success', trans('global.removed_all_from_cart_successfully'));
        } catch (\Exception $e) {
            Log::error('Failed to remove all cart items for user ' . auth()->user()->id . ': ' . $e->getMessage());
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => ['general' => trans('global.error_occurred')],
                ], 500);
            }
            return redirect()->back()->with('error', trans('global.error_occurred'));
        }
    }
}
