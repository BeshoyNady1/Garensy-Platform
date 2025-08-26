<div class="main-header">
    <div class="container-fluid container-xl">
        <div class="d-flex py-3 align-items-center justify-content-between flex-row-reverse">

            <!-- Logo -->
            <a href="{{ route('home') }}" class="logo d-flex align-items-center">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <img src="{{ asset('assets/img/logo.png') }}" alt="">
                {{-- <h1 class="sitename">  </h1> --}}
            </a>

            <!-- Search -->
            <form class="search-form desktop-search-form">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="{{ __('global.search') }}">
                    <button class="btn" type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>

            <!-- Actions -->
            <div class="header-actions d-flex align-items-center justify-content-end">

                <!-- Mobile Search Toggle -->
                <button class="header-action-btn mobile-search-toggle d-xl-none" type="button"
                    data-bs-toggle="collapse" data-bs-target="#mobileSearch" aria-expanded="false"
                    aria-controls="mobileSearch">
                    <i class="bi bi-search"></i>
                </button>

                <!-- Account -->
                <div class="dropdown account-dropdown">
                    <button class="header-action-btn" data-bs-toggle="dropdown">
                        <i class="bi bi-person"></i>
                    </button>
                    <div class="dropdown-menu">
                        <div class="dropdown-header text-center">
                            @if (auth()->check())
                                <h6> {{ Auth::user()->name }} </h6>
                                <p class="mb-0"> @lang('global.client_name') </p>
                            @else
                                <p class="mb-0"> @lang('global.unknown') </p>
                            @endif
                        </div>
                        <div class="dropdown-body">
                            <a class="dropdown-item d-flex align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}"
                                href="account.html">
                                <i class="bi bi-person-circle mlr-5"></i>
                                <span> @lang('global.my_account') </span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}"
                                href="account.html">
                                <i class="bi bi-bag-check mlr-5"></i>
                                <span> @lang('global.my_orders') </span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}"
                                href="account.html">
                                <i class="bi bi-heart mlr-5"></i>
                                <span> @lang('global.my_wishlist')</span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}"
                                href="account.html">
                                <i class="bi bi-gear mlr-5"></i>
                                <span> @lang('global.settings') </span>
                            </a>
                        </div>
                        <div class="dropdown-footer">
                            @if (auth()->check())
                                <form action="{{ route('logout') }}" method="POST">@csrf
                                    <input type="submit" value="{{ __('global.logout') }}"
                                        class="btn btn-primary w-100 mb-2">
                                </form>
                            @else
                                <a href="{{ route('page.login') }}" class="btn btn-primary w-100 mb-2">
                                    @lang('global.login')
                                </a>
                                <a href="{{ route('page.register') }}" class="btn btn-outline-primary w-100">
                                    @lang('global.create_account') </a>
                            @endif
                        </div>
                    </div>
                </div>

                <!-- Wishlist -->
                <a href="account.html" class="header-action-btn d-none d-md-block">
                    <i class="bi bi-heart"></i>
                    <span class="badge wishlist-num"> {{ $userWishListCount ?? 0 }} </span>
                </a>
                <!-- Cart -->
                <a href="{{ auth()->check() ? route('carts.index') : route('page.login') }}" class="header-action-btn">
                    <i class="bi bi-cart3"></i>
                    <span class="badge cart-num">{{ $cartCount ?? 0 }}</span>
                </a>
                <!-- Mobile Navigation Toggle -->
                <i class="mobile-nav-toggle d-xl-none bi bi-list me-0"></i>

            </div>
        </div>
    </div>
</div>
