<?php

namespace App\Http\Controllers\public;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PrivacyAndPolicyController extends Controller
{
    public function index()
    {
        return view("public.pages.privacyAndPolicy");
    }
}
