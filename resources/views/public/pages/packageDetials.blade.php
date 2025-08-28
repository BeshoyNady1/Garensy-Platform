@extends('public.layout.main')

@section('title', __('global.package_details'))

@section('breadcrumb')
    <!-- Breadcrumb Section Begin -->
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> {{ app()->getLocale() == 'ar' ? $package->name_ar : $package->name }} </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.package_details') </li>
                    <li><a href="{{ route('packages.index') }}"> @lang('global.packages') </a></li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
@endsection

@section('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <style>
        .favorite-btn {
            background-color: red !important;
            color: white !important;
            transform: translateY(-2px) !important;
        }

        .riyal-heading::before {
            width: 23px;
            height: 46px;
        }
    </style>
@endsection

@section('content')
    <section id="product-details" class="product-details section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row g-4">
                <!-- service Gallery -->
                <div class="col-lg-7" data-aos="zoom-in" data-aos-delay="150">
                    <div class="product-gallery">
                        <div class="main-showcase">
                            <div class="image-zoom-container">
                                <img src="{{ asset('' . $package->images[0]->src) }}" alt="Product Main"
                                    class="img-fluid main-product-image drift-zoom" id="main-product-image"
                                    data-zoom="{{ asset('' . $package->images[0]->src) }}">

                                <div class="image-navigation">
                                    <button class="nav-arrow prev-image image-nav-btn prev-image" type="button">
                                        <i class="bi bi-chevron-left"></i>
                                    </button>
                                    <button class="nav-arrow next-image image-nav-btn next-image" type="button">
                                        <i class="bi bi-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="thumbnail-grid">
                            @foreach ($package->images as $image)
                                <div class="thumbnail-wrapper thumbnail-item active"
                                    data-image="{{ asset('' . $image->src) }}">
                                    <img src="{{ asset('' . $image->src) }}" alt="View 1" class="img-fluid">
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <!-- service Details -->
                <div class="col-lg-5" data-aos="fade-left" data-aos-delay="200">
                    <div class="product-details">
                        <div
                            class="product-badge-container  {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                            {{-- <span class="badge-category {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                {{ $category }} </span> --}}
                            <div class="rating-group">
                                <div class="stars">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="review-text">(127 @lang('global.reviews'))</span>
                            </div>
                        </div>

                        <h1 class="product-name  {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                            {{ app()->getLocale() == 'ar' ? $package->name_ar : $package->name_en }}</h1>

                        <div class="pricing-section">
                            <div class="price-display  {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">

                                <span class="sale-price"> {{ $package->price }} </span>
                                <span class="riyal-heading"></span>
                            </div>
                        </div>
                        <div class="product-description">
                            <p class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                {{ app()->getLocale() == 'ar' ? $package->description_ar : $package->description_en }} </p>
                        </div>
                        <!-- Product Variants -->
                        <div class="purchase-section">
                            <div
                                class="quantity-control col-12 {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                <label class="control-label col-2">: @lang('global.select_city') </label>
                                <div class="quantity-input-group col-10">
                                    <div class="quantity-selector">
                                        <select name="cities" class="form-control text-center w-100" id="cities">
                                            <option value="0" disabled selected>@lang('global.select_city')</option>
                                            @foreach ($cities as $city)
                                                <option value="{{ $city->id }}">
                                                    {{ app()->getLocale() == 'ar' ? $city->name_ar : $city->name_en }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="quantity-control col-12 {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                <label class="control-label col-2">: @lang('global.select_period') </label>
                                <div class="quantity-input-group col-10">
                                    <div class="quantity-selector">
                                        {{-- <input type="date" class="form-control text-center w-100"> --}}
                                        <input type="text" class="form-control text-center w-100" id="daterange">
                                    </div>
                                </div>
                            </div>
                            {{-- <div
                                class="quantity-control col-12 {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                <label class="control-label col-2">: @lang('global.quantity') </label>
                                <div class="quantity-input-group col-10">
                                    <div class="quantity-selector">
                                        <input type="number" class="quantity-input w-100 text-center qty" id="qty"
                                            value="1" min="1">
                                    </div>
                                </div>
                            </div> --}}

                            <div
                                class="action-buttons  {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                <button class="btn primary-action order_now" id="order_now" data-id="{{ $package->id }}">
                                    <i class="bi bi-bag-plus"></i>
                                    @lang('global.order_now')
                                </button>
                                <button class="btn secondary-action buy_now" id="buy_now" data-id="{{ $package->id }}">
                                    <i class="bi bi-lightning"></i>
                                    @lang('global.buy_now')
                                </button>
                                <button
                                    class="btn icon-action Add_Wishlist  {{ $package->favorite != null ? 'favorite-btn' : '' }}"
                                    id="Add_Wishlist" title="Add to Wishlist" data-id="{{ $package->id }}">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Benefits List -->
                        <div class="benefits-list">
                            @foreach ($package->features as $feature)
                                <div
                                    class="benefit-item {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row' }}">
                                    <i class="bi bi-check-circle"></i>
                                    <span>{{ app()->getLocale() == 'ar' ? $feature->description_ar : $feature->description_en }}</span>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>

            <!-- Information Tabs -->
            <div class="row mt-5" data-aos="fade-up" data-aos-delay="300">
                <div class="col-12">
                    <div class="info-tabs-container">
                        <nav class="tabs-navigation nav">
                            <button class="nav-link active" data-bs-toggle="tab"
                                data-bs-target="#ecommerce-product-details-5-overview" type="button"> @lang('global.overview')
                            </button>
                            <button class="nav-link" data-bs-toggle="tab"
                                data-bs-target="#ecommerce-product-details-5-customer-reviews" type="button">
                                @lang('global.reviews') </button>
                        </nav>

                        <div class="tab-content">
                            <!-- Overview Tab -->
                            <div class="tab-pane fade show active" id="ecommerce-product-details-5-overview">
                                <div class="overview-content">
                                    <div class="row g-4">
                                        <div
                                            class="col-lg-8  {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                            <div class="content-section">
                                                <h3> @lang('global.service_desctription') </h3>
                                                <p> {{ app()->getLocale() == 'ar' ? $package->description_ar : $package->description_en }}
                                                </p>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div
                                                class="package-contents {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                                <h4> @lang('global.service_features') </h4>
                                                <ul class="contents-list">
                                                    @foreach ($package->features as $feature)
                                                        <li
                                                            class="{{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                            <i class="bi bi-check-circle"></i>
                                                            {{ app()->getLocale() == 'ar' ? $feature->description_ar : $feature->description_en }}
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Reviews Tab -->
                            <div class="tab-pane fade" id="ecommerce-product-details-5-customer-reviews">
                                <div class="reviews-content">
                                    {{-- <div class="reviews-header">
                                        <div class="rating-overview">
                                            <div class="average-score">
                                                <div class="score-display">4.6</div>
                                                <div class="score-stars">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                </div>
                                                <div class="total-reviews">127 customer reviews</div>
                                            </div>

                                            <div class="rating-distribution">
                                                <div class="rating-row">
                                                    <span class="stars-label">5★</span>
                                                    <div class="progress-container">
                                                        <div class="progress-fill" style="width: 68%;"></div>
                                                    </div>
                                                    <span class="count-label">86</span>
                                                </div>
                                                <div class="rating-row">
                                                    <span class="stars-label">4★</span>
                                                    <div class="progress-container">
                                                        <div class="progress-fill" style="width: 22%;"></div>
                                                    </div>
                                                    <span class="count-label">28</span>
                                                </div>
                                                <div class="rating-row">
                                                    <span class="stars-label">3★</span>
                                                    <div class="progress-container">
                                                        <div class="progress-fill" style="width: 6%;"></div>
                                                    </div>
                                                    <span class="count-label">8</span>
                                                </div>
                                                <div class="rating-row">
                                                    <span class="stars-label">2★</span>
                                                    <div class="progress-container">
                                                        <div class="progress-fill" style="width: 3%;"></div>
                                                    </div>
                                                    <span class="count-label">4</span>
                                                </div>
                                                <div class="rating-row">
                                                    <span class="stars-label">1★</span>
                                                    <div class="progress-container">
                                                        <div class="progress-fill" style="width: 1%;"></div>
                                                    </div>
                                                    <span class="count-label">1</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="write-review-cta">
                                            <h4>Share Your Experience</h4>
                                            <p>Help others make informed decisions</p>
                                            <button class="btn review-btn">Write Review</button>
                                        </div>
                                    </div>

                                    <div class="customer-reviews-list">
                                        <div class="review-card">
                                            <div class="reviewer-profile">
                                                <img src="assets/img/person/person-f-3.webp" alt="Customer"
                                                    class="profile-pic">
                                                <div class="profile-details">
                                                    <div class="customer-name">Sarah Martinez</div>
                                                    <div class="review-meta">
                                                        <div class="review-stars">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                        </div>
                                                        <span class="review-date">March 28, 2024</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5 class="review-headline">Outstanding audio quality and comfort</h5>
                                            <div class="review-text">
                                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                                                    accusantium doloremque laudantium, totam rem aperiam. Eaque ipsa quae ab
                                                    illo inventore veritatis et quasi architecto beatae vitae dicta sunt
                                                    explicabo.</p>
                                            </div>
                                            <div class="review-actions">
                                                <button class="action-btn"><i class="bi bi-hand-thumbs-up"></i> Helpful
                                                    (12)</button>
                                                <button class="action-btn"><i class="bi bi-chat-dots"></i> Reply</button>
                                            </div>
                                        </div>

                                        <div class="review-card">
                                            <div class="reviewer-profile">
                                                <img src="assets/img/person/person-m-5.webp" alt="Customer"
                                                    class="profile-pic">
                                                <div class="profile-details">
                                                    <div class="customer-name">David Chen</div>
                                                    <div class="review-meta">
                                                        <div class="review-stars">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star"></i>
                                                        </div>
                                                        <span class="review-date">March 15, 2024</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5 class="review-headline">Great value, minor connectivity issues</h5>
                                            <div class="review-text">
                                                <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut
                                                    fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem
                                                    sequi nesciunt. Overall satisfied with the purchase.</p>
                                            </div>
                                            <div class="review-actions">
                                                <button class="action-btn"><i class="bi bi-hand-thumbs-up"></i> Helpful
                                                    (8)</button>
                                                <button class="action-btn"><i class="bi bi-chat-dots"></i> Reply</button>
                                            </div>
                                        </div>

                                        <div class="review-card">
                                            <div class="reviewer-profile">
                                                <img src="assets/img/person/person-f-7.webp" alt="Customer"
                                                    class="profile-pic">
                                                <div class="profile-details">
                                                    <div class="customer-name">Emily Rodriguez</div>
                                                    <div class="review-meta">
                                                        <div class="review-stars">
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                            <i class="bi bi-star-fill"></i>
                                                        </div>
                                                        <span class="review-date">February 22, 2024</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5 class="review-headline">Perfect for work-from-home setup</h5>
                                            <div class="review-text">
                                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                                    praesentium voluptatum deleniti atque corrupti quos dolores et quas
                                                    molestias excepturi sint occaecati cupiditate non provident.</p>
                                            </div>
                                            <div class="review-actions">
                                                <button class="action-btn"><i class="bi bi-hand-thumbs-up"></i> Helpful
                                                    (15)</button>
                                                <button class="action-btn"><i class="bi bi-chat-dots"></i> Reply</button>
                                            </div>
                                        </div>

                                        <div class="load-more-section">
                                            <button class="btn load-more-reviews">Show More Reviews</button>
                                        </div>
                                    </div> --}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- /Product Details Section -->
@endsection

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        flatpickr("#daterange", {
            enableTime: true,
            mode: "range",
            dateFormat: "Y-m-d H:i",
            time_24hr: true
        });

        // services.order
        $(".order_now").click(function() {
            let checkAuth = "{{ auth()->check() }}";
            if (checkAuth == 0) {
                window.location.href = "{{ route('page.login') }}";
            } else {
                let daterange = $("#daterange").val();
                let city = $("#cities").val();
                if (daterange == "") {
                    toastr.error("{{ __('global.select_period') }}");
                    return false;
                }

                if (city == "") {
                    toastr.error("{{ __('global.select_city') }}");
                    return false;
                }

                let package_id = $(this).attr('data-id');
                let url = "{{ route('packages.order') }}";

                axios.post(url, {
                    _token: '{{ csrf_token() }}',
                    package_id: package_id,
                    daterange: daterange,
                    city: city
                }).then(response => {
                    if (response.data.success) {
                        updateCart(response.data.userCartCount);
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

        // favorites.store
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
