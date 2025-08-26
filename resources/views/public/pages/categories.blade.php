@extends('public.layout.main')

@section('title', __('global.Categories'))

@section('styles')

@endsection

@section('breadcrumb')
    <!-- Breadcrumb Section Begin -->
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.Categories') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.Categories') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Category Product List Section -->
                <section id="category-product-list" class="category-product-list section">
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <div class="row g-4">
                            <!-- categories -->
                            @foreach ($categories as $category)
                                <div class="col-6 col-xl-2">
                                    <div class="product-card" data-aos="zoom-in">
                                        <div class="product-image">
                                            <a href="{{ route('services.show', $category->id) }}">
                                                <img src="{{ asset('' . $category->image) }}" class="" alt="Product"
                                                    lazyload>
                                            </a>
                                        </div>
                                        <div class="product-details">
                                            <h4 class="product-title text-center"><a
                                                    href="{{ route('services.show', $category->id) }}">
                                                    {{ app()->getLocale() == 'ar' ? $category->name_ar : $category->name_en }}
                                                </a>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </section>
                <!-- /Category Product List Section -->
            </div>
        </div>
    </div>
@endsection

@section('scripts')

@endsection
