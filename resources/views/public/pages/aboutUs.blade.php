@extends('public.layout.main')

@section('title', __('global.About'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.About') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.About') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('styles')
    <style>
        .testimonialSection {
            min-height: 400px;
            background-image: url('{{ asset('assets/img/aboutus2.webp') }}');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #fff;
            text-align: center;
            padding: 50px;
        }

        .features-boxes .feature-box {
            {{ app()->getLocale() == 'ar' ? 'direction: rtl;' : '' }}
        }
    </style>
@endsection

@section('content')
    <!-- About Section Begin -->
    <section id="about-2" class="about-2 section">
        <div class="container {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row text-start' }}"
            data-aos="fade-up" data-aos-delay="100">
            <span class="section-badge"><i class="bi bi-info-circle"></i> @lang('global.About') </span>
            <div class="row {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row text-start' }}">
                <div class="col-lg-6">
                    <h2 class="about-title">منصة رائدة لربط مقدمي الخدمات بالعملاء</h2>
                    <p class="about-description">
                        نحن منصة رقمية تهدف إلى تسهيل التواصل بين مقدمي الخدمات والعملاء من خلال تجربة مستخدم سلسة وموثوقة.
                        نسعى لتقديم خدمات عالية الجودة تلبي احتياجات الجميع بكفاءة وسهولة.
                    </p>
                </div>
                <div class="col-lg-6">
                    <p class="about-text">
                        نهدف إلى تمكين مقدمي الخدمات من عرض مهاراتهم بأفضل طريقة ممكنة، مع توفير بيئة سهلة الاستخدام للعملاء
                        للعثور على الخدمات التي يحتاجونها بسرعة وكفاءة.
                    </p>
                    <p class="about-text">
                        من خلال واجهة مستخدم بسيطة ودعم مستمر، نضمن تجربة تواصل فعالة تحقق رضا الطرفين وتساهم في تحقيق
                        أهدافهم.
                    </p>
                </div>
            </div>

            <div class="row features-boxes gy-4 mt-3">
                <div class="col-lg-4 col-md-4 col-sm-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-box">
                        <div class="icon-box">
                            <i class="bi bi-bullseye"></i>
                        </div>
                        <h3><a href="#" class="stretched-link">من نحن؟</a></h3>
                        <p>
                            نحن منصة رائدة لربط مقدمي الخدمات بالعملاء الراغبين في الحصول على خدمات متنوعة. نهدف إلى تسهيل
                            التواصل بين الطرفين من خلال بيئة رقمية موثوقة وسهلة الاستخدام، مع ضمان تقديم تجربة مميزة تلبي
                            احتياجات الجميع.
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="feature-box">
                        <div class="icon-box">
                            <i class="bi bi-person-check"></i>
                        </div>
                        <h3><a href="#" class="stretched-link">ماذا نقدم؟</a></h3>
                        <p>
                            نقدم منصة متكاملة تتيح لمقدمي الخدمات عرض مهاراتهم وخدماتهم بأفضل جودة، وللعملاء البحث عن
                            الخدمات التي يحتاجونها بسهولة وسرعة. من خلال واجهة مستخدم بسيطة وفعالة، نضمن تجربة تواصل سلسة
                            ونتائج مرضية.
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6" data-aos="fade-up" data-aos-delay="400">
                    <div class="feature-box">
                        <div class="icon-box">
                            <i class="bi bi-clipboard-data"></i>
                        </div>
                        <h3><a href="#" class="stretched-link">لماذا تختارنا؟</a></h3>
                        <p>
                            نتميز بالجودة العالية والاحترافية في تقديم خدماتنا، مع التركيز على رضا العملاء ومقدمي الخدمات
                            على حد سواء. منصتنا مصممة لتوفير أفضل تجربة ممكنة من خلال دعم مستمر، واجهة سهلة، وتواصل فعال
                            يضمن تحقيق أهدافك بكفاءة.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-6 p-0">
                    <div class="testimonial__text text-center p-4">
                        <span class="icon_quotations"><i class="fas fa-quote-right"></i></span>
                        <h3 class="mt-3">ربط الأحلام بالواقع</h3>
                        <p class="lead">
                            “نحن هنا لربط مقدمي الخدمات بالعملاء بطريقة سهلة وفعالة، مع ضمان تجربة احترافية
                            بأعلى معايير الجودة.”
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 p-0 testimonialSection">
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Stats Section -->
    <section id="stats" class="stats section light-background" dir="rtl">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4">
                <div class="col-lg-3 col-md-6">
                    <div class="stats-item">
                        <i class="bi bi-emoji-smile"></i>
                        <span data-purecounter-start="0" data-purecounter-end="1500" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>
                            <strong>عملاء سعداء</strong>
                            <span>أكثر من 1500 عميل يثقون بخدماتنا</span>
                        </p>
                    </div>
                </div>
                <!-- End Stats Item -->

                <div class="col-lg-3 col-md-6">
                    <div class="stats-item">
                        <i class="bi bi-journal-richtext"></i>
                        <span data-purecounter-start="0" data-purecounter-end="2000" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>
                            <strong>خدمات مقدمة</strong>
                            <span>أكثر من 2000 خدمة تم تقديمها بنجاح</span>
                        </p>
                    </div>
                </div>
                <!-- End Stats Item -->

                <div class="col-lg-3 col-md-6">
                    <div class="stats-item">
                        <i class="bi bi-headset"></i>
                        <span data-purecounter-start="0" data-purecounter-end="5000" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>
                            <strong>ساعات دعم</strong>
                            <span>دعم مستمر على مدار الساعة</span>
                        </p>
                    </div>
                </div>
                <!-- End Stats Item -->

                <div class="col-lg-3 col-md-6">
                    <div class="stats-item">
                        <i class="bi bi-people"></i>
                        <span data-purecounter-start="0" data-purecounter-end="50" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>
                            <strong>مقدمي خدمات</strong>
                            <span>فريق من المحترفين في خدمتك</span>
                        </p>
                    </div>
                </div>
                <!-- End Stats Item -->
            </div>
        </div>
    </section>
    <!-- /Stats Section -->
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
