<?php

use App\Http\Controllers\public\AboutController;
use App\Http\Controllers\public\AuthController;
use App\Http\Controllers\public\CartsController;
use App\Http\Controllers\public\CategoriesController;
use App\Http\Controllers\public\CheckoutController;
use App\Http\Controllers\public\ContactController;
use App\Http\Controllers\public\FavoriteController;
use App\Http\Controllers\public\HomeController;
use App\Http\Controllers\public\PackagesController;
use App\Http\Controllers\public\PrivacyAndPolicyController;
use App\Http\Controllers\public\ServicesController;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Public Frontend Routes (Accessible to everyone)
Route::group(['middleware' => ['lang']], function () {
    Route::get('/', [HomeController::class, 'index'])->name("home");

    Route::get('/about', [AboutController::class, 'index'])->name("about");

    Route::group(['prefix' => 'Services', 'as' => 'services.'], function () {
        Route::get('/', [ServicesController::class, 'index'])->name("index"); // services.index
        Route::get('/show-service/{id}', [ServicesController::class, 'show'])->name("show"); // services.show
        Route::get('/service-details/{id}', [ServicesController::class, 'details'])->name("details"); // services.details
        Route::post('/order', [ServicesController::class, 'order'])->name("order"); // services.order
    });

    Route::group(['prefix' => 'Favorites', 'as' => 'favorites.'], function () {
        Route::post('/store', [FavoriteController::class, 'store'])->name("store"); // favorites.store
    });

    Route::group(['prefix' => 'Cart', 'as' => 'carts.'], function () {
        Route::get('/', [CartsController::class, 'index'])->name("index"); // carts.index
        Route::post('/remove', [CartsController::class, 'remove'])->name("remove"); // carts.remove
        Route::post('/remove-all', [CartsController::class, 'removeAll'])->name("removeAll"); // carts.removeAll
    });

    Route::group(['prefix' => 'Checkout', 'as' => 'checkout.'], function () {
        Route::get('/', [CheckoutController::class, 'index'])->name("index"); // checkout.index
        Route::post('/store', [CheckoutController::class, 'store'])->name("store"); // checkout.store
        Route::post('/remove-all', [CheckoutController::class, 'removeAll'])->name("removeAll"); // checkout.removeAll
    });

    Route::get('/categories', [CategoriesController::class, 'index'])->name("categories");

    Route::get('/privacy-policy', [PrivacyAndPolicyController::class, 'index'])->name("privacyPolicy");

    Route::get('/contact', [ContactController::class, 'index'])->name("contact");

    Route::group(['prefix' => 'Packages', 'as' => 'packages.'], function () {
        Route::get('/', [PackagesController::class, 'index'])->name("index"); // packages.index
        Route::get('details/{id}', [PackagesController::class, 'details'])->name("details");
        Route::post('/order', [PackagesController::class, 'order'])->name("order"); // packages.order
    });


    // packages . details

    // Language switch route
    // Route::get('/language/{locale}', function ($locale) {
    //     if ($locale) {
    //         session()->put('locale', $locale);
    //     }
    //     return redirect()->back();
    // })->name('language.switch');

    // Login page (only accessible to guests)
    Route::get('page/login', function () {
        return view("public.pages.loginPages.login", ['type' => 'login']);
    })->name('page.login');

    Route::get('page/register', function () {
        return view("public.pages.loginPages.login", ['type' => 'register']);
    })->name('page.register');

    Route::get('page/forgot-password', function () {
        return view("public.pages.loginPages.login", ['type' => 'ForgotPassword']);
    })->name('page.ForgotPassword');


    Route::post("/login", [AuthController::class, 'login'])->name('login');
    Route::post("/register", [AuthController::class, 'register'])->name('register');
    Route::post("/check-email", [AuthController::class, 'checkEmail'])->name('checkEmail');
    Route::post("/verify-code", [AuthController::class, 'verifyCode'])->name('verifyCode');
    Route::post("/reset-password", [AuthController::class, 'resetPassword'])->name('resetPassword');
});

// Dashboard Routes (Protected by auth)
Route::middleware(['auth:web'])->group(function () {
    Route::post("/logout", [AuthController::class, 'logout'])->name('logout');

    // Route::get('/admin/dashboard', [BackendHomeController::class, 'index'])->name("dashboard");

    // Route::group(['prefix' => 'settings', 'as' => 'settings.'], function () {
    //     Route::group(['prefix' => 'settings', 'as' => 'logoAndBanners.'], function () {
    //         Route::get('/Logo-And-Banners', [LogoAndBannersController::class, 'index'])->name('index'); // settings.logoAndBanners.index
    //         Route::get('/Logo-And-Banners/{id}/edit', [LogoAndBannersController::class, 'edit'])->name('edit'); // settings.logoAndBanners.edit
    //         Route::post('/Logo-And-Banners/{id}/update', [LogoAndBannersController::class, 'update'])->name('update'); // settings.logoAndBanners.update
    //     });

    //     Route::group(['prefix' => 'aboutUs', 'as' => 'aboutUs.'], function () {
    //         Route::get('/aboutUs', [AboutUsController::class, 'index'])->name('index'); // settings.aboutUs.index
    //         Route::get('/aboutUs/{id}/edit', [AboutUsController::class, 'edit'])->name('edit'); // settings.aboutUs.edit
    //         Route::post('/aboutUs/{id}/update', [AboutUsController::class, 'update'])->name('update'); // settings.aboutUs.update
    //     });

    //     Route::group(['prefix' => 'privacy-policy', 'as' => 'privacyPolicy.'], function () {
    //         Route::get('/privacy-policy', [BackendPrivacyAndPolicyController::class, 'index'])->name('index'); // settings.privacyPolicy.index
    //         Route::get('/privacy-policy/{id}/edit', [BackendPrivacyAndPolicyController::class, 'edit'])->name('edit'); // settings.privacyPolicy.edit
    //         Route::post('/privacy-policy/{id}/update', [BackendPrivacyAndPolicyController::class, 'update'])->name('update'); // settings.privacyPolicy.update
    //     });

    //     Route::group(['prefix' => 'footer-and-hours-work', 'as' => 'footerAndHoursWork.'], function () {
    //         Route::get('/', [FooterAndHoursWorkController::class, 'index'])->name('index'); // settings.footerAndHoursWork.index
    //         Route::get('/footer/{id}/edit', [FooterAndHoursWorkController::class, 'editFooter'])->name('editFooter'); // settings.footerAndHoursWork.editFooter
    //         Route::get('/open-hours/{id}/edit', [FooterAndHoursWorkController::class, 'editOpenHours'])->name('editOpenHours'); // settings.footerAndHoursWork.editOpenHours
    //         Route::post('/{id}/update', [FooterAndHoursWorkController::class, 'update'])->name('update'); // settings.footerAndHoursWork.update
    //     });
    // });

    // Route::group(['prefix' => 'users', 'as' => 'users.'], function () {
    //     Route::get('/', [UsersController::class, 'index'])->name('index'); // users.index
    //     Route::get('/create', [UsersController::class, 'create'])->name('create'); // users.create
    //     Route::post('/store', [UsersController::class, 'store'])->name('store'); // users.store
    //     Route::get('/edit/{id}', [UsersController::class, 'edit'])->name('edit'); // users.edit
    //     Route::post('/update/{id}', [UsersController::class, 'update'])->name('update'); // users.update
    //     Route::post('/destroy', [UsersController::class, 'destroy'])->name('destroy'); // users.destroy
    // });

    // Route::post('/send-email-after-update', [OrdersController::class, 'sendEmailAfterUpdate'])->name('send.email.after.update');
});
