@extends('public.layout.main')

@section('title', __('global.Services'))

@section('breadcrumb')
    <!-- Breadcrumb Section Begin -->
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.Services') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.Services') </li>
                    <li> @lang('global.Categories') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
@endsection

@section('styles')
    <style>
        .favorite-btn {
            background-color: #462956 !important;
            color: white !important;
            transform: translateY(-2px) !important;
        }
    </style>
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <section id="category-product-list" class="category-product-list section">
                    <div class="container" data-aos="fade-up" data-aos-delay="100">
                        <div class="row g-4">
                            <!-- categories -->
                            @foreach ($services as $service)
                                <div class="col-6 col-xl-4">
                                    <div class="product-card" data-aos="zoom-in">
                                        <div class="product-image">
                                            <a href="{{ route('services.details', $service->id) }}">
                                                <img src="{{ asset('' . $service->image_src) }}" class=""
                                                    alt="Product" lazyload>
                                            </a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="product-actions">
                                                <a href="{{ route('services.details', $service->id) }}" class="action-btn"
                                                    data-bs-toggle="tooltip" title="Quick View">
                                                    <i class="bi bi-eye"></i>
                                                </a>
                                                <button type="button"
                                                    class="action-btn Add_Wishlist {{ $service->favorite != null ? 'favorite-btn' : '' }}"
                                                    data-id="{{ $service->id }}" data-bs-toggle="tooltip"
                                                    title="Add to Wishlist">
                                                    <i class="bi bi-heart"></i>
                                                </button>
                                                {{-- <button type="button" class="action-btn" data-bs-toggle="tooltip"
                                                    title="Add to Cart">
                                                    <i class="bi bi-cart-plus"></i>
                                                </button> --}}
                                            </div>
                                        </div>
                                        <div class="product-details text-end">
                                            <h4 class="product-title">
                                                <a href="{{ route('services.details', $service->id) }}">
                                                    {{ app()->getLocale() == 'ar' ? $service->name_ar : $service->name_en }}</a>
                                            </h4>
                                            <div class="product-category">
                                                {{ app()->getLocale() == 'ar' ? $service->description_ar : $service->description_en }}
                                            </div>
                                            <div class="product-meta flex-row-reverse">
                                                <div class="product-price">
                                                    <span class="riyal-heading"></span>
                                                    {{ $service->price }}
                                                </div>

                                                <div class="product-rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    4.9 <span>(56)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(".Add_Wishlist").click(function() {
            let checkAuth = "{{ auth()->check() }}";
            if (checkAuth == 0) {
                window.location.href = "{{ route('page.login') }}";
            } else {
                let $button = $(this);
                let service_id = $(this).attr('data-id');
                let url = "{{ route('favorites.store') }}";
                axios.post(url, {
                    _token: '{{ csrf_token() }}',
                    service_id: service_id
                }).then(response => {
                    if (response.data.success) {
                        response.data.action == 'remove' ? $button.removeClass("favorite-btn") : $button
                            .addClass("favorite-btn");
                        updateWishList(response.data.userWishListCount);
                        toastr.success(response.data.message);
                    } else {
                        toastr.error(response.data.message || 'حدث خطاء غير متوقع.');
                    }
                }).catch(error => {
                    if (error.response && error.response.data && error.response.data.errors) {
                        const errors = error.response.data.errors;
                        for (const key in errors) {
                            if (errors.hasOwnProperty(key)) {
                                const errorKey = key.replace(/\./g, '-');
                                if (Array.isArray(errors[key])) {
                                    errors[key].forEach(errorMessage => {
                                        toastr.error(errorMessage);
                                        $(`#${errorKey}-error`).text(errorMessage);
                                    });
                                } else {
                                    toastr.error(errors[key]);
                                    if (key !== 'general') {
                                        $(`#${errorKey}-error`).text(errors[key]);
                                    }
                                }
                            }
                        }
                    } else {
                        console.error(error);
                        toastr.error('حدث خطأ غير متوقع.');
                    }
                    $button.html('إعادة تعيين').prop('disabled', false);
                });
            }
        });
    </script>
@endsection
