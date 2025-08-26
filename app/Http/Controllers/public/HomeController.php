<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $categories =  ServiceCategory::limit(10)->get();
        return view('public.pages.index', compact('categories'));
    }
}
