@extends('public.layout.main')

@section('title', __('global.Home'))

@section('styles')
    <style>
        section,
        .section {
            color: var(--default-color);
            background-color: var(--background-color);
            padding: 60px 0;
            scroll-margin-top: 90px;
            overflow: clip;
        }

        .category-cards .category-slider .swiper-button-next,
        .category-cards .category-slider .swiper-button-prev {
            width: 40px;
            height: 40px;
            background-color: var(--surface-color);
            border-radius: 50%;
            color: var(--heading-color);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        element.style {}

        .category-cards .category-slider .swiper-button-next {
            right: 0;
        }

        .category-cards .category-slider .swiper-button-next,
        .category-cards .category-slider .swiper-button-prev {
            width: 40px;
            height: 40px;
            background-color: var(--surface-color);
            border-radius: 50%;
            color: var(--heading-color);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .category-cards .category-slider .swiper-button-next::after,
        .category-cards .category-slider .swiper-button-prev::after {
            font-size: 1rem;
            font-weight: bold;
        }

        .info-cards .info-card .icon-box i {
            font-size: 2.5rem;
            color: var(--heading-color);
            transition: color 0.3s ease;
        }

        .info-cards .info-card h3 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--heading-color);
        }

        .info-cards .info-card p {
            font-size: 0.9rem;
            color:
                color-mix(in srgb, var(--default-color), transparent 20%);
            line-height: 1.5;
            margin-bottom: 0;
        }

        .card-animate:hover {
            transform: translateY(-5px);
            transition: transform 0.3s ease, 0.3s ease;
        }

        .card-animate:hover .icon-box i {
            color: var(--accent-color);
        }

        .category-image h3 {
            position: absolute;
            bottom: 10px;
            font-weight: bold;
            left: 10px;
            line-height: 25.2px;
            right: 10px;
            margin: 0;
            padding: 2px;
            font-size: 1.2em;
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
            text-align: center;
            border-radius: 0px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .category-image img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 20px;
        }
    </style>
@endsection

