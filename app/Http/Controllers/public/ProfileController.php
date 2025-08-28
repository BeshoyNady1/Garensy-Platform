<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Traits\favoriteTrait;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    use favoriteTrait;
    public function index($page)
    {
        $orders = Order::where('user_id', auth()->user()->id ?? null)->with("orderItems")->get();
        $favoridsItems = $this->getPackagesAndServicesFavorites();
        $page = $page ?? 'orders';

        // dd($order->orderItems[0]->firstImage()->src);
        return view("public.pages.profile", get_defined_vars());
    }
}
