<?php
if (auth()->check()) {
    $cartCount = App\Models\Cart::where('user_id', Auth::user()->id)->count() ?? 0;
    $userWishListCount = App\Models\Favorite::where('user_id', auth()->user()->id)->count() ?? 0;
}
?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title> @yield('title') </title>
        <meta name="description" content="Garensy WebSite">
        <meta name="keywords" content="Garensy WebSite">

        <!-- Favicons -->
        <link href="{{ asset('assets/img/logo.png') }}" rel="icon">
        <link href="{{ asset('assets/img/logo.png') }}" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/aos/aos.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/vendor/drift-zoom/drift-basic.css') }}" rel="stylesheet">

        <!-- Toastr CSS File -->
        <link href="{{ asset('assets/css/toastr.css') }}" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="{{ asset('assets/css/main.css') }}" rel="stylesheet">

        <style>
            .footer-contact {
                {{ app()->getLocale() == 'ar' ? 'direction: rtl;' : '' }}
            }
        </style>

        @yield('styles')
        <!-- =======================================================
            * Updated: Jul 25 2025 with Bootstrap v5.3.7
        ======================================================== -->
    </head>

    <body class="index-page">

        <header id="header" class="header sticky-top">
            <!-- Top Bar -->
            <div class="top-bar py-2">
                <div class="container-fluid container-xl">
                    <div class="row align-items-center">
                        <div class="col-lg-4 d-none d-lg-flex">
                            <div class="top-bar-item">
                                <i class="bi bi-telephone-fill me-2"></i>
                                <a href="tel:+1234567890">+1 (234) 567-890</a>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-12 text-center">
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <div class="d-flex justify-content-end">
                                <div class="top-bar-item dropdown me-3">
                                    <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="bi bi-translate me-2"></i> EN
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">
                                                <i class="bi bi-check2 me-2 selected-icon"></i>English</a></li>
                                        <li><a class="dropdown-item" href="#"> عربي </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Header -->
            @include('public.layout.header')

            <!-- Navigation -->
            @include('public.layout.menu')

            <!-- Mobile Search Form -->
            <div class="collapse" id="mobileSearch">
                <div class="container">
                    <form class="search-form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <button class="btn" type="submit">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            @yield('breadcrumb')

        </header>

        <main class="main">
            @yield('content')
        </main>

        @include('public.layout.footer')

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/php-email-form/validate.js') }}"></script>
        <script src="{{ asset('assets/vendor/swiper/swiper-bundle.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/aos/aos.js') }}"></script>
        <script src="{{ asset('assets/vendor/glightbox/js/glightbox.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/drift-zoom/Drift.min.js') }}"></script>
        <script src="{{ asset('assets/vendor/purecounter/purecounter_vanilla.js') }}"></script>

        <!-- Main JS File -->
        <script src="{{ asset('assets/js/jquery-3.3.1.min.js') }}"></script>
        <script src="{{ asset('assets/js/axios.min.js') }}"></script>
        <script src="{{ asset('assets/js/toastr.min.js') }}"></script>
        <script src="{{ asset('assets/js/main.js') }}"></script>

        <script>
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "timeOut": "5000",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };

            function updateCart(count) {
                $(".cart-num").html(count);
            }

            function updateWishList(count) {
                $(".wishlist-num").html(count);
            }
        </script>

        {{-- Spical JS --}}
        @yield('scripts')

    </body>

</html>
