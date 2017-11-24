<?php

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

Route::get('/', 'IndexController@index');

Route::post('/', 'IndexController@auth')->name('userAuthorize');

Route::get('menu', 'MenuController@index');

Route::resource('administrators', 'AdministratorsController');

Route::resource('clients', 'ClientsController');

Route::resource('discounts', 'DiscountsController');

Route::resource('gyms', 'GymsController');

Route::resource('instructors', 'InstructorsController');

Route::resource('sportmanships', 'SportmanshipsController');

Route::resource('schedule', 'ScheduleController');

Route::resource('visitlog', 'VisitlogController');

