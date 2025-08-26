@extends('public.layout.main')

@section('title', __('global.login_page'))

@section('breadcrumb')
    <!-- Breadcrumb Section Begin -->
    <div class="page-title light-background">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0"> @lang('global.login') </h1>
            <nav class="breadcrumbs">
                <ol>
                    <li class="current"> @lang('global.login') </li>
                    <li><a href="{{ route('home') }}"> @lang('global.Home') </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
@endsection

@section('styles')
    <style>
        .login-form,
        .register-form {
            direction: rtl;
        }
    </style>
@endsection

@section('content')
    <!-- Login Section -->
    <section id="login" class="login section">

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="auth-container" data-aos="fade-in" data-aos-delay="200">

                        <!-- Login Form -->
                        <div class="auth-form login-form {{ $type == 'login' ? 'active' : '' }}">
                            <div class="form-header">
                                <h3> @lang('global.walcome') </h3>
                                <p> @lang('global.sign_in_to_your_account') </p>
                            </div>

                            <form class="auth-form-content" Method="POST">
                                @csrf
                                <div class="input-group mb-3">
                                    <span class="input-icon">
                                        <i class="bi bi-envelope"></i>
                                    </span>
                                    <input type="email" class="form-control" name="email" id="email"
                                        placeholder="{{ __('global.email') }}" required="" autocomplete="email">
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-icon">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input type="password" class="form-control" name="password" id="password"
                                        placeholder="{{ __('global.password') }}" required=""
                                        autocomplete="current-password">
                                    {{-- <span class="password-toggle">
                                        <i class="bi bi-eye"></i>
                                    </span> --}}
                                </div>

                                <div class="form-options mb-4">
                                    <div class="remember-me">
                                        <input type="checkbox" name="remember" id="rememberLogin">
                                        <label for="rememberLogin"> @lang('global.Remember_Me') </label>
                                    </div>
                                    <button class="btn btn-link forgot-password switch-forgot-password">
                                        @lang('global.forgot_password') </button>
                                </div>

                                <button type="button" class="auth-btn submit primary-btn mb-3">
                                    @lang('global.sign_in')
                                    <i class="bi bi-arrow-right"></i>
                                </button>

                                <div class="divider">
                                    <span> @lang('global.or') </span>
                                </div>

                                {{-- <button type="button" class="auth-btn social-btn">
                                            <i class="bi bi-google"></i>
                                            Continue with Google
                                        </button> --}}

                                <div class="switch-form">
                                    <span> @lang('global.dont_have_account') </span>
                                    <button type="button" class="switch-btn switch-register">
                                        @lang('global.create_account')
                                    </button>
                                </div>
                            </form>
                        </div>

                        <!-- Register Form -->
                        @include('public.pages.loginPages.register')

                        <!-- ForgotPassword Form -->
                        @include('public.pages.loginPages.forgotPassword')

                        <!-- Reset Password  -->
                        @include('public.pages.loginPages.resertPassword')

                    </div>
                </div>
            </div>
        </div>

    </section><!-- /Login Section -->
@endsection

@section('scripts')
    @include('public.layout.script.main_script')
@endsection
