<?php

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

Route::get('/', 'PageController@index');
Route::get('/all', 'PageController@showall');
Route::get('/category/{category}', 'PageController@filterMenuByCategory');
Route::get('/detail/{food}', 'PageController@detail');
Route::delete('/checkout/{item_id}', 'InvoiceController@destroy');
Route::post('/cart', 'InvoiceController@store');
Route::put('/finalize/{invoice}', 'PageController@finalize');
Route::get('/checkout', 'InvoiceController@index');
Route::get('/payment', 'PageController@payment');
Route::delete('/cancel/{invoice}', 'PageController@cancel');

// Admin/menu
Route::get('/admin', 'MenuController@index');
Route::delete('/admin/{id}', 'MenuController@destroy');
Route::put('/admin/{id}', 'MenuController@update');
Route::get('/admin/{id}', 'MenuController@show');
Route::post('/add', 'MenuController@store');
Route::get('/add', 'MenuController@create');
Route::get('/admin/{id}/edit', 'MenuController@edit');

// Auth routes
Route::get('/login', 'LoginController@getLogin')->middleware('guest');
Route::post('/login', 'LoginController@postLogin');
Route::get('/logout', 'LoginController@logout');
Route::get('/user', function() {
    return view('user');
})->middleware('auth:user');
// Route::get('/mod', function() {
//     return view('mod');
// })->middleware('auth:admin');