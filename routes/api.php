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

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::group(['middleware' => 'auth:api'], function () {
    Route::group(['prefix' => 'user'], function () {
        Route::post('/', function () {
            return \FuxionLogistic\User::all();
        });
    });
});

Route::post('/solicitar-clave-trax',function (Request $request){
    $cliente_id = $request->input('empresario');
    $cliente = \FuxionLogistic\Models\Empresario::where('cliente_id',$cliente_id)->first();
    if($cliente){
        $usuario = $cliente->user;
        if($usuario->password){
            return ['error'=>'El empresario relacionado con la informaci&oacuten enviada ya ha registrado una contraseña'];
        }else{
            $password = rand(100000,999999).'@$';
            $usuario->password = \Illuminate\Support\Facades\Hash::make($password);
            $usuario->sesion_fuxion_trax = 'si';
            $notificacion = "Su clave de usuario ha sido generada con éxito.<br>"
                    ."<strong>Usuario: </strong> ".$usuario->email.'<br>'
                    ."<strong>Contraseña: </strong>".$password;
            \Illuminate\Support\Facades\Mail::to($usuario)->send(new \FuxionLogistic\Mail\NotificacionGeneral($usuario,$notificacion,false,'',''));
            $usuario->save();
            return ['success'=>true];
        }
    }else{
        return ['error'=>'No existe ning&uacuten usuario con el c&oacutedigo enviado'];
    }
});

Route::group(['prefix' => 'v1', 'middleware' => 'auth:api'], function() {
    Route::post('subida', 'v1\UploadController@store' );
    Route::resource('cortes', 'v1\CorteController');
    Route::get('pedidos/{barcode}/{corte_id}','v1\PedidoController@getPedido');
    Route::post('setIngreso','v1\PedidoController@setIngreso');
    Route::post('setEstado','v1\PedidoController@setEstado');
    Route::get('devolucion/{barcode}','v1\PedidoController@getDevolucion');
    Route::post('factura', 'v1\FacturaController@getFactura');

    Route::resource('enviado', 'v1\EnviadoController');
    Route::post('deleteEnviado','v1\EnviadoController@deleteEnviosPorGuia');
    Route::get('autorizacion', 'v1\AutorizacionController@index');//Realiza validación rápida de credenciales
    Route::get('consolidado/{corte}', 'v1\PedidoController@getConsolidado');
    Route::get('guias/{corte}', 'v1\CorteController@getNumeroGuias');
    Route::get('guiasoperador/{operador}/{corte}', 'v1\CorteController@getGuiasPorOperadorYCorte');
    Route::post('actualizaoperador', 'v1\GuiaController@actualizarOperador');
});


Route::group(['prefix' => 'v1'], function() {
   // Route::resource('factura', 'v1\FacturaController');
    //Route::get('factura/{guia}/{cambio}', 'v1\FacturaController@show');

});

/**
 * ESPACIO PARA PRUEBAS
 */
Route::post('/prueba-api',function (Request $request){
    dd($request->isXmlHttpRequest());
});