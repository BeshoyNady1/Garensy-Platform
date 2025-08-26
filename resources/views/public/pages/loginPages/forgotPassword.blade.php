                        <div class="auth-form forgot-password-form {{ $type == 'ForgotPassword' ? 'active' : '' }}">
                            <div class="form-header">
                                <h3> @lang('global.forgot_password') </h3>
                                {{-- <p> @lang('global.sign_in_to_your_account') </p> --}}
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group mb-3">
                                    <input type="text" class="d-none" name="email" id="email">
                                    <input type="text" name="verification_code" class="form-control w-100 text-center"
                                        id="verification_code" placeholder="{{ __('global.enter_code') }}" />
                                </div>
                                <div class="input-group mb-3 justify-content-center">
                                    <span id="timer" class="timer">0</span>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <button id="verifyButton" class="auth-btn primary-btn mb-3 button-login">
                                    @lang('global.verify') </button>
                                <button id="resendButton" class="disabled btn button-login w-100">
                                    @lang('global.send_another_code')
                                </button>
                            </div>
                        </div>
