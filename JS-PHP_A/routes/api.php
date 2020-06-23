<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

header("Access-Control-Allow-Headers","*");
header('Access-Control-Allow-Credentials', true);
header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
header('Content-Type', 'application/json');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'AttendeesController@login');
Route::post('profile', 'AttendeesController@register');

Route::middleware('auth.attendee')->group(function () {
    Route::get('profile', 'AttendeesController@show');
    Route::get('logout', 'AttendeesController@logout');

    Route::get('events', 'EventsController@list');
    Route::post('registrations', 'EventsController@register');
    Route::get('registrations', 'RegistrationsController@list');
    Route::put('registrations/{id}', 'RegistrationsController@rate')->where('id', '[0-9]+');
});
