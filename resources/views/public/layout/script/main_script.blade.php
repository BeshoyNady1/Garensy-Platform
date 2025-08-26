        <script>
            $(document).ready(function() {
                var email = '';
                $(".switch-register").click(function() {
                    $(".login-form").removeClass("active");
                    $(".register-form").addClass("active");
                });

                $(".switch-login").click(function() {
                    $(".register-form").removeClass("active");
                    $(".login-form").addClass("active");
                });

                $(".switch-forgot-password").click(function(e) {
                    e.preventDefault();

                    email = $('.login-form #email').val();
                    if (!email) {
                        toastr.error("{{ __('validation.email_required') }}");
                        return;
                    } else {
                        $(".login-form").removeClass("active");
                        $(".register-form").removeClass("active");
                        startTimer();
                        const $button = $(this);
                        $button.html('جارٍ الإرسال...').prop('disabled', true);

                        let url = "{{ route('checkEmail') }}";

                        if (!email) {
                            $button.html('إرسال رمز التحقق').prop('disabled', false);
                            return;
                        }

                        axios.post(url, {
                            _token: '{{ csrf_token() }}',
                            email: email,
                        }).then(response => {
                            if (response.data.success) {
                                $(".register-form").removeClass("active");
                                $(".login-form").removeClass("active");
                                $(".forgot-password-form").addClass("active");
                                toastr.success(response.data.message);

                                if (response.data.redirect) {
                                    setTimeout(() => {
                                        window.location.href = response.data.redirect;
                                    }, 1000);
                                }
                            } else {
                                if (response.data.errors) {
                                    if (Array.isArray(response.data.errors)) {
                                        response.data.errors.forEach(errorMessage => {
                                            toastr.error(errorMessage);
                                            $('#email-error').text(errorMessage);
                                        });
                                    } else {
                                        toastr.error(response.data.errors);
                                        $('#email-error').text(response.data.errors);
                                    }
                                } else {
                                    toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                                }
                            }
                            $button.html('إرسال رمز التحقق').prop('disabled', false);
                        }).catch(error => {
                            if (error.response && error.response.data && error.response.data.errors) {
                                const errors = error.response.data.errors;
                                if (Array.isArray(errors)) {
                                    errors.forEach(errorMessage => {
                                        toastr.error(errorMessage);
                                        $('#email-error').text(errorMessage);
                                    });
                                } else {
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
                                }
                            } else {
                                console.error(error);
                                toastr.error('حدث خطأ غير متوقع.');
                            }
                            $button.html('إرسال رمز التحقق').prop('disabled', false);
                        });
                    }
                });

                // Login Submit Form
                $(".login-form .submit").click(function(e) {
                    e.preventDefault();
                    const $button = $(this);
                    $button.prop('disabled', true);

                    let url = "{{ route('login') }}";
                    axios.post(url, {
                        _token: '{{ csrf_token() }}',
                        email: $('.login-form  #email').val(),
                        password: $('.login-form  #password').val()
                    }).then(response => {
                        if (response.data.success) {
                            toastr.success(response.data.message);
                            if (response.data.redirect) {
                                setTimeout(() => {
                                    window.location.href = response.data.redirect;
                                }, 1000);
                            }
                        } else {
                            toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                        }
                    }).catch(error => {
                        if (error.response && error.response.data && error.response.data.errors) {
                            const errors = error.response.data.errors;
                            for (const key in errors) {
                                if (errors.hasOwnProperty(key)) {

                                    if (Array.isArray(errors[key])) {
                                        errors[key].forEach(errorMessage => {
                                            toastr.error(errorMessage);
                                            $(`#${key}-error`).text(errorMessage);
                                        });
                                    } else {

                                        toastr.error(errors[key]);
                                        if (key !== 'general') {
                                            $(`#${key}-error`).text(errors[key]);
                                        }
                                    }
                                }
                            }
                        } else {
                            console.error(error);
                            toastr.error('حدث خطأ غير متوقع.');
                        }
                        $button.prop('disabled', false);
                    });
                });

                // Register Submit Form
                $(".register-form .submit").click(function(e) {
                    e.preventDefault();
                    const $button = $(this);
                    $button.prop('disabled', true);

                    let url = "{{ route('register') }}";
                    axios.post(url, {
                        _token: '{{ csrf_token() }}',
                        firstName: $('.register-form #firstName').val(),
                        lastName: $('.register-form #lastName').val(),
                        phone: $('.register-form #phone').val(),
                        email: $('.register-form #email').val(),
                        password: $('.register-form #primary-password').val(),
                    }).then(response => {
                        if (response.data.success) {
                            toastr.success(response.data.message);
                            if (response.data.redirect) {
                                setTimeout(() => {
                                    window.location.href = response.data.redirect;
                                }, 1000);
                            }
                        } else {
                            toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                        }
                    }).catch(error => {
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
                            toastr.error('حدث خطأ غير متوقع.');
                        }
                        $button.prop('disabled', false);
                    });
                });


                $('.forgot-password-form #resendButton').on('click', function(e) {
                    e.preventDefault();
                    const $button = $(this);
                    $button.html('جارٍ إعادة الإرسال...').prop('disabled', true);

                    let url = "{{ route('checkEmail') }}";

                    axios.post(url, {
                        _token: '{{ csrf_token() }}',
                        email: email
                    }).then(response => {
                        if (response.data.success) {
                            toastr.success(response.data.message);
                            // إذا كانت دالة resendCode() موجودة، استدعِها
                            if (typeof resendCode === 'function') {
                                resendCode();
                            }
                            // اختياري: إعادة التوجيه إذا كان هناك redirect
                            if (response.data.redirect) {
                                setTimeout(() => {
                                    window.location.href = response.data.redirect;
                                }, 1000);
                            }
                        } else {
                            if (response.data.errors) {
                                for (const key in response.data.errors) {
                                    if (response.data.errors.hasOwnProperty(key)) {
                                        const errorKey = key.replace(/\./g, '-');
                                        if (Array.isArray(response.data.errors[key])) {
                                            response.data.errors[key].forEach(errorMessage => {
                                                toastr.error(errorMessage);
                                                $(`#${errorKey}-error`).text(errorMessage);
                                            });
                                        } else {
                                            toastr.error(response.data.errors[key]);
                                            if (key !== 'general') {
                                                $(`#${errorKey}-error`).text(response.data.errors[key]);
                                            }
                                        }
                                    }
                                }
                            } else {
                                toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                            }
                        }
                        $button.html('إعادة إرسال رمز التحقق').prop('disabled', false);
                    }).catch(error => {
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
                            toastr.error('حدث خطأ غير متوقع.');
                        }
                        $button.html('إعادة إرسال رمز التحقق').prop('disabled', false);
                    });
                });

                // Add a label element for password mismatch message
                let passwordMismatchLabel = "{{ __('validation.password_mismatch') }}";
                $(
                        `<div class='col-12'><label id="password-mismatch" style="color: red; display: none;"> ${passwordMismatchLabel} </label></div>`
                    )
                    .insertAfter('#confirm-password');

                // Function to check if passwords match
                function checkPasswordMatch() {
                    let password = $('#primary-password').val();
                    let confirmPassword = $('#confirm-password').val();
                    console.log("password: " + password + ", confirmPassword: " + confirmPassword);

                    if (password !== confirmPassword && confirmPassword !== '') {
                        $('#password-mismatch').show();
                        $('#confirm-password').addClass('is-invalid');
                        $(".register-form .submit").prop('disabled', true);
                    } else {
                        $('#password-mismatch').hide();
                        $('#confirm-password').removeClass('is-invalid');
                        $(".register-form .submit").prop('disabled', false);
                    }
                }

                // Check passwords on input
                $('#primary-password, #confirm-password').on('keyup', checkPasswordMatch);

                // Prevent form submission if passwords don't match
                $('form').on('submit', function(e) {
                    let password = $('#primary-password').val();
                    let confirmPassword = $('#confirm-password').val();

                    if (password !== confirmPassword && confirmPassword !== '') {
                        e.preventDefault();
                        $('#password-mismatch').show();
                        $('#confirm-password').addClass('is-invalid');
                        return false;
                    }
                });

                //Function verify code
                $('.forgot-password-form #verifyButton').on('click', function(e) {
                    e.preventDefault();
                    const $button = $(this);
                    $button.html('جارٍ التحقق...').prop('disabled', true);

                    let code = $('.forgot-password-form #verification_code').val();
                    let url = "{{ route('verifyCode') }}";

                    axios.post(url, {
                        _token: '{{ csrf_token() }}',
                        email: email,
                        verification_code: code
                    }).then(response => {
                        if (response.data.success) {
                            toastr.success(response.data.message);
                            $(".register-form").removeClass("active");
                            $(".login-form").removeClass("active");
                            $(".forgot-password-form").removeClass("active");
                            $(".reset-password-form").addClass("active");
                        } else {
                            if (response.data.errors) {
                                if (Array.isArray(response.data.errors)) {
                                    response.data.errors.forEach(errorMessage => {
                                        toastr.error(errorMessage);
                                        $('#email-error').text(
                                            errorMessage); // أو #verification_code-error
                                    });
                                } else {
                                    toastr.error(response.data.errors);
                                    $('#email-error').text(response.data.errors);
                                }
                            } else {
                                toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                            }
                        }
                        $button.html('تحقق من الكود').prop('disabled', false);
                    }).catch(error => {
                        if (error.response && error.response.data && error.response.data.errors) {
                            const errors = error.response.data.errors;
                            if (Array.isArray(errors)) {
                                errors.forEach(errorMessage => {
                                    toastr.error(errorMessage);
                                    $('#email-error').text(
                                        errorMessage); // أو #verification_code-error
                                });
                            } else {
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
                            }
                        } else {
                            console.error(error);
                            toastr.error('حدث خطأ غير متوقع.');
                        }
                        $button.html('تحقق من الكود').prop('disabled', false);
                    });
                });

                //Function Reset Password
                $('.reset-password-form #resetPasswordButton').on('click', function(e) {
                    e.preventDefault();
                    const $button = $(this);
                    $button.html('جارٍ إعادة التعيين...').prop('disabled', true);

                    let newPassword = $('.reset-password-form #newPassword').val();
                    let passwordConfirmation = $('.reset-password-form #password_confirmation').val();
                    let url = "{{ route('resetPassword') }}";

                    axios.post(url, {
                        _token: '{{ csrf_token() }}',
                        email: email,
                        password: newPassword,
                        password_confirmation: passwordConfirmation
                    }).then(response => {
                        if (response.data.success) {
                            toastr.success(response.data.message);
                            setTimeout(() => {
                                window.location.href = "{{ route('home') }}";
                            }, 1000);
                        } else {
                            if (response.data.errors) {
                                for (const key in response.data.errors) {
                                    if (response.data.errors.hasOwnProperty(key)) {
                                        const errorKey = key.replace(/\./g, '-');
                                        if (Array.isArray(response.data.errors[key])) {
                                            response.data.errors[key].forEach(errorMessage => {
                                                toastr.error(errorMessage);
                                                $(`#${errorKey}-error`).text(errorMessage);
                                            });
                                        } else {
                                            toastr.error(response.data.errors[key]);
                                            if (key !== 'general') {
                                                $(`#${errorKey}-error`).text(response.data.errors[key]);
                                            }
                                        }
                                    }
                                }
                            } else {
                                toastr.error(response.data.message || 'حدث خطأ غير متوقع.');
                            }
                        }
                        $button.html('إعادة تعيين').prop('disabled', false);
                    }).catch(error => {
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
                            toastr.error('حدث خطأ غير متوقع.');
                        }
                        $button.html('إعادة تعيين').prop('disabled', false);
                    });
                });
            });

            let timeLeft = 60;
            const timerDisplay = document.getElementById("timer");
            const verifyButton = document.getElementById("verifyButton");
            const resendButton = document.getElementById("resendButton");
            let timer;

            function startTimer() {
                timer = setInterval(() => {
                    timeLeft--;
                    timerDisplay.textContent = `(${timeLeft} ثانية)`;
                    if (timeLeft <= 0) {
                        clearInterval(timer);
                        timerDisplay.textContent = "";
                        verifyButton.disabled = true;
                        resendButton.classList.remove("disabled");
                    } else if (timeLeft <= 10) {
                        verifyButton.disabled = false;
                    }
                }, 1000);
            }

            function resendCode() {
                if (!resendButton.classList.contains("disabled")) {
                    timeLeft = 60;
                    timerDisplay.textContent = `(${timeLeft} ثانية)`;
                    // verifyButton.disabled = true;
                    resendButton.classList.add("disabled");
                    verifyButton.disabled = false;
                    startTimer();
                    // Logic to resend code can be added here
                }
            }

            $('.dropdown').on('show.bs.dropdown', function() {
                $(this).find('.dropdown-menu').first().stop(true, true).slideDown(300);
            });

            $('.dropdown').on('hide.bs.dropdown', function() {
                $(this).find('.dropdown-menu').first().stop(true, true).slideUp(300);
            });


            @if (session('success'))
                toastr.success("{{ addslashes(session('success')) }}");
            @endif

            @if (session('error'))
                toastr.error("{{ addslashes(session('error')) }}");
            @endif

            @if (session('errors'))
                @foreach (session('errors')->all() as $error)
                    toastr.error("{{ addslashes($error) }}");
                @endforeach
            @endif
        </script>
