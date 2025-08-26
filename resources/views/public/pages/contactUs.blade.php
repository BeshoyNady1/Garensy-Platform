@extends('public.layout.main')

@section('title', __('global.Contact'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.Contact') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.Contact') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('content')
    <!-- Contact 2 Section -->
    <section id="contact-2" class="contact-2 section" @if (app()->getLocale() == 'ar') dir="rtl" @endif>
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <!-- Contact Info Boxes -->
            <div class="row gy-4 mb-5">
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="contact-info-box">
                        <div class="icon-box">
                            <i class="bi bi-geo-alt"></i>
                        </div>
                        <div class="info-content">
                            <h4>عنواننا</h4>
                            <p>شارع الملك فيصل، الرياض، المملكة العربية السعودية</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="contact-info-box">
                        <div class="icon-box">
                            <i class="bi bi-envelope"></i>
                        </div>
                        <div class="info-content">
                            <h4>البريد الإلكتروني</h4>
                            <p><a href="mailto:info@yourplatform.com">info@yourplatform.com</a></p>
                            <p><a href="mailto:support@yourplatform.com">support@yourplatform.com</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="contact-info-box">
                        <div class="icon-box">
                            <i class="bi bi-headset"></i>
                        </div>
                        <div class="info-content">
                            <h4>أرقام التواصل</h4>
                            <p><a href="tel:+966123456789">+966 123 456 789</a></p>
                            <p><a href="https://wa.me/+966987654321">+966 987 654 321 (واتساب)</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Google Maps (Full Width) -->
        <div class="map-section" data-aos="fade-up" data-aos-delay="200">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3623.664393735694!2d46.698762315062!3d24.7135519841264!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e2f03890d489d9f%3A0x7a3b3b3f3b3b3b3b!2sKing%20Faisal%20St%2C%20Riyadh%20Saudi%20Arabia!5e0!3m2!1sar!2ssa!4v1698765432100!5m2!1sar!2ssa"
                width="100%" height="500" style="border: 0" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

        <!-- Contact Form Section (Overlapping) -->
        <div class="container form-container-overlap">
            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="300">
                <div class="col-lg-10">
                    <div class="contact-form-wrapper">
                        <h2 class="text-center mb-4">تواصلوا معنا</h2>

                        <form action="#" method="post" class="php-email-form">
                            @csrf
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-person"></i>
                                            <input type="text" class="form-control" name="name"
                                                placeholder="الاسم الأول" required="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-envelope"></i>
                                            <input type="email" class="form-control" name="email"
                                                placeholder="البريد الإلكتروني" required="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-text-left"></i>
                                            <input type="text" class="form-control" name="subject" placeholder="الموضوع"
                                                required="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-chat-dots message-icon"></i>
                                            <textarea class="form-control" name="message" placeholder="اكتب رسالتك..." style="height: 180px" required=""></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="loading">جاري التحميل...</div>
                                    <div class="error-message">حدث خطأ أثناء إرسال الرسالة. حاول مرة أخرى.</div>
                                    <div class="sent-message">تم إرسال رسالتك بنجاح. شكرًا لك!</div>
                                </div>

                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-submit">
                                        إرسال الرسالة
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Contact 2 Section -->
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
