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
}
