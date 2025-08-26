                        <div class="auth-form register-form {{ $type == 'register' ? 'active' : '' }}">
                            <div class="form-header">
                                <h3> @lang('global.create_account') </h3>
                                <p> @lang('global.join_us') </p>
                            </div>

                            <form method="POST"class="auth-form-content">
                                @csrf
                                <div class="name-row">
                                    <div class="input-group">
                                        <span class="input-icon">
                                            <i class="bi bi-person"></i>
                                        </span>
                                        <input type="text" class="form-control" name="first-name" id="firstName"
                                            placeholder="{{ __('global.first_name') }}" required=""
                                            autocomplete="given-name">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-icon">
                                            <i class="bi bi-person"></i>
                                        </span>
                                        <input type="text" class="form-control" name="last-name" id="lastName"
                                            placeholder="{{ __('global.last_name') }}" required=""
                                            autocomplete="family-name">
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-icon">
                                        <i class="bi bi-phone"></i>
                                    </span>
                                    <input type="phone" class="form-control" name="phone" id="phone"
                                        placeholder="{{ __('global.phone') }}" autocomplete="phone">
                                </div>

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
                                    <input type="password" class="form-control" name="password" id="primary-password"
                                        placeholder="{{ __('global.password') }}" required=""
                                        autocomplete="new-password">
                                    <span class="password-toggle">
                                    </span>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-icon">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" class="form-control" name="confirm-password"
                                        id="confirm-password" placeholder="{{ __('global.confirm_password') }}"
                                        required="" autocomplete="new-password">
                                    <span class="password-toggle">
                                    </span>
                                </div>
                                <button type="button" class="auth-btn submit primary-btn mb-3">
                                    @lang('global.create_account')
                                    <i class="bi bi-arrow-right"></i>
                                </button>

                                <div class="divider">
                                    <span> @lang('global.or') </span>
                                </div>
                                <div class="switch-form">
                                    <span> @lang('global.already_have_account') </span>
                                    <button type="button" class="switch-btn switch-login"> @lang('global.login') </button>
                                </div>
                            </form>
                        </div>
