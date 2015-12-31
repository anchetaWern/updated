<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

use Carbon\Carbon;

$app->get('/', 'NewsController@index');
$app->get('/settings', 'NewsController@settings');

$app->get('/sources', 'AdminController@sources');

$app->get('/{category}', 'NewsController@index');

$app->get('/source/add', 'AdminController@addSource');
$app->post('/source/add', 'AdminController@saveSource');


$app->get('/source/{id}', 'AdminController@updateSource');
$app->post('/source/update', 'AdminController@doUpdateSource');