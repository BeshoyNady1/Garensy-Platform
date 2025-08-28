@extends('public.layout.main')

@section('title', __('global.Profile'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.Profile') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.Profile') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('styles')
    <style>
        .account .profile-menu .menu-nav .nav-link i,
        .account .profile-menu .menu-footer a.logout-link i {
            {{ app()->getLocale() == 'ar' ? ' margin-left: 12px; margin-right: 0;' : '' }}
        }
    </style>
@endsection

@section('content')
    <!-- Account Section -->
    <section id="account" class="account section">

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <!-- Mobile Menu Toggle -->
            <div class="mobile-menu d-lg-none mb-4">
                <button class="mobile-menu-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#profileMenu">
                    <i class="bi bi-grid"></i>
                    <span> @lang('global.menu') </span>
                </button>
            </div>

            <div class="row g-4 flex-row-reverse">
                <!-- Profile Menu -->
                <div class="col-lg-3">
                    <div class="profile-menu collapse d-lg-block" id="profileMenu">
                        <!-- User Info -->
                        <div class="user-info" data-aos="fade-right">
                            <div class="user-avatar">
                                <img src="{{ asset(auth()->user()->image) }}" alt="Profile" loading="lazy">
                                <span class="status-badge"><i class="bi bi-shield-check"></i></span>
                            </div>
                            <h4> {{ auth()->user()->name }} </h4>
                            <div class="user-status">
                                <i class="bi bi-award"></i>
                                <span> @lang('global.' . auth()->user()->role) </span>
                            </div>
                        </div>

                        <!-- Navigation Menu -->
                        <nav class="menu-nav">
                            <ul class="nav flex-column" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link {{ $page == 'orders' ? 'active' : '' }} {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#orders">
                                        <i class="bi bi-box-seam"></i>
                                        <span> @lang('global.my_orders') </span>
                                        <span class="badge"> {{ auth()->user()->orders()->count() }} </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{ $page == 'wishlist' ? 'active' : '' }} {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#wishlist">
                                        <i class="bi bi-heart"></i>
                                        <span> @lang('global.my_wishlist') </span>
                                        <span class="badge wishlist-num"> {{ auth()->user()->favorites()->count() }} </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{ $page == 'wallet' ? 'active' : '' }} {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#wallet">
                                        <i class="bi bi-wallet2"></i>
                                        <span> @lang('global.payment_methods') </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{ $page == 'reviews' ? 'active' : '' }} {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#reviews">
                                        <i class="bi bi-star"></i>
                                        <span> @lang('global.my_reviews') </span>
                                    </a>
                                </li>
                                {{-- <li class="nav-item">
                                    <a class="nav-link {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#addresses">
                                        <i class="bi bi-geo-alt"></i>
                                        <span>Addresses</span>
                                    </a>
                                </li> --}}
                                <li class="nav-item">
                                    <a class="nav-link {{ $page == 'settings' ? 'active' : '' }} {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                        data-bs-toggle="tab" href="#settings">
                                        <i class="bi bi-gear"></i>
                                        <span> @lang('global.settings') </span>
                                    </a>
                                </li>
                            </ul>

                            <div class="menu-footer">
                                {{-- <a href="#"
                                    class="help-link {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}">
                                    <i class="bi bi-question-circle"></i>
                                    <span>Help Center</span>
                                </a> --}}
                                <a href="{{ route('logout') }}"
                                    class="logout-link {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span> @lang('global.logout') </span>
                                </a>
                            </div>
                        </nav>
                    </div>
                </div>

                <!-- Content Area -->
                <div class="col-lg-9">
                    <div class="content-area">
                        <div class="tab-content">
                            <!-- Orders Tab -->
                            <div class="tab-pane fade {{ $page == 'orders' ? 'show active' : '' }}" id="orders">
                                <div class="section-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}"
                                    data-aos="fade-up">
                                    <h2> @lang('global.my_orders') </h2>
                                    <div class="header-actions">
                                        <div class="search-box">
                                            <i class="bi bi-search"></i>
                                            <input type="text" placeholder="{{ __('global.search') }}">
                                        </div>
                                        <div class="dropdown">
                                            <button class="filter-btn" data-bs-toggle="dropdown">
                                                <i class="bi bi-funnel"></i>
                                                <span> @lang('global.filter') </span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#"> @lang('global.all') </a></li>
                                                <li><a class="dropdown-item" href="#"> @lang('global.pending') </a></li>
                                                <li><a class="dropdown-item" href="#"> @lang('global.confirmed') </a></li>
                                                <li><a class="dropdown-item" href="#"> @lang('global.Canceled') </a></li>
                                                <li><a class="dropdown-item" href="#"> @lang('global.finished') </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- Orders Tab -->
                                <div class="orders-grid">
                                    <!-- Order Card -->
                                    <?php $counter = 1; ?>
                                    @foreach ($orders as $order)
                                        <div class="order-card" data-aos="fade-up" data-aos-delay="{{ $counter }}00">
                                            <div
                                                class="order-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : '' }}">
                                                <div
                                                    class="order-id {{ app()->getLocale() == 'ar' ? 'd-flex flex-row-reverse' : '' }}">
                                                    <span class="label m-1"> @lang('global.order_id') </span>
                                                    <span class="value">#{{ $order->id }}</span>
                                                </div>
                                                <div class="order-date">{{ $order->created_at }}</div>
                                            </div>
                                            <div class="order-content">
                                                <div
                                                    class="product-grid {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : '' }}">
                                                    @foreach ($order->orderItems as $item)
                                                        <img src="{{ asset('' . $item->firstImage()->src) }}"
                                                            alt="Product" loading="lazy">
                                                    @endforeach

                                                </div>
                                                <div class="order-info">
                                                    <div
                                                        class="info-row {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : '' }}">
                                                        <span> @lang('global.status') </span>
                                                        <span class="status processing">@lang('global.' . $order->status)</span>
                                                    </div>
                                                    <div
                                                        class="info-row {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : '' }}">
                                                        <span> @lang('global.service_count') </span>
                                                        <span> {{ $order->orderItems->count() }} </span>
                                                    </div>
                                                    <div
                                                        class="info-row {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : '' }}">
                                                        <span> @lang('global.total') </span>
                                                        <span class="price">
                                                            <span class="riyal-heading"></span>
                                                            {{ $order->total_amount }}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="order-footer">
                                                <button type="button" class="btn-track" data-bs-toggle="collapse"
                                                    data-bs-target="#tracking{{ $counter }}" aria-expanded="false">
                                                    @lang('global.track_order')
                                                </button>
                                                <button type="button" class="btn-details" data-bs-toggle="collapse"
                                                    data-bs-target="#details{{ $counter }}" aria-expanded="false">
                                                    @lang('global.view_details')
                                                </button>
                                            </div>

                                            <!-- Order Tracking -->
                                            <div class="collapse tracking-info {{ app()->getLocale() == 'ar' ? 'text-end' : '' }}"
                                                id="tracking{{ $counter }}">
                                                <div
                                                    class="tracking-timeline {{ $order->status == 'pending' ? 'active' : '' }} {{ $order->status == 'confirmed' ? 'completed' : '' }} {{ $order->status == 'finished' ? 'completed' : '' }}">
                                                    <div
                                                        class="timeline-item {{ $order->status == 'pending' ? 'active' : 'completed' }}">
                                                        <div class="timeline-icon">
                                                            <i class="bi bi-hourglass-split"></i>
                                                        </div>
                                                        <div class="timeline-content">
                                                            <h5>@lang('global.order_is_pinnding')</h5>
                                                            <p>@lang('global.your_request_has_been_sent_to_the_service_provider_and_is_being_reviewed_by_the_service_provider')</p>
                                                        </div>
                                                    </div>

                                                    <div
                                                        class="timeline-item {{ $order->status == 'confirmed' ? 'active' : '' }} {{ $order->status == 'finished' ? 'completed' : '' }}">
                                                        <div class="timeline-icon">
                                                            <i class="bi bi-check-circle-fill"></i>
                                                        </div>
                                                        <div class="timeline-content">
                                                            <h5>@lang('global.order_is_confirmed')</h5>
                                                            <p>@lang('global.your_request_has_been_approved_by_the_service_provider_and_is_being_processed')</p>
                                                        </div>
                                                    </div>

                                                    <div
                                                        class="timeline-item {{ $order->status == 'finished' ? 'active' : '' }}">
                                                        <div class="timeline-icon">
                                                            <i class="bi bi-check-all"></i>
                                                        </div>
                                                        <div class="timeline-content">
                                                            <h5>@lang('global.order_is_finished')</h5>
                                                            <p>@lang('global.your_request_has_been_processed_please_rate_the_service')</p>
                                                        </div>
                                                    </div>

                                                    <div
                                                        class="timeline-item {{ $order->status == 'canceled' ? 'active' : '' }}">
                                                        <div class="timeline-icon">
                                                            <i class="bi bi-x-circle-fill"></i>
                                                        </div>
                                                        <div class="timeline-content">
                                                            <h5>@lang('global.order_is_cancelled')</h5>
                                                            <p>@lang('global.your_request_has_been_cancelled')</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Order Details -->
                                            <div class="collapse order-details" id="details{{ $counter }}">
                                                <div class="details-content">
                                                    <div
                                                        class="detail-section {{ app()->getLocale() == 'ar' ? 'text-end' : '' }}">
                                                        <h5> @lang('global.order_details') </h5>
                                                    </div>

                                                    <div class="detail-section text-end">
                                                        <h5> {{ $order->orderItems->count() }} @lang('global.items_count') </h5>
                                                        <div class="order-items">
                                                            @foreach ($order->orderItems as $item)
                                                                <div
                                                                    class="item {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                                    <img src="{{ asset('' . $item->firstImage()->src) }}"
                                                                        alt="Product" loading="lazy">
                                                                    <div class="item-info">
                                                                        <h6> {{ app()->getLocale() == 'ar' ? $item->firstNameAr() : $item->firstNameEn() }}
                                                                        </h6>
                                                                        <div
                                                                            class="item-meta {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                                            <span>
                                                                                {{ $item->start_date }} -
                                                                                {{ $item->end_date }}
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="item-price"> {{ $item->price }}
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php $counter++; ?>
                                    @endforeach
                                </div>
                            </div>

                            <!-- Wishlist Tab -->
                            <div class="tab-pane fade {{ $page == 'wishlist' ? 'show active' : '' }}" id="wishlist">
                                <div class="section-header flex-row-reverse" data-aos="fade-up">
                                    <h2> @lang('global.favorite_services') </h2>
                                </div>

                                <div class="wishlist-grid">
                                    <!-- Wishlist Item 1 -->
                                    @foreach ($favoridsItems as $item)
                                        <div class="wishlist-card" data-aos="fade-up"
                                            data-aos-delay="{{ $item->id }}00">
                                            <div class="wishlist-image">
                                                <img src="{{ asset('' . $item->image_src) }}" alt="Product"
                                                    loading="lazy">
                                                <button class="btn-remove Add_Wishlist" type="button"
                                                    data-id="{{ $item->id }}" data-type="{{ $item->type }}"
                                                    aria-label="Remove from wishlist">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                                {{-- <div class="sale-badge">-20%</div > --}}
                                            </div>
                                            <div class="wishlist-content">
                                                <h4>{{ app()->getLocale() == 'ar' ? $item->name_ar : $item->name_en }}</h4>
                                                <h6>{{ app()->getLocale() == 'ar' ? $item->description_ar : $item->description_en }}
                                                </h6>
                                                <div class="product-meta">
                                                    <div class="rating">
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-half"></i>
                                                        <span>(4.5)</span>
                                                    </div>
                                                    <div class="price">
                                                        <span class="current"> {{ $item->price }} </span>
                                                        {{-- <span class="original">$99.99</span> --}}
                                                    </div>
                                                </div>
                                                {{-- <button type="button" class="btn-add-cart">Add to Cart</button> --}}
                                            </div>
                                        </div>
                                    @endforeach

                                    <!-- Wishlist Item 2 -->
                                    {{-- <div class="wishlist-card" data-aos="fade-up" data-aos-delay="200">
                                        <div class="wishlist-image">
                                            <img src="assets/img/product/product-2.webp" alt="Product" loading="lazy">
                                            <button class="btn-remove" type="button" aria-label="Remove from wishlist">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                        <div class="wishlist-content">
                                            <h4>Consectetur adipiscing elit</h4>
                                            <div class="product-meta">
                                                <div class="rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                    <span>(4.0)</span>
                                                </div>
                                                <div class="price">
                                                    <span class="current">$149.99</span>
                                                </div>
                                            </div>
                                            <button type="button" class="btn-add-cart">Add to Cart</button>
                                        </div>
                                    </div>

                                    <!-- Wishlist Item 3 -->
                                    <div class="wishlist-card" data-aos="fade-up" data-aos-delay="300">
                                        <div class="wishlist-image">
                                            <img src="assets/img/product/product-3.webp" alt="Product" loading="lazy">
                                            <button class="btn-remove" type="button" aria-label="Remove from wishlist">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                            <div class="out-of-stock-badge">Out of Stock</div>
                                        </div>
                                        <div class="wishlist-content">
                                            <h4>Sed do eiusmod tempor</h4>
                                            <div class="product-meta">
                                                <div class="rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <span>(5.0)</span>
                                                </div>
                                                <div class="price">
                                                    <span class="current">$199.99</span>
                                                </div>
                                            </div>
                                            <button type="button" class="btn-notify">Notify When Available</button>
                                        </div>
                                    </div> --}}
                                </div>
                            </div>

                            <!-- Payment Methods Tab -->
                            <div class="tab-pane fade {{ $page == 'wallet' ? 'show active' : '' }}" id="wallet">
                                <div class="section-header" data-aos="fade-up">
                                    <h2> @lang('global.payment_methods') </h2>
                                    <div class="header-actions">
                                        <button type="button" class="btn primary-action btn-add-new">
                                            <i class="bi bi-plus-lg"></i>
                                            @lang('global.add_new_card')
                                        </button>
                                    </div>
                                </div>

                                <div class="payment-cards-grid">
                                    <!-- Payment Card 1 -->
                                    <div class="payment-card default" data-aos="fade-up" data-aos-delay="100">
                                        <div class="card-header">
                                            <i class="bi bi-credit-card"></i>
                                            <div class="card-badges">
                                                <span class="default-badge">Default</span>
                                                <span class="card-type">Visa</span>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-number">•••• •••• •••• 4589</div>
                                            <div class="card-info">
                                                <span>Expires 09/2026</span>
                                            </div>
                                        </div>
                                        <div class="card-actions">
                                            <button type="button" class="btn-edit">
                                                <i class="bi bi-pencil"></i>
                                                Edit
                                            </button>
                                            <button type="button" class="btn-remove">
                                                <i class="bi bi-trash"></i>
                                                Remove
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Payment Card 2 -->
                                    <div class="payment-card" data-aos="fade-up" data-aos-delay="200">
                                        <div class="card-header">
                                            <i class="bi bi-credit-card"></i>
                                            <div class="card-badges">
                                                <span class="card-type">Mastercard</span>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-number">•••• •••• •••• 7821</div>
                                            <div class="card-info">
                                                <span>Expires 05/2025</span>
                                            </div>
                                        </div>
                                        <div class="card-actions">
                                            <button type="button" class="btn-edit">
                                                <i class="bi bi-pencil"></i>
                                                Edit
                                            </button>
                                            <button type="button" class="btn-remove">
                                                <i class="bi bi-trash"></i>
                                                Remove
                                            </button>
                                            <button type="button" class="btn-make-default">Make Default</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Reviews Tab -->
                            <div class="tab-pane fade {{ $page == 'reviews' ? 'show active' : '' }}" id="reviews">
                                <div class="section-header" data-aos="fade-up">
                                    <h2>My Reviews</h2>
                                    <div class="header-actions">
                                        <div class="dropdown">
                                            <button class="filter-btn" data-bs-toggle="dropdown">
                                                <i class="bi bi-funnel"></i>
                                                <span>Sort by: Recent</span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Recent</a></li>
                                                <li><a class="dropdown-item" href="#">Highest Rating</a></li>
                                                <li><a class="dropdown-item" href="#">Lowest Rating</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="reviews-grid">
                                    <!-- Review Card 1 -->
                                    <div class="review-card" data-aos="fade-up" data-aos-delay="100">
                                        <div class="review-header">
                                            <img src="assets/img/product/product-1.webp" alt="Product"
                                                class="product-image" loading="lazy">
                                            <div class="review-meta">
                                                <h4>Lorem ipsum dolor sit amet</h4>
                                                <div class="rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <span>(5.0)</span>
                                                </div>
                                                <div class="review-date">Reviewed on Feb 15, 2025</div>
                                            </div>
                                        </div>
                                        <div class="review-content">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <div class="review-footer">
                                            <button type="button" class="btn-edit">Edit Review</button>
                                            <button type="button" class="btn-delete">Delete</button>
                                        </div>
                                    </div>

                                    <!-- Review Card 2 -->
                                    <div class="review-card" data-aos="fade-up" data-aos-delay="200">
                                        <div class="review-header">
                                            <img src="assets/img/product/product-2.webp" alt="Product"
                                                class="product-image" loading="lazy">
                                            <div class="review-meta">
                                                <h4>Consectetur adipiscing elit</h4>
                                                <div class="rating">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                    <span>(4.0)</span>
                                                </div>
                                                <div class="review-date">Reviewed on Feb 10, 2025</div>
                                            </div>
                                        </div>
                                        <div class="review-content">
                                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                                                ut
                                                aliquip ex ea commodo consequat.</p>
                                        </div>
                                        <div class="review-footer">
                                            <button type="button" class="btn-edit">Edit Review</button>
                                            <button type="button" class="btn-delete">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Settings Tab -->
                            <div class="tab-pane fade {{ $page == 'settings' ? 'show active' : '' }}" id="settings">
                                <div class="section-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row text-start' }}"
                                    data-aos="fade-up">
                                    <h2> @lang('global.account_settings') </h2>
                                </div>

                                <div class="settings-content">
                                    <!-- Personal Information -->
                                    <div class="settings-section text-end" data-aos="fade-up">
                                        <h3> @lang('global.personal_information') </h3>
                                        <form class="php-email-form settings-form">
                                            <div
                                                class="row g-3 {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <div class="col-md-12">
                                                    <label for="name" class="form-label"> @lang('global.name') </label>
                                                    <input type="text"
                                                        class="form-control {{ app()->getLocale() == 'ar' ? 'text-center' : 'text-start' }}"
                                                        id="name" value="{{ Auth::user()->name }}" required="">
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="email" class="form-label"> @lang('global.email') </label>
                                                    <input type="email"
                                                        class="form-control {{ app()->getLocale() == 'ar' ? 'text-center' : 'text-start' }}"
                                                        id="email" value="{{ Auth::user()->email }}" required="">
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="phone" class="form-label"> @lang('global.phone') </label>
                                                    <input type="tel"
                                                        class="form-control {{ app()->getLocale() == 'ar' ? 'text-center' : 'text-start' }}"
                                                        id="phone" value="{{ Auth::user()->phone }}">
                                                </div>
                                            </div>

                                            <div class="form-buttons">
                                                <button type="submit" class="btn-save"> @lang('global.save_changes') </button>
                                            </div>

                                            <div class="loading"> @lang('global.loading') </div>
                                            <div class="error-message"></div>
                                            <div class="sent-message"> @lang('global.your_profile_has_been_updated_successfully') </div>
                                        </form>
                                    </div>

                                    <!-- Security Settings -->
                                    <div class="settings-section {{ app()->getLocale() == 'ar' ? 'text-end' : '' }}"
                                        data-aos="fade-up" data-aos-delay="200">
                                        <h3> @lang('global.security_settings') </h3>
                                        <form class="php-email-form settings-form">
                                            <div class="row g-3">
                                                <div class="col-md-12">
                                                    <label for="currentPassword" class="form-label"> @lang('global.current_password')
                                                    </label>
                                                    <input type="password" class="form-control" id="currentPassword"
                                                        required="">
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="newPassword" class="form-label"> @lang('global.new_password')
                                                    </label>
                                                    <input type="password" class="form-control" id="newPassword"
                                                        required="">
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="confirmPassword" class="form-label"> @lang('global.confirm_password')
                                                    </label>
                                                    <input type="password" class="form-control" id="confirmPassword"
                                                        required="">
                                                </div>
                                            </div>

                                            <div class="form-buttons">
                                                <button type="submit" class="btn-save"> @lang('global.change_password') </button>
                                            </div>

                                            <div class="loading"> @lang('global.loading') </div>
                                            <div class="error-message"></div>
                                            <div class="sent-message"> @lang('global.your_password_has_been_updated_successfully')
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Delete Account -->
                                    <div class="settings-section danger-zone {{ app()->getLocale() == 'ar' ? 'text-end' : '' }}"
                                        data-aos="fade-up" data-aos-delay="300">
                                        <h3> @lang('global.delete_account') </h3>
                                        <div class="danger-zone-content">
                                            <p> @lang('global.delete_account_warning')
                                            </p>
                                            <button type="button" class="btn-danger"> @lang('global.delete_account') </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

    </section>
    <!-- /Account Section -->
@endsection

@section('scripts')
    <script>
        $(".Add_Wishlist").click(function(e) {
            e.preventDefault();
            let checkAuth = "{{ auth()->check() }}";
            if (checkAuth == 0) {
                window.location.href = "{{ route('page.login') }}";
            } else {
                let $button = $(this);
                let type = $(this).attr('data-type');
                let package_id = null;
                let service_id = null;
                if (type == 'service') {
                    service_id = $(this).attr('data-id');
                } else if (type == 'package') {
                    package_id = $(this).attr('data-id');
                }

                let url = "{{ route('favorites.store') }}";
                axios.post(url, {
                    _token: '{{ csrf_token() }}',
                    package_id: package_id,
                    service_id: service_id
                }).then(response => {
                    if (response.data.success) {
                        $button.closest('.wishlist-card').remove();
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
