<footer id="footer" class="footer dark-background">
    <div class="footer-main">
        <div class="container">
            <div class="row gy-4 {{ app()->getLocale() == 'ar' ? 'flex-row-reverse text-end' : '' }}">
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="footer-widget footer-about">
                        <a href="index.html" class="logo">
                            <img src="assets/img/footer-logo.png" width="200" alt="Image">
                        </a>

                        <div class="social-links mt-4">
                            <h5> @lang('global.follow_us') </h5>
                            <div class="social-icons justify-content-center">
                                <a href="#" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" aria-label="Instagram"><i class="bi bi-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="bi bi-twitter-x"></i></a>
                                <a href="#" aria-label="TikTok"><i class="bi bi-tiktok"></i></a>
                                <a href="#" aria-label="Pinterest"><i class="bi bi-pinterest"></i></a>
                                <a href="#" aria-label="YouTube"><i class="bi bi-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6  text-center">
                    <div class="footer-widget">
                        <h4> @lang('global.our_pages') </h4>
                        <ul class="footer-links text-center">
                            <li>
                                <a href="{{ route('home') }}" class="@if (Route::current()->getName() == 'home') active @endif">
                                    @lang('global.Home')
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('categories') }}"
                                    class="@if (Route::current()->getName() == 'categories') active @endif">
                                    @lang('global.Categories')
                                </a>
                            </li>
                            <li><a href="{{ route('packages.index') }}"
                                    class="@if (Route::current()->getName() == 'packages.index') active @endif">
                                    @lang('global.packages') </a></li>
                            <li><a href="{{ route('about') }}" class="@if (Route::current()->getName() == 'about') active @endif">
                                    @lang('global.About') </a></li>
                            <li><a href="{{ route('privacyPolicy') }}"
                                    class="@if (Route::current()->getName() == 'privacyPolicy') active @endif">
                                    @lang('global.privacy_policy') </a></li>
                            <li><a href="{{ route('contact') }}"
                                    class="@if (Route::current()->getName() == 'contact') active @endif">
                                    @lang('global.Contact') </a></li>
                            <li><a href="contact.html"> @lang('global.join_us') </a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="footer-widget text-center">
                        <h4> @lang('global.contact_info') </h4>
                        <div class="footer-contact text-center">
                            <div class="contact-item text-center justify-content-center">
                                <i class="bi bi-geo-alt"></i>
                                <span>123 Fashion Street, New York, NY 10001</span>
                            </div>
                            <div class="contact-item text-center justify-content-center">
                                <i class="bi bi-telephone"></i>
                                <span>+1 (555) 123-4567</span>
                            </div>
                            <div class="contact-item text-center justify-content-center">
                                <i class="bi bi-envelope"></i>
                                <span>hello@example.com</span>
                            </div>
                        </div>

                        <div class="app-buttons mt-4 text-center justify-content-center">
                            <a href="#" class="app-btn">
                                <i class="bi bi-apple"></i>
                                <span>App Store</span>
                            </a>
                            <a href="#" class="app-btn">
                                <i class="bi bi-google-play"></i>
                                <span>Google Play</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="container">
            <div class="row gy-3 align-items-center">
                <div class="col-lg-12 col-md-12 text-center">
                    <div class="copyright">
                        <p>© <span>Copyright</span> <strong class="sitename">Garensy</strong>. All Rights
                            Reserved. Designed by <a href="https://tec-org.com/"> TechOrg</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</footer>
