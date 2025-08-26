<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\City;
use App\Models\Order;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ServicesController extends Controller
{
    public function show($id)
    {
        $services = Service::where('category_id', $id)->with('hasImages')->get();
        return view("public.pages.services", compact("services"));
    }

    public function details($id)
    {
        $service = Service::where('id', $id)->with(['hasImages', 'features'])->first();
        $serviceNameAr = $service->name_ar;
        $serviceNameEn = $service->name_en;
        $images = $service->hasImages()->get();
        $mainImage = $service->hasImages()->first();
        $category = app()->getLocale() == "ar" ? $service->category->name_ar : $service->category->name_en;
        $cities = City::select('cities.id', 'cities.name_ar', 'cities.name_en')
            ->join('service_cities', 'cities.id', '=', 'service_cities.city_id')
            ->where('service_cities.service_id', $id)
            ->get();

        return view(
            "public.pages.showService",
            compact(
                "service",
                "serviceNameAr",
                "serviceNameEn",
                "images",
                "mainImage",
                "category",
                "cities"
            )
        );
    }

    public function order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'service_id' => 'required|integer|exists:services,id',
            'daterange' => 'required',
            'city' => 'required|exists:cities,id',
        ], [
            'service_id.required' => trans('validation.service_id_required'),
            'service_id.integer' => trans('validation.service_not_integer'),
            'service_id.exists' => trans('validation.service_id_exists'),
            'daterange.required' => trans('validation.daterange_required'),
            'city.required' => trans('validation.city_required'),
            'city.exists' => trans('validation.city_exists'),
        ]);

        try {
            DB::beginTransaction();
            $service = Service::findOrFail($request->service_id);
            $parts = explode(' to ', $request->daterange);
            $startDate = $parts[0];
            $endDate = $parts[1];

            Cart::create([
                'user_id' => auth()->user()->id,
                'service_id' => $service->id,
                'city_id' => $request->city,
                'qty' => $request->qty,
                'price' => $service->price * $request->qty,
                'start_date' => $startDate,
                'end_date' => $endDate,
            ]);

            $userCartCount = Cart::where('user_id', auth()->user()->id)->count();

            DB::commit();

            return [
                'success' => true,
                'message' => trans('global.add_to_cart_success'),
                'userCartCount' => $userCartCount
            ];
        } catch (\Exception $e) {
            DB::rollBack();
            return [
                'success' => false,
                'message' => trans('global.add_to_cart_error'),
            ];
        }
    }
}
