                        <div class="auth-form reset-password-form {{ $type == 'ResetPassword' ? 'active' : '' }}">
                            <div class="form-header">
                                <h3> @lang('global.reset_password') </h3>
                                {{-- <p> @lang('global.sign_in_to_your_account') </p> --}}
                            </div>

                            <div class="input-group mb-3">
                                <input type="text" class="d-none" name="email" id="email">
                                <input type="text" name="newPassword" class="form-control w-100 text-center"
                                    id="newPassword" placeholder=" New Password " />
                            </div>

                            <div class="input-group mb-3">
                                <button id="resetPasswordButton" class="auth-btn primary-btn mb-3 button-login">
                                    @lang('global.verify') </button>
                            </div>
                        </div>
