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

$router->get('/', function () use ($router) {
    return redirect()->to('/api');
});

$router->get('/api',function() use ($router){
	return view('api');
});

$router->get('/endpoint',function() use ($router){
	return view('endpoint');
});

//SHOW View Detail EndPoint
$router->get('/detail/{table}','ApiController@detail');



//Endpoint List
$router->group(['prefix' => 'api'],function () use ($router){
	//SHOW TABLES
	$router->get('/database/show/tables','ApiController@showTables');
	//SHOW COLUMN TABLE
	$router->get('/database/show/{table}/column','ApiController@columnTable');
	
	//READ 
	$router->get('/{table}','ApiController@single');
	$router->get('/{table}/{id}','ApiController@show');

});