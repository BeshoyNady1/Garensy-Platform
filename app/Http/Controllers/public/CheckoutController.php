<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Favorite;
use App\Models\Order;
use App\Traits\cartTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class CheckoutController extends Controller
{
    use cartTrait;
    public function index()
    {
        $cartItems = $this->getCartItems();
        return view('public.pages.checkout', compact('cartItems'));
    }

    public function store(Request $request)
    {
        // التحقق من تسجيل دخول المستخدم
        if (!auth()->check()) {
            return response()->json([
                'success' => false,
                'message' => trans('global.unauthenticated'),
                'userCartCount' => 0,
            ], 401);
        }

        try {
            // استرجاع عناصر السلة
            $cartItems = $this->getCartItems();

            // التحقق من أن السلة ليست فاضية
            if (count($cartItems) == 0) {
                return response()->json([
                    'success' => false,
                    'message' => trans('global.cart_empty'),
                    'userCartCount' => 0,
                ], 400);
            }

            DB::beginTransaction();

            // إنشاء طلب جديد
            $order = Order::create([
                'user_id' => auth()->user()->id,
                'status' => 'pending',
            ]);

            $total_amount = 0;

            // نقل العناصر إلى orderItems
            foreach ($cartItems as $item) {
                // التحقق من وجود الخدمة
                if (!$item->service_id) {
                    throw new \Exception(trans('global.service_not_found'));
                }

                $order->orderItems()->create([
                    'order_id' => $order->id,
                    'service_id' =>   $item->is_package == 0 ? $item->service_id : null,
                    'package_id' => $item->is_package == 1 ? $item->service_id : null,
                    'qty' => $item->qty,
                    'price' => $item->price,
                    'start_date' => $item->start_date,
                    'end_date' => $item->end_date,
                ]);

                $total_amount += $item->price * $item->qty;
            }

            // تحديث إجمالي المبلغ
            $order->update([
                'total_amount' => $total_amount,
            ]);

            // حذف عناصر السلة
            Cart::where('user_id', auth()->user()->id)->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => trans('global.order_created_successfully'),
                'userCartCount' => 0,
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Checkout error: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => $e->getMessage(), //trans('global.order_creation_failed'),
                'userCartCount' => Cart::where('user_id', auth()->user()->id)->count(),
            ], 500);
        }
    }
}