@section('content')
    <!-- Hero Section -->
    <section id="hero" class="hero section">

        <div class="hero-container">
            <div class="hero-content">
                <div class="content-wrapper" data-aos="fade-up" data-aos-delay="100">
                    <h1 class="hero-title"> قم بتعيين أفضل المستقلين لإنجاز عملك عن بعد. </h1>
                    <p class="hero-description"> شعارنا هو المصداقية و هدفنا هو ان تعثر على افضل مقدمى الخدمات فى المملكة
                        لتادية عملك و تنفيذ مهامك على اكمل وجة و بافضل جودة ممكنة
                    </p>
                    <div class="hero-actions" data-aos="fade-up" data-aos-delay="200">
                        <a href="#products" class="btn-primary"> @lang('global.order_now') </a>
                        <a href="#categories" class="btn-secondary"> @lang('global.show_categories') </a>
                    </div>
                    <div class="features-list" data-aos="fade-up" data-aos-delay="300">
                        <div class="feature-item">
                            <i class="bi bi-truck"></i>
                            {{-- <span>Free Shipping</span> --}}
                        </div>
                        <div class="feature-item">
                            <i class="bi bi-award"></i>
                            <span> ضمان الجودة </span>
                        </div>
                        <div class="feature-item">
                            <i class="bi bi-headset"></i>
                            <span>24/7 دعم </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="hero-visuals">
                <div class="product-showcase" data-aos="fade-left" data-aos-delay="200">
                    <div class="product-card featured">
                        <img src="{{ asset('assets/img/product/flowwers.png') }}" alt="Featured Product" class="img-fluid">
                        {{-- <div class="product-badge">Best Seller</div> --}}
                        <div class="product-info">
                            {{-- <h4> خدمات مميزة </h4> --}}
                            <div class="price">
                                {{-- <span class="sale-price">$299</span>
                                <span class="original-price">$399</span> --}}
                            </div>
                        </div>
                    </div>

                    <div class="product-grid">
                        <div class="product-mini" data-aos="zoom-in" data-aos-delay="400">
                            <img src="{{ asset('assets/img/product/photographers.png') }}" alt="Product" class="img-fluid">
                            {{-- <span class="mini-price">$89</span> --}}
                        </div>
                        <div class="product-mini" data-aos="zoom-in" data-aos-delay="500">
                            <img src="{{ asset('assets/img/product/drowing.png') }}" alt="Product" class="img-fluid">
                            {{-- <span class="mini-price">$149</span> --}}
                        </div>
                    </div>
                </div>

                <div class="floating-elements">
                    <div class="floating-icon cart" data-aos="fade-up" data-aos-delay="600">
                        <i class="bi bi-cart3"></i>
                        <span class="notification-dot">3</span>
                    </div>
                    <div class="floating-icon wishlist" data-aos="fade-up" data-aos-delay="700">
                        <i class="bi bi-heart"></i>
                    </div>
                    <div class="floating-icon search" data-aos="fade-up" data-aos-delay="800">
                        <i class="bi bi-search"></i>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- /Hero Section -->

    <!-- Promo Cards Section -->
    <section id="promo-cards" class="promo-cards section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4">

                <div class="col-lg-6">
                    <div class="category-featured" data-aos="fade-right" data-aos-delay="200">
                        <div class="category-image">
                            <img src="{{ asset('assets/img/product/photographers.png') }}" alt="Women's Collection"
                                class="img-fluid">
                        </div>
                        <div class="category-content">
                            <span class="category-tag text-center"> الأكثر رواجًا الآن </span>
                            <h2> مصورة محترفة </h2>
                            <p> اختارى مصورتك المحترفة بنفسك </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">

                    <div class="row gy-4">

                        <div class="col-xl-6">
                            <div class="category-card cat-men" data-aos="fade-up" data-aos-delay="300">
                                <div class="category-image">
                                    <img src="{{ asset('assets/img/product/drowing.png') }}" alt="Men's Fashion"
                                        class="img-fluid">
                                </div>
                                <div class="category-content">
                                    <h4> رسم صور شخصية </h4>
                                    <p>242 مقم للخدمة</p>
                                    <a href="#" class="card-link"> @lang('global.order_now') <i
                                            class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="category-card cat-kids" data-aos="fade-up" data-aos-delay="400">
                                <div class="category-image">
                                    <img src="{{ asset('assets/img/product/tatto.png') }}" alt="Kid's Fashion"
                                        class="img-fluid">
                                </div>
                                <div class="category-content">
                                    <h4> نقاشة حنا </h4>
                                    <p>185 مقدم للخدمة</p>
                                    <a href="#" class="card-link"> @lang('global.order_now') <i
                                            class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="category-card cat-cosmetics" data-aos="fade-up" data-aos-delay="500">
                                <div class="category-image">
                                    <img src="{{ asset('assets/img/product/flowwers.png') }}" alt="Cosmetics"
                                        class="img-fluid">
                                </div>
                                <div class="category-content">
                                    <h4> تنسيق ورد </h4>
                                    <p>127 مقدم للخدمة</p>
                                    <a href="#" class="card-link"> @lang('global.order_now') <i
                                            class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="category-card cat-accessories" data-aos="fade-up" data-aos-delay="600">
                                <div class="category-image">
                                    <img src="{{ asset('assets/img/product/widding-invtation.png') }}" alt="Accessories"
                                        class="img-fluid">
                                </div>
                                <div class="category-content">
                                    <h4> حفلات زفاف </h4>
                                    <p>308 مقدم للخدمة</p>
                                    <a href="#" class="card-link"> @lang('global.order_now') <i
                                            class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </section>
    <!-- /Promo Cards Section -->

    <!-- Primary Services Section -->
    <section id="info-cards" class="info-cards section light-background">

        <div class="container aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

            <div class="row g-4 justify-content-center" dir="rtl">
                <!-- Info Card 1 -->
                <div class="col-12 col-sm-6 col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                    <div class="info-card text-center card-animate">
                        <div class="icon-box">
                            <i class="bi bi-tools"></i>
                        </div>
                        <h3>خدمات متنوعة</h3>
                        <p>نوفر مجموعة واسعة من الخدمات المقدمة من محترفين موثوقين في مختلف المجالات لتلبية احتياجاتك
                            بكفاءة.</p>
                    </div>
                </div><!-- End Info Card 1 -->

                <!-- Info Card 2 -->
                <div class="col-12 col-sm-6 col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                    <div class="info-card text-center card-animate">
                        <div class="icon-box">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h3>جودة ومصداقية</h3>
                        <p>نضمن تقديم خدمات عالية الجودة من خلال فحص دقيق لمقدمي الخدمات والتزامهم بالمعايير المهنية.</p>
                    </div>
                </div><!-- End Info Card 2 -->

                <!-- Info Card 3 -->
                <div class="col-12 col-sm-6 col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="400">
                    <div class="info-card text-center card-animate">
                        <div class="icon-box">
                            <i class="bi bi-wallet2"></i>
                        </div>
                        <h3>عمولة عادلة</h3>
                        <p>نأخذ نسبة عمولة شفافة ومناسبة على كل خدمة لضمان استمرارية المنصة ودعم مقدمي الخدمات.</p>
                    </div>
                </div><!-- End Info Card 3 -->

                <!-- Info Card 4 -->
                <div class="col-12 col-sm-6 col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="500">
                    <div class="info-card text-center card-animate">
                        <div class="icon-box">
                            <i class="bi bi-person-check"></i>
                        </div>
                        <h3>دعم عملاء مميز</h3>
                        <p>فريق دعم عملاء متاح على مدار الساعة للإجابة عن استفساراتك وضمان تجربة سلسة ومرضية.</p>
                    </div>
                </div><!-- End Info Card 4 -->
            </div>

        </div>

    </section>
    <!-- Primary Services Section -->

    <!-- Best Sellers Section -->
    <section id="best-sellers" class="best-sellers section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <h2> @lang('global.some_categories') </h2>
            <p> بعض الفئات الشهيرة </p>
        </div>
        <!-- End Section Title -->

        <section id="category-cards" class="category-cards section p-0">

            <div class="container aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

                <div
                    class="category-slider swiper init-swiper swiper-initialized swiper-horizontal swiper-backface-hidden">
                    <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "autoplay": {
                                "delay": 5000,
                                "disableOnInteraction": false
                            },
                            "grabCursor": true,
                            "speed": 600,
                            "slidesPerView": "auto",
                            "spaceBetween": 20,
                            "navigation": {
                                "nextEl": ".swiper-button-next",
                                "prevEl": ".swiper-button-prev"
                            },
                            "breakpoints": {
                                "320": {
                                "slidesPerView": 2,
                                "spaceBetween": 15
                                },
                                "576": {
                                "slidesPerView": 3,
                                "spaceBetween": 15
                                },
                                "768": {
                                "slidesPerView": 4,
                                "spaceBetween": 20
                                },
                                "992": {
                                "slidesPerView": 5,
                                "spaceBetween": 20
                                },
                                "1200": {
                                "slidesPerView": 6,
                                "spaceBetween": 20
                                }
                            }
                            }
                    </script>

                    <div class="swiper-wrapper" id="swiper-wrapper-23c9e9fea5646652" aria-live="off"
                        style="cursor: grab; transition-duration: 0ms; transform: translate3d(-438.667px, 0px, 0px); transition-delay: 0ms;">

                        <!-- Category Card  -->
                        @foreach ($categories as $category)
                            <div class="swiper-slide" style="width: 199.333px; margin-right: 20px;" role="group"
                                aria-label="2 / 8" data-swiper-slide-index="1">
                                <div class="category-card aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                                    <div class="category-image">
                                        <img src="{{ asset('' . $category->image) }}" alt="Category" class="img-fluid"
                                            lazy="loading">
                                        <h3> {{ app()->getLocale() == 'ar' ? $category->name_ar : $category->name_en }}
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>

                    <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"
                        aria-controls="swiper-wrapper-23c9e9fea5646652"></div>
                    <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide"
                        aria-controls="swiper-wrapper-23c9e9fea5646652"></div>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                </div>

            </div>

        </section>

    </section>
    <!-- /Best Sellers Section -->

    <!-- Cards Section -->
    {{-- <section id="cards" class="cards section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row gy-4">
                <div class="col-lg-4 col-md-6 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="200">
                    <div class="product-category">
                        <h3 class="category-title">
                            <i class="bi bi-fire"></i> Trending Now
                        </h3>
                        <div class="product-list">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-1.webp') }}" alt="Premium Leather Tote"
                                        class="img-fluid">
                                    <div class="product-badges">
                                        <span class="badge-new">New</span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Premium Leather Tote</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <span>(24)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$87.50</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-3.webp') }}" alt="Statement Earrings"
                                        class="img-fluid">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Statement Earrings</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <span>(41)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$39.99</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-5.webp') }}"
                                        alt="Organic Cotton Shirt" class="img-fluid">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Organic Cotton Shirt</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <span>(18)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$45.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="300">
                    <div class="product-category">
                        <h3 class="category-title">
                            <i class="bi bi-award"></i> Best Sellers
                        </h3>
                        <div class="product-list">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-2.webp') }}" alt="Slim Fit Denim"
                                        class="img-fluid">
                                    <div class="product-badges">
                                        <span class="badge-sale">-15%</span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Slim Fit Denim</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <span>(87)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$68.00</span>
                                        <span class="old-price">$80.00</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-6.webp') }}" alt="Designer Handbag"
                                        class="img-fluid">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Designer Handbag</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <span>(56)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$129.99</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-8.webp') }}" alt="Leather Crossbody"
                                        class="img-fluid">
                                    <div class="product-badges">
                                        <span class="badge-hot">Hot</span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Leather Crossbody</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <span>(112)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$95.50</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="400">
                    <div class="product-category">
                        <h3 class="category-title">
                            <i class="bi bi-star"></i> Featured Items
                        </h3>
                        <div class="product-list">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-7.webp') }}" alt="Pleated Midi Skirt"
                                        class="img-fluid">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Pleated Midi Skirt</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <span>(32)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$75.00</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-4.webp') }}" alt="Geometric Earrings"
                                        class="img-fluid">
                                    <div class="product-badges">
                                        <span class="badge-limited">Limited</span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Geometric Earrings</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <span>(47)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$42.99</span>
                                    </div>
                                </div>
                            </div>

                            <div class="product-card">
                                <div class="product-image">
                                    <img src="{{ asset('assets/img/product/product-9.webp') }}" alt="Structured Satchel"
                                        class="img-fluid">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Structured Satchel</h4>
                                    <div class="product-rating">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <span>(64)</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="current-price">$89.99</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section> --}}
    <!-- /Cards Section -->

@endsection

@section('scripts')

@endsection
