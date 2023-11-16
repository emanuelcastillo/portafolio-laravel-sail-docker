<?php

use App\Http\Controllers\PortafolioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProyectoController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',  [PortafolioController::class, 'portafolio'])->name('portafolio');

Route::get('/cv/download', [PortafolioController::class, 'download']);
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::get('/proyectos/edit/{proyectoId}', [ProyectoController::class, 'edit'])->name('proyectos.edit');
// Route::put('/proyectos/{id}', [ProyectoController::class, 'update'])->name('proyectos.update');
Route::put('/proyectos/{proyecto}', [ProyectoController::class, 'update'])->name('proyectos.update');
Route::post('/proyectos', [ProyectoController::class, 'store'])->name('proyectos.store');
