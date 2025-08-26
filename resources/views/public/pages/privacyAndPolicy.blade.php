@extends('public.layout.main')

@section('title', __('global.privacy_policy'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.privacy_policy') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.privacy_policy') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('styles')
    <style>
        .privacyPolicySection {
            text-align: start;
            direction: rtl;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .header p {
            font-size: 1.1rem;
        }

        .section-title {
            text-align: start;
            color: black;
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 15px;
        }

        .list-group-item {
            border: none;
            background-color: transparent;
            padding: 10px 0;
            color: #555;
        }

        .list-group-item::before {
            content: "•";
            color: #black;
            margin-left: 5px;
        }

        .contact-info a {
            color: #black;
            text-decoration: none;
        }

        .contact-info a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2rem;
            }

            .header p {
                font-size: 1rem;
            }
        }
    </style>
@endsection

@section('content')
    <!-- Privacy Policy Section -->
    <section id="privacy-policy" class="testimonials section" dir="rtl">
        <div class="container">
            <div class="testimonial-masonry">
                <div class="testimonial-item" data-aos="fade-up">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-info-circle"></i>
                        </div>
                        <h3>مقدمة</h3>
                        <p>
                            نحن ملتزمون بحماية خصوصية المستخدمين والبيانات الشخصية التي يتم جمعها عبر منصتنا. تهدف هذه
                            السياسة
                            إلى توضيح كيفية جمعنا للبيانات، استخدامها، وحمايتها، بالإضافة إلى حقوقكم كمستخدمين.
                        </p>
                    </div>
                </div>

                <div class="testimonial-item highlight" data-aos="fade-up" data-aos-delay="100">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-database"></i>
                        </div>
                        <h3>جمع البيانات</h3>
                        <ul class="list-unstyled">
                            <li>الاسم الكامل والبريد الإلكتروني عند التسجيل.</li>
                            <li>بيانات النشاط على المنصة (مثل الخدمات المطلوبة أو المقدمة).</li>
                            <li>بيانات تقنية مثل عنوان IP ونوع المتصفح لتحسين الأداء.</li>
                        </ul>
                    </div>
                </div>

                <div class="testimonial-item" data-aos="fade-up" data-aos-delay="200">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-gear"></i>
                        </div>
                        <h3>استخدام البيانات</h3>
                        <ul class="list-unstyled">
                            <li>توفير الخدمات وتسهيل التواصل بين المستخدمين.</li>
                            <li>تحليل الاستخدام لتحسين تجربة المستخدم.</li>
                            <li>إرسال الإشعارات أو العروض المتعلقة بخدمات المنصة (بموافقتكم).</li>
                        </ul>
                    </div>
                </div>

                <div class="testimonial-item highlight" data-aos="fade-up" data-aos-delay="300">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                        <h3>حماية البيانات</h3>
                        <ul class="list-unstyled">
                            <li>تشفير البيانات أثناء النقل والتخزين.</li>
                            <li>التحقق من الأمان الدوري للأنظمة.</li>
                            <li>تقييد الوصول إلى البيانات للموظفين المخولين فقط.</li>
                        </ul>
                    </div>
                </div>

                <div class="testimonial-item" data-aos="fade-up" data-aos-delay="400">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-person-check"></i>
                        </div>
                        <h3>حقوق المستخدمين</h3>
                        <ul class="list-unstyled">
                            <li>الاطلاع على البيانات الشخصية المخزنة لدينا.</li>
                            <li>طلب تعديل أو حذف البيانات (خلال الإطار القانوني).</li>
                            <li>رفض تلقي الرسائل التسويقية عبر إعدادات الحساب.</li>
                        </ul>
                    </div>
                </div>

                <div class="testimonial-item" data-aos="fade-up" data-aos-delay="500">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-share"></i>
                        </div>
                        <h3>مشاركة البيانات</h3>
                        <ul class="list-unstyled">
                            <li>بموافقة صريحة منكم.</li>
                            <li>عند الالتزام بالتشريعات القانونية المحلية.</li>
                            <li>مع شركاء موثوقين لتقديم الخدمات (مثل مزودي الدفع).</li>
                        </ul>
                    </div>
                </div>

                <div class="testimonial-item" data-aos="fade-up" data-aos-delay="600">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-pencil-square"></i>
                        </div>
                        <h3>التعديلات على السياسة</h3>
                        <p>
                            نحتفظ بالحق في تحديث سياسة الخصوصية من وقت لآخر. سيتم إشعاركم بالتغييرات الجوهرية عبر البريد
                            الإلكتروني أو الإعلان على المنصة.
                        </p>
                    </div>
                </div>

                <div class="testimonial-item highlight" data-aos="fade-up" data-aos-delay="700">
                    <div class="testimonial-content">
                        <div class="quote-pattern">
                            <i class="bi bi-envelope"></i>
                        </div>
                        <h3>التواصل معنا</h3>
                        <p>
                            إذا كانت لديكم استفسارات أو مخاوف بشأن خصوصيتكم، يرجى التواصل معنا عبر:
                        </p>
                        <ul class="list-unstyled">
                            <li>البريد الإلكتروني: <a href="mailto:support@yourdomain.com">support@yourdomain.com</a></li>
                            <li>الهاتف: +123-456-7890</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Privacy Policy Section -->
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
