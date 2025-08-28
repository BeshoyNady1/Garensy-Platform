<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\City;
use App\Models\Order;
use App\Models\Service;
use App\Models\ServiceImage;
use App\Traits\servicesTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ServicesController extends Controller
{
    use servicesTrait;
    public function show($id)
    {
        $services = $this->getServices($id);
        return view("public.pages.services", compact("services"));
    }

    public function details($id)
    {
        $service = $this->getService($id);
        $images = ServiceImage::where('service_id', $id)->get();
        $features = Service::with('features')->find($id);
        $category = app()->getLocale() == "ar" ? Service::find($id)->category->name_ar : Service::find($id)->category->name_en;
        $cities = City::select('cities.id', 'cities.name_ar', 'cities.name_en')
            ->join('service_cities', 'cities.id', '=', 'service_cities.city_id')
            ->where('service_cities.service_id', $id)
            ->get();

        return view(
            "public.pages.showService",
            get_defined_vars()
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

            if ($this->checkIfServiceAleadyReserved($request->service_id, $parts[0], $parts[1]) != null) {
                return [
                    'success' => false,
                    'message' => trans('validation.service_already_reserved'),
                ];
            }

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
