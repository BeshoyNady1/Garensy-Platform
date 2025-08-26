@extends('public.layout.main')

@section('title', __('global.packages'))

@section('breadcrumb')
    <!-- Breadcrumb Section Begin -->
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.packages') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.packages') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
@endsection

@section('styles')
    <style>
        .product-card {
            {{ app()->getLocale() == 'ar' ? 'direction: rtl; text-align: right;' : 'direction: ltr; text-align: left;' }} background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            position: relative;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .product-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .product-card:hover .product-overlay {
            opacity: 1;
        }

        .product-actions {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            gap: 10px;
        }

        .product-details {
            padding: 15px;
        }

        .product-title {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .product-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .product-price {
            font-weight: 600;
            color: #28a745;
        }

        .product-rating {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #ffc107;
        }

        /* Benefits Section inside Card */
        .benefits-list {
            padding: 0 15px 15px 15px;
            border-top: 1px solid #e9ecef;
            margin-top: 10px;
        }

        .benefits-list h5 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: #333;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            padding: 6px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .benefit-item:hover {
            background-color: #f8f9fa;
        }

        .benefit-item i {
            font-size: 1.3rem;
            margin: {{ app()->getLocale() == 'ar' ? '0 0 0 8px' : '0 8px 0 0' }};
            transition: transform 0.3s ease;
        }

        .benefit-item:hover i {
            transform: scale(1.2);
        }

        .benefit-item span {
            font-size: 0.9rem;
            color: #555;
            flex-grow: 1;
        }

        /* Different icons for each feature */
        .benefit-item:nth-child(1) i {
            color: #28a745;
        }

        /* High Quality */
        .benefit-item:nth-child(2) i {
            color: #007bff;
        }

        /* Customization */
        .benefit-item:nth-child(3) i {
            color: #ffc107;
        }

        /* 24/7 Support */
        .benefit-item:nth-child(4) i {
            color: #17a2b8;
        }

        /* Transparent Pricing */
        .benefit-item:nth-child(5) i {
            color: #dc3545;
        }

        /* On-Time Delivery */
        /* Responsive Design */
        @media (max-width: 576px) {
            .product-card {
                margin-bottom: 20px;
            }

            .product-title {
                font-size: 1.1rem;
            }

            .benefit-item span {
                font-size: 0.85rem;
            }

            .benefit-item i {
                font-size: 1.2rem;
            }
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
                            <!-- Packages -->
                            @foreach ($packages as $package)
                                <div class="col-6 col-xl-4">
                                    <div class="product-card" data-aos="zoom-in">
                                        <div class="product-image">
                                            <a href="{{ route('packages.details', $package->id) }}">
                                                <img src="{{ asset('' . $package->images[0]->src) }}" class=""
                                                    alt="Product" lazyload>
                                            </a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="product-actions">
                                                <a href="{{ route('packages.details', $package->id) }}" class="action-btn"
                                                    data-bs-toggle="tooltip" title="Quick View">
                                                    <i class="bi bi-eye"></i>
                                                </a>
                                                <button type="button" class="action-btn Add_Wishlist"
                                                    data-id="{{ $package->id }}" data-bs-toggle="tooltip"
                                                    title="Add to Wishlist">
                                                    <i class="bi bi-heart"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="product-details">
                                            <h4 class="product-title">
                                                <a href="{{ route('packages.details', $package->id) }}">
                                                    {{ app()->getLocale() == 'ar' ? $package->name_ar : $package->name_en }}
                                                </a>
                                            </h4>
                                            <div
                                                class="product-meta {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <div class="product-price">
                                                    {{ $package->price }}
                                                    {{ app()->getLocale() == 'ar' ? 'ريال' : 'SAR' }}
                                                </div>
                                                <div class="product-rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    4.9 <span>(56)</span>
                                                </div>
                                            </div>
                                            <!-- Benefits List -->
                                            <div class="benefits-list">
                                                <h5 class="mt-3">
                                                    @lang('global.package_benefits')
                                                </h5>
                                                @foreach ($package->features as $packageFeature)
                                                    <div class="benefit-item">
                                                        <i
                                                            class="bi {{ $loop->index == 0 ? 'bi-check-circle-fill' : ($loop->index == 1 ? 'bi-gear-fill' : ($loop->index == 2 ? 'bi-headset' : ($loop->index == 3 ? 'bi-tag-fill' : 'bi-clock-fill'))) }}"></i>
                                                        <span>{{ app()->getLocale() == 'ar' ? $packageFeature->description_ar : $packageFeature->description_en }}</span>
                                                    </div>
                                                @endforeach
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
                let package_id = $(this).attr('data-id');
                let url = "{{ route('favorites.store') }}";
                axios.post(url, {
                    _token: '{{ csrf_token() }}',
                    package_id: package_id
                }).then(response => {
                    if (response.data.success) {
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
