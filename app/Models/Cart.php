<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'service_id',
        'package_id',
        'city_id',
        'qty',
        'price',
        'start_date',
        'end_date',
    ];

    public function service()
    {
        return $this->belongsTo(Service::class, 'service_id');
    }


    // public function serviceImage()
    // {
    //     return $this->hasMany(ServiceImage::class, 'service_id');
    // }

    // public function serviceFirstImage()
    // {
    //     return $this->serviceImage()->first();
    // }

    public function serviceImage()
    {
        return $this->hasOne(ServiceImage::class, 'service_id', 'service_id')
            ->select('service_id', 'src')
            ->whereRaw('ROW_NUMBER() OVER (PARTITION BY service_id ORDER BY id) = 1');
    }

    // علاقة مع PackageImage
    public function packageImage()
    {
        return $this->hasOne(PackageImage::class, 'package_id', 'package_id')
            ->select('package_id', 'src')
            ->whereRaw('ROW_NUMBER() OVER (PARTITION BY package_id ORDER BY id) = 1');
    }
}
