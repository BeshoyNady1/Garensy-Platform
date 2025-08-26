<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\City;
use App\Models\Package;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PackagesController extends Controller
{
    public function index()
    {
        $packages = Package::with('features', 'images')->get();
        return view("public.pages.packages", compact("packages"));
    }

    public function details($id)
    {
        $package = Package::with('features', 'images')->find($id);
        $images = $package->images()->get();
        $cities = City::select('cities.id', 'cities.name_ar', 'cities.name_en')
            ->join('package_cities', 'cities.id', '=', 'package_cities.city_id')
            ->where('package_cities.package_id', $id)
            ->get();
        return view("public.pages.packageDetials", compact("package", "images", "cities"));
    }

    public function order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'package_id' => 'required|integer|exists:packages,id',
            'daterange' => 'required',
            'city' => 'required|exists:cities,id',
        ], [
            'package_id.required' => trans('validation.package_id_required'),
            'package_id.integer' => trans('validation.package_not_integer'),
            'package_id.exists' => trans('validation.package_id_exists'),
            'daterange.required' => trans('validation.daterange_required'),
            'city.required' => trans('validation.city_required'),
            'city.exists' => trans('validation.city_exists'),
        ]);

        try {
            DB::beginTransaction();
            $package = Package::findOrFail($request->package_id);
            $parts = explode(' to ', $request->daterange);
            $startDate = $parts[0];
            $endDate = $parts[1];

            Cart::create([
                'user_id' => auth()->user()->id,
                'package_id' => $package->id,
                'city_id' => $request->city,
                'price' => $package->price,
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
