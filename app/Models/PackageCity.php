<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PackageCity extends Model
{
    use HasFactory;
    protected $fillable = ['package_id', 'city_id'];
}
