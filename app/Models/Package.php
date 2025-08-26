<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;
    protected $fillable = [
        'provider_id',
        'name_ar',
        'name_en',
        'description_ar',
        'description_en',
        'price',
        'status'
    ];

    public function provider()
    {
        return $this->belongsTo(Provider::class);
    }

    public function features()
    {
        return $this->hasMany(PackageFeature::class);
    }

    public function images()
    {
        return $this->hasMany(PackageImage::class);
    }

    public function firstImage()
    {
        return $this->images()->first();
    }

    public function cities()
    {
        return $this->belongsToMany(City::class);
    }
}
