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
/*header("Access-Control-Allow-Headers","*");
header('Access-Control-Allow-Credentials', true);
header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
header('Content-Type', 'application/json');*/
Route::get('/', function () {
    return redirect('login');
//    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::middleware('auth')->group(function () {
    Route::get('events', 'EventsController@index');
    Route::get('events/create', 'EventsController@create');
    Route::post('events', 'EventsController@store');
    Route::get('events/{id}', 'EventsController@detail');
    Route::get('events/{id}/edit', 'EventsController@edit');
    Route::post('events/{id}', 'EventsController@update');
    Route::get('events/{id}/attendee-list', 'EventsController@attendeeList');
    Route::get('events/{id}/rating-diagram', 'EventsController@ratingDiagram');
});
