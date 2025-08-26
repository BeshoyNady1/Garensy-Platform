<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $fillable = [
        'provider_id',
        'name_ar',
        'name_en',
        'description_ar',
        'description_en',
        'price',
        'category_id',
        'status'
    ];

    public function hasImages()
    {
        return $this->hasMany(ServiceImage::class);
    }

    public function getFirstImageAttribute()
    {
        return $this->hasImages()->first();
    }

    public function category()
    {
        return $this->belongsTo(ServiceCategory::class);
    }

    public function provider()
    {
        return $this->belongsTo(Provider::class);
    }

    public function serviceCities()
    {
        return $this->hasMany(ServiceCity::class);
    }

    public function cities()
    {
        return $this->serviceCities()->with('city')->get();
    }

    public function hasCity($cityId)
    {
        return $this->serviceCities()->where('city_id', $cityId)->exists();
    }

    public function features()
    {
        return $this->hasMany(ServiceFeature::class);
    }
}
