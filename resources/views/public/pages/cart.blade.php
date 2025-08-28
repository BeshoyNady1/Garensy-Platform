@extends('public.layout.main')

@section('title', __('global.cart'))

@section('breadcrumb')
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.cart') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.cart') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
@endsection

@section('styles')
    <style>
        .product-image {
            margin-left: 16px;
        }

        .cart-item .quantity-selector {
            direction: ltr;
        }
    </style>
@endsection

@section('content')
    <section id="cart" class="cart section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row">
                <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
                    <div class="cart-items">
                        <div class="cart-header d-none d-lg-block">
                            <div
                                class="row align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse' : 'flex-row' }} text-center">
                                <div class="col-lg-6">
                                    <h5> @lang('global.service') </h5>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <h5> @lang('global.the_price') </h5>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <h5> @lang('global.quantity') </h5>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <h5> @lang('global.total') </h5>
                                </div>
                            </div>
                        </div>

                        @php $subtotal = 0; @endphp
                        @forelse ($services as $service)
                            <div class="cart-item" data-id="{{ $service->id }}">
                                <div
                                    class="row align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row' }}">
                                    <div class="col-lg-6 col-12 mt-3 mt-lg-0 mb-lg-0 mb-3">
                                        <div
                                            class="product-info d-flex align-items-center {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row' }}">
                                            <div class="product-image">
                                                @if ($service->image_src)
                                                    <img src="{{ asset('' . $service->image_src) }}" alt="Product"
                                                        class="img-fluid" loading="lazy">
                                                @endif
                                            </div>
                                            <div class="product-details">
                                                <h6 class="product-title">

                                                    ({{ $service->is_package ? __('global.package') : __('global.service') }})
                                                    {{ app()->getLocale() == 'ar' ? $service->item_name_ar : $service->item_name_en }}
                                                </h6>
                                                <span class="product-desicription">
                                                    {{ $service->start_date }} - {{ $service->end_date }}
                                                </span>
                                                <div
                                                    class="product-meta {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : 'flex-row' }}">
                                                </div>
                                                <button class="remove-item" type="button" data-id="{{ $service->id }}">
                                                    <i class="bi bi-trash"></i> @lang('global.remove')
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-12 mt-3 mt-lg-0 text-center">
                                        <div class="price-tag">
                                            <span class="riyal-heading"></span>
                                            <span class="current-price">${{ number_format($service->price, 2) }}</span>

                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-12 mt-3 mt-lg-0 text-center">
                                        <div class="quantity-selector">
                                            {{-- <button class="quantity-btn decrease-btn" data-id="{{ $service->id }}">
                                                <i class="bi bi-dash"></i>
                                            </button> --}}
                                            <input type="number" class="quantity-input" value="{{ $service->qty }}"
                                                data-price="{{ $service->price }}" data-id="{{ $service->id }}"
                                                min="1" max="10" readonly disabled>
                                            {{-- <button class="quantity-btn increase-btn" data-id="{{ $service->id }}">
                                                <i class="bi bi-plus"></i>
                                            </button> --}}
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-12 mt-3 mt-lg-0 text-center">
                                        <div class="item-total">
                                            <span class="riyal-heading"></span>
                                            <span class="item-total-amount"
                                                data-price="{{ $service->price }}">{{ number_format($service->price * $service->qty, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @php $subtotal += $service->price * $service->qty; @endphp
                        @empty
                            <p class="text-center">@lang('global.cart_empty')</p>
                        @endforelse

                        <div class="cart-actions">
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    @if (count($services) > 0)
                                        <button class="btn btn-outline-remove remove-all">
                                            <i class="bi bi-trash"></i> @lang('global.remove_all_from_cart')
                                        </button>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
                    <div class="cart-summary">
                        <h4 class="summary-title"> @lang('global.order_summary') </h4>
                        {{-- <div class="summary-item">
                            <span class="summary-label"> @lang('global.subtotal') </span>
                            <span class="summary-value" id="subtotal">{{ number_format($subtotal, 2) }}</span>
                        </div> --}}
                        {{-- <div class="summary-item">
                            <span class="summary-label"> @lang('global.the_10_commission') </span>
                            <span class="summary-value" id="commission">{{ number_format($subtotal * 0.1, 2) }}</span>
                        </div> --}}
                        <div class="summary-total">
                            <span class="summary-label"> @lang('global.total') </span>
                            <span class="summary-value" id="total">
                                <span class="riyal-heading"></span>
                                {{ number_format($subtotal, 2) }}
                            </span>
                        </div>
                        <div class="checkout-button">
                            <a href="{{ route('checkout.index') }}" class="btn btn-accent w-100">
                                @lang('global.checkout') <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                        <div class="continue-shopping">
                            <a href="{{ route('home') }}" class="btn btn-link w-100">
                                <i class="bi bi-arrow-left"></i> @lang('global.continue_shopping')
                            </a>
                        </div>
                        <div class="payment-methods">
                            <p class="payment-title"> @lang('global.payment_methods') </p>
                            <div class="payment-icons">
                                <i class="bi bi-credit-card"></i>
                                <i class="bi bi-paypal"></i>
                                <i class="bi bi-wallet2"></i>
                                <i class="bi bi-bank"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {
            // Function to update cart totals
            function updateCartTotals() {
                let subtotal = 0;
                $('.cart-item').each(function() {
                    const price = parseFloat($(this).find('.item-total-amount').data('price'));
                    const qty = parseInt($(this).find('.quantity-input').val());
                    const itemTotal = price * qty;
                    $(this).find('.item-total-amount').text(itemTotal.toFixed(2));
                    subtotal += itemTotal;
                });
                $('#subtotal').text(subtotal.toFixed(2));
                $('#commission').text((subtotal * 0.1).toFixed(2));
                $('#total').text((subtotal * 1.1).toFixed(2));
            }

            // Remove a single item from the cart
            $('.remove-item').off('click').on('click', function(e) {
                e.preventDefault();
                const $button = $(this);
                $button.html('<i class="bi bi-trash"></i> @lang('global.removing')...').prop('disabled', true);
                const id = $button.attr('data-id');

                if (!id) {
                    toastr.error('Item ID is missing.');
                    $button.html('<i class="bi bi-trash"></i> @lang('global.remove')').prop('disabled', false);
                    return;
                }

                axios.post("{{ route('carts.remove') }}", {
                    _token: '{{ csrf_token() }}',
                    id: id
                }).then(function(response) {
                    if (response.data.success) {
                        toastr.success(response.data.message);
                        $button.closest('.cart-item').remove();
                        updateCart(response.data.userCartCount);
                        updateCartTotals();
                        if (response.data.userCartCount === 0) {
                            $('.cart-items').html('<p class="text-center">@lang('global.cart_empty')</p>');
                            $('.cart-actions').hide();
                        }
                    } else {
                        toastr.error(response.data.message || '@lang('global.error_occurred')');
                    }
                    $button.html('<i class="bi bi-trash"></i> @lang('global.remove')').prop('disabled',
                        false);
                }).catch(function(error) {
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
                        toastr.error('@lang('global.error_occurred')');
                    }
                    $button.html('<i class="bi bi-trash"></i> @lang('global.remove')').prop('disabled',
                        false);
                });
            });

            // Remove all items from the cart
            $('.remove-all').off('click').on('click', function(e) {
                e.preventDefault();
                const $button = $(this);
                $button.html('<i class="bi bi-trash"></i> @lang('global.removing_all')...').prop('disabled', true);

                axios.post("{{ route('carts.removeAll') }}", {
                    _token: '{{ csrf_token() }}'
                }).then(function(response) {
                    if (response.data.success) {
                        toastr.success(response.data.message);
                        $('.cart-items').html('<p class="text-center">@lang('global.cart_empty')</p>');
                        $('.cart-actions').hide();
                        updateCart(response.data.userCartCount);
                        updateCartTotals();
                    } else {
                        toastr.error(response.data.message || '@lang('global.error_occurred')');
                    }
                    $button.html('<i class="bi bi-trash"></i> @lang('global.remove_all_from_cart')').prop('disabled',
                        false);
                }).catch(function(error) {
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
                        toastr.error('@lang('global.error_occurred')');
                    }
                    $button.html('<i class="bi bi-trash"></i> @lang('global.remove_all_from_cart')').prop('disabled',
                        false);
                });
            });

            // Update quantity when clicking increase-btn/decrease-btn buttons
            // $('.quantity-btn').off('click').on('click', function(e) {
            //     e.preventDefault();

            //     const $button = $(this);
            //     const $cartItem = $button.closest('.cart-item');
            //     const $input = $cartItem.find('.quantity-input');
            //     let qty = parseInt($input.val()) || 1; // Ensure the value is an integer
            //     if ($button.hasClass('increase-btn')) {
            //         qty = Math.min(qty + 1, 10); // increase-btn by 1, max 10
            //     } else if ($button.hasClass('decrease-btn')) {
            //         qty = Math.max(qty - 1, 1); // decrease-btn by 1, min 1
            //     }

            //     $input.val(qty);
            //     updateCartTotals();
            // });

            // Update quantity when manually changing the input field
            // $('.quantity-input').off('change').on('change', function() {
            //     const $input = $(this);
            //     let qty = parseInt($input.val()) || 1; // Ensure the value is an integer

            //     if (isNaN(qty) || qty < 1) {
            //         qty = 1;
            //     } else if (qty > 10) {
            //         qty = 10;
            //     }

            //     $input.val(qty);
            //     updateCartTotals();
            // });
        });
    </script>
@endsection
