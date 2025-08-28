@extends('public.layout.main')

@section('title', __('global.checkout'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.checkout') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.checkout') </li>
                    <li> <a href="{{ route('carts.index') }}"> @lang('global.cart') </a></li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('styles')
@endsection

@section('content')
    @php $total = 0; @endphp
    <!-- Checkout Section -->
    <section id="checkout" class="checkout section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row flex-row-reverse">
                <div class="col-lg-5">
                    <!-- Order Summary -->
                    <div class="order-summary" data-aos="fade-left" data-aos-delay="200">
                        <div
                            class="order-summary-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                            <h3> @lang('global.order_summary') </h3>
                            <span class="item-count">{{ count($cartItems) }} @lang('global.items_count')</span>
                        </div>

                        <div class="order-summary-content">
                            <div class="order-items">
                                @foreach ($cartItems as $cartItem)
                                    <div
                                        class="order-item {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                        <div class="order-item-image">
                                            <img src="{{ asset('' . $cartItem->image_src) }}" alt="Product"
                                                class="img-fluid">
                                        </div>
                                        <div
                                            class="order-item-details  {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                            <h4> {{ app()->getLocale() == 'ar' ? $cartItem->item_name_ar : $cartItem->item_name_en }}
                                            </h4>
                                            <p class="order-item-variant">{{ $cartItem->start_date }} -
                                                {{ $cartItem->end_date }}</p>
                                            <div
                                                class="order-item-price  {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <span class="quantity">* {{ $cartItem->qty }}</span>

                                                <span class="price">
                                                    <span class="riyal-heading"></span>
                                                    {{ number_format($cartItem->price, 2) }}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    @php $total += $cartItem->price * $cartItem->qty; @endphp
                                @endforeach
                            </div>

                            <div class="order-totals">
                                <div
                                    class="order-total d-flex justify-content-between {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                    <span> @lang('global.total') </span>
                                    <span><span class="riyal-heading"></span> {{ $total }} </span>
                                </div>
                            </div>

                            <div class="secure-checkout">
                                <div class="secure-checkout-header">
                                    <i class="bi bi-shield-lock"></i>
                                    <span> @lang('global.secure_checkout') </span>
                                </div>
                                <div class="payment-icons">
                                    <i class="bi bi-credit-card-2-front"></i>
                                    <i class="bi bi-credit-card"></i>
                                    <i class="bi bi-paypal"></i>
                                    <i class="bi bi-apple"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Checkout Form -->
                <div class="col-lg-7">
                    <!-- Checkout Form -->
                    <div class="checkout-container" data-aos="fade-up">
                        <form class="checkout-form">
                            <!-- Payment Method -->
                            <div class="checkout-section" id="payment-method">
                                <div
                                    class="section-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                    <div class="section-number">1</div>
                                    <h3> @lang('global.payment_methods') </h3>
                                </div>
                                <div class="section-content">
                                    <div
                                        class="payment-options {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                        <div class="payment-option active">
                                            <input type="radio" name="payment-method" id="credit-card" checked="">
                                            <label for="credit-card">
                                                <span class="payment-icon"><i class="bi bi-credit-card-2-front"></i></span>
                                                <span class="payment-label"> @lang('global.credit_or_debit_card')</span>
                                            </label>
                                        </div>
                                        <div class="payment-option">
                                            <input type="radio" name="payment-method" id="paypal">
                                            <label for="paypal">
                                                <span class="payment-icon"><i class="bi bi-paypal"></i></span>
                                                <span class="payment-label"> @lang('global.paypal') </span>
                                            </label>
                                        </div>
                                        <div class="payment-option">
                                            <input type="radio" name="payment-method" id="apple-pay">
                                            <label for="apple-pay">
                                                <span class="payment-icon"><i class="bi bi-apple"></i></span>
                                                <span class="payment-label"> @lang('global.apple_pay') </span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="payment-details" id="credit-card-details">
                                        <div
                                            class="form-group {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                            <label class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                for="card-number"> @lang('global.card_number') </label>
                                            <div
                                                class="card-number-wrapper {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <input type="text"
                                                    class="form-control {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                    name="card-number" id="card-number" placeholder="1234 5678 9012 3456"
                                                    required="">
                                                <div class="card-icons">
                                                    <i class="bi bi-credit-card-2-front"></i>
                                                    <i class="bi bi-credit-card"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div
                                                class="col-md-6 form-group {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <label class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                    for="expiry"> @lang('global.expiry_date') </label>
                                                <input type="text"
                                                    class="form-control {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                    name="expiry" id="expiry" placeholder="MM/YY" required="">
                                            </div>
                                            <div
                                                class="col-md-6 form-group {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                <label
                                                    class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                    for="cvv"> @lang('global.cvv') </label>
                                                <div
                                                    class="cvv-wrapper {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                                    <input type="text"
                                                        class="form-control {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                        name="cvv" id="cvv" placeholder="123" required="">
                                                    <span class="cvv-hint" data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="3-digit code on the back of your card">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div
                                            class="form-group {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                            <label class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                for="card-name"> @lang('global.cardholder_name') </label>
                                            <input type="text"
                                                class="form-control {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}"
                                                name="card-name" id="card-name" placeholder="John Doe" required="">
                                        </div>
                                    </div>

                                    <div class="payment-details d-none" id="paypal-details">
                                        <p
                                            class="payment-info {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                            @lang('global.you_will_be_redirected_to_paypal') </p>
                                    </div>

                                    <div class="payment-details d-none" id="apple-pay-details">
                                        <p
                                            class="payment-info {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                            @lang('global.you_will_be_redirected_to_apple_pay')
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Order Review -->
                            <div class="checkout-section" id="order-review">
                                <div
                                    class="section-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                    <div class="section-number">2</div>
                                    <h3 class="{{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                        @lang('global.order_review') </h3>
                                </div>
                                <div class="section-content">
                                    <div
                                        class="form-check terms-check {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                                        <label class="form-check-label" for="terms">
                                            <input class="form-check-input" type="checkbox" id="terms"
                                                name="terms" required="">
                                            @lang('global.i_accept_for')<a href="#" data-bs-toggle="modal"
                                                data-bs-target="#termsModal"> @lang('global.terms_conditions') </a> @lang('global.and') <a
                                                href="{{ route('privacyPolicy') }}">
                                                @lang('global.privacy_policy') </a>
                                        </label>
                                    </div>
                                    <div class="success-message d-none"> @lang('global.your_order_has_been_placed_successfully') </div>
                                    <div class="place-order-container">
                                        <button type="submit"
                                            class="btn btn-primary place-order-btn {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                                            <span class="btn-text"> @lang('global.place_order') </span>
                                            <span class="btn-price"><span class="riyal-heading"></span>
                                                {{ $total }} </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Terms and Privacy Modals -->
            <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }}">
                            <h5 class="modal-title" id="termsModalLabel">الشروط والأحكام</h5>
                        </div>
                        <div class="modal-body {{ app()->getLocale() == 'ar' ? 'text-end' : 'text-start' }}">
                            <h6>1. الموافقة على الشروط</h6>
                            <p>باستخدامك لهذه المنصة، فإنك توافق على الالتزام التام بهذه الشروط والأحكام. يرجى قراءتها
                                بعناية قبل إجراء أي حجز أو استخدام للخدمات. إذا كنت لا توافق على هذه الشروط، يرجى عدم
                                استخدام المنصة.</p>

                            <h6>2. صحة البيانات</h6>
                            <p>أنت مسؤول عن تقديم بيانات دقيقة وكاملة أثناء عملية الحجز، بما في ذلك الفترة الزمنية، المدينة،
                                وأي تفاصيل أخرى مطلوبة. المنصة غير مسؤولة عن أي أخطاء ناتجة عن تقديم بيانات غير صحيحة.</p>

                            <h6>3. سياسة الحجز</h6>
                            <p>جميع الحجوزات تخضع لتوافر الخدمات في المدينة والفترة الزمنية المحددة. لا يُسمح بتداخل
                                الحجوزات مع طلبات أخرى لنفس الخدمة في نفس الفترة الزمنية.</p>

                            <h6>4. الإلغاء والتعديل</h6>
                            <p>يمكن إلغاء أو تعديل الحجز وفقًا لسياسة الإلغاء الخاصة بالمنصة. يجب تقديم طلبات الإلغاء أو
                                التعديل قبل موعد الحجز بمدة كافية، وتخضع لرسوم محتملة حسب نوع الخدمة.</p>

                            <h6>5. المسؤولية</h6>
                            <p>المنصة غير مسؤولة عن أي أضرار أو خسائر تنتج عن سوء استخدام الخدمات أو عدم الالتزام بالشروط.
                                يتحمل المستخدم المسؤولية الكاملة عن أي عواقب ناتجة عن استخدامه للمنصة.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary"
                                data-bs-dismiss="modal">@lang('global.i_understand')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Checkout Section -->
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {
            $(".place-order-btn").click(function(e) {
                e.preventDefault();

                // diable button while processing
                const $button = $(this);
                $button.prop('disabled', true).html(
                    '<i class="fas fa-spinner fa-spin"></i> @lang('global.processing')');

                const url = "{{ route('checkout.store') }}";

                axios.post(url, {
                    _token: '{{ csrf_token() }}'
                }).then(function(response) {
                    if (response.data.success) {
                        $(".terms-check").addClass('d-none');
                        $(".place-order-btn").addClass('d-none');
                        $("#payment-method").addClass('d-none');
                        $(".success-message").removeClass('d-none');
                        // show success message
                        toastr.success(response.data.message);
                        // update cart counter
                        updateCart(response.data.userCartCount);
                    } else {
                        // show error message
                        toastr.error(response.data.message || '@lang('global.order_creation_failed')');
                        $button.prop('disabled', false).html('@lang('global.place_order')');
                    }
                }).catch(function(error) {
                    $button.prop('disabled', false).html('@lang('global.place_order')');

                    if (error.response) {
                        // التعامل مع أخطاء التحقق (validation errors)
                        if (error.response.data && error.response.data.errors) {
                            const errors = error.response.data.errors;
                            let errorMessages = [];

                            for (const key in errors) {
                                if (errors.hasOwnProperty(key)) {
                                    const errorKey = key.replace(/\./g, '-');
                                    if (Array.isArray(errors[key])) {
                                        errors[key].forEach(errorMessage => {
                                            errorMessages.push(errorMessage);
                                            $(`#${errorKey}-error`).text(errorMessage);
                                        });
                                    } else {
                                        errorMessages.push(errors[key]);
                                        if (key !== 'general') {
                                            $(`#${errorKey}-error`).text(errors[key]);
                                        }
                                    }
                                }
                            }
                            // عرض جميع الأخطاء في رسالة واحدة
                            toastr.error(errorMessages.join('<br>'));
                        } else if (error.response.status === 401) {
                            toastr.error('@lang('global.unauthenticated')');
                        } else if (error.response.status === 400) {
                            toastr.error(error.response.data.message || '@lang('global.cart_empty')');
                        } else {
                            toastr.error('@lang('global.error_occurred')');
                        }
                    } else {
                        // خطأ شبكة أو غير متوقع
                        console.error('Checkout error:', error);
                        toastr.error('@lang('global.error_occurred')');
                    }
                });
            });

            $("#terms").on('change', function() {
                if ($(this).is(":checked")) {
                    $(".place-order-btn").prop('disabled', false);
                } else {
                    $(".place-order-btn").prop('disabled', true);
                }
            });

            if ($("#terms").is(":checked")) {
                $(".place-order-btn").prop('disabled', false);
            } else {
                $(".place-order-btn").prop('disabled', true);
            }
        });
    </script>
@endsection
