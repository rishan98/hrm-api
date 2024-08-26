<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/login', [App\Http\Controllers\API\Auth\LoginController::class, 'login'])->name('user.login');
Route::post('/register', [App\Http\Controllers\API\Auth\LoginController::class, 'register'])->name('admin.register');


//Admin middleware
Route::middleware(['auth:sanctum', 'role:1'])->group(function () {

    //Users
    Route::get('/admin/users', [App\Http\Controllers\API\Admin\HomeController::class, 'viewUsers'])->name('admin.users.all');

    //Products
    Route::get('/admin/products', [App\Http\Controllers\API\Admin\ProductController::class, 'viewProducts'])->name('admin.products.all');
    Route::post('/admin/products/create', [App\Http\Controllers\API\Admin\ProductController::class, 'createProduct'])->name('admin.products.new');
    Route::post('/admin/products/update', [App\Http\Controllers\API\Admin\ProductController::class, 'updateProduct'])->name('admin.products.edit');
    Route::delete('/admin/products/delete/{id}', [App\Http\Controllers\API\Admin\ProductController::class, 'deleteProduct'])->name('admin.products.delete');
});


//User middleware
Route::middleware(['auth:sanctum', 'role:2'])->group(function () {

    //User
    Route::get('/user/profile', [App\Http\Controllers\API\User\HomeController::class, 'viewUserDetails'])->name('user.profile');
    Route::put('/user/update', [App\Http\Controllers\API\User\HomeController::class, 'updateLoggedUser'])->name('user.edit');

    //Products
    Route::get('/user/products', [App\Http\Controllers\API\User\ProductController::class, 'viewUserProducts'])->name('user.products.all');
    Route::put('/user/products', [App\Http\Controllers\API\User\ProductController::class, 'addOrRemoveProductToUser'])->name('user.products.edit');
});
