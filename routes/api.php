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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/login', [App\Http\Controllers\API\Auth\LoginController::class, 'login'])->name('user.login');

Route::middleware(['auth:sanctum', 'role:1'])->group(function () {
    
    Route::get('/admin/dashboard', [App\Http\Controllers\API\Admin\HomeController::class, 'index'])->name('admin.dashboard');
});

Route::middleware(['auth:sanctum', 'role:2'])->group(function () {
    
    Route::get('/lecturer/dashboard', [App\Http\Controllers\API\Lecturer\HomeController::class, 'index'])->name('lecturer.dashboard');
});

Route::middleware(['auth:sanctum', 'role:3'])->group(function () {
    
    Route::get('/student/dashboard', [App\Http\Controllers\API\Student\HomeController::class, 'index'])->name('student.dashboard');
});