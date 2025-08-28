<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'service_id',
        'package_id',
        'qty',
        'price',
        'start_date',
        'end_date'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // علاقة مع الخدمة
    public function service()
    {
        return $this->belongsTo(Service::class);
    }

    // علاقة مع البكج
    public function package()
    {
        return $this->belongsTo(Package::class);
    }

    // أول صورة للخدمة
    public function serviceFirstImage()
    {
        return $this->hasOne(ServiceImage::class, 'service_id', 'service_id')
            ->orderBy('id', 'asc'); // أول صورة حسب الـ id
    }

    // أول صورة للبكج
    public function packageFirstImage()
    {
        return $this->hasOne(PackageImage::class, 'package_id', 'package_id')
            ->orderBy('id', 'asc'); // أول صورة حسب الـ id
    }

    // صورة موحدة سواء خدمة أو بكج
    public function firstImage()
    {
        if ($this->service_id) {
            return $this->serviceFirstImage;
        } elseif ($this->package_id) {
            return $this->packageFirstImage;
        }
        return null;
    }

    public function firstNameAr()
    {
        if ($this->service_id) {
            return $this->service ? $this->service->name_ar : null;
        } elseif ($this->package_id) {
            return $this->package ? $this->package->name_ar : null;
        }
        return null;
    }

    public function firstNameEn()
    {
        if ($this->service_id) {
            return $this->service ? $this->service->name_en : null;
        } elseif ($this->package_id) {
            return $this->package ? $this->package->name_en : null;
        }
        return null;
    }
}
