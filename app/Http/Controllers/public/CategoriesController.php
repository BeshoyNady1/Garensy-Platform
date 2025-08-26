<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    public function index()
    {
        $categories =  ServiceCategory::get();
        return view("public.pages.categories", compact('categories'));
    }
}
