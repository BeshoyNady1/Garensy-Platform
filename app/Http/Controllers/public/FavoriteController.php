<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Favorite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class FavoriteController extends Controller
{
    public function store(Request $request)
    {
        // Check if user is authenticated
        if (!auth()->check()) {
            return response()->json([
                'success' => false,
                'message' => trans('global.unauthenticated'),
            ], 401);
        }

        // Define validation rules
        $validator = Validator::make($request->all(), [
            'package_id' => 'nullable|integer|exists:packages,id|required_without:service_id|prohibited_if:service_id,*,!null',
            'service_id' => 'nullable|integer|exists:services,id|required_without:package_id|prohibited_if:package_id,*,!null',
        ], [
            'package_id.integer' => trans('validation.package_not_integer'),
            'package_id.exists' => trans('validation.package_id_exists'),
            'package_id.required_without' => trans('validation.package_or_service_required'),
            'package_id.prohibited_if' => trans('validation.package_and_service_conflict'),
            'service_id.integer' => trans('validation.service_not_integer'),
            'service_id.exists' => trans('validation.service_id_exists'),
            'service_id.required_without' => trans('validation.package_or_service_required'),
            'service_id.prohibited_if' => trans('validation.package_and_service_conflict'),
        ]);

        // Return validation errors if validation fails
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => trans('validation.invalid_input'),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            DB::beginTransaction();

            // Check if favorite exists
            $exists = Favorite::where('user_id', auth()->id())
                ->where('package_id', $request->package_id ?? null)
                ->where('service_id', $request->service_id ?? null)
                ->exists();

            if ($exists) {
                // If favorite exists, delete it (toggle off)
                Favorite::where('user_id', auth()->id())
                    ->where('package_id', $request->package_id ?? null)
                    ->where('service_id', $request->service_id ?? null)
                    ->delete();

                $message = trans('global.favorite_removed');
            } else {
                // If favorite doesn't exist, create it (toggle on)
                Favorite::create([
                    'user_id' => auth()->id(),
                    'package_id' => $request->package_id ?? null,
                    'service_id' => $request->service_id ?? null,
                ]);

                $message = trans('global.favorite_added');
            }

            // Get updated wishlist count
            $userWishListCount = Favorite::where('user_id', auth()->id())->count();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => $message,
                'userWishListCount' => $userWishListCount,
                'action' => $exists ? 'remove' : 'add',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            // Log the error for debugging
            Log::error('Failed to process favorite: ' . $e->getMessage(), [
                'user_id' => auth()->id(),
                'package_id' => $request->package_id,
                'service_id' => $request->service_id,
            ]);

            return response()->json([
                'success' => false,
                'message' => trans('global.something_went_wrong'),
            ], 500);
        }
    }
}
