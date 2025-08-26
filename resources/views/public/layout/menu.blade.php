<div class="header-nav">
    <div class="container-fluid container-xl position-relative">
        <nav id="navmenu" class="navmenu">
            <ul class="navmenu-ul">
                <li>
                    <a href="{{ route('home') }}" class="@if (Route::current()->getName() == 'home') active @endif">
                        @lang('global.Home')
                    </a>
                </li>
                <li>
                    <a href="{{ route('categories') }}" class="@if (Route::current()->getName() == 'categories') active @endif">
                        @lang('global.Categories')
                    </a>
                </li>
                <li><a href="{{ route('packages.index') }}" class="@if (Route::current()->getName() == 'packages.index') active @endif">
                        @lang('global.packages') </a></li>
                <li><a href="{{ route('about') }}" class="@if (Route::current()->getName() == 'about') active @endif">
                        @lang('global.About') </a></li>
                <li><a href="{{ route('privacyPolicy') }}" class="@if (Route::current()->getName() == 'privacyPolicy') active @endif">
                        @lang('global.privacy_policy') </a></li>
                <li><a href="{{ route('contact') }}" class="@if (Route::current()->getName() == 'contact') active @endif">
                        @lang('global.Contact') </a></li>
                <li><a href="contact.html"> @lang('global.join_us') </a></li>
            </ul>
        </nav>
    </div>
</div>
