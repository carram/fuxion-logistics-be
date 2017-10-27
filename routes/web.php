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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/prueba-correo',function (){
    $usuario = \FuxionLogistic\User::find(110);
    $pedido = \FuxionLogistic\Models\Pedido::find(271);
    \FuxionLogistic\Models\Correo::pedidoEnCola($usuario->empresario,$pedido);
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/usuario/validar-cuenta/{id}/{token}', 'UsuarioController@validarCuenta')->middleware('guest');
Route::post('/usuario/validar-cuenta', 'UsuarioController@validarCuentaSend')->middleware('guest');
Route::get('/ws', 'SoapController@show');

/**
 * IMAGENES DEL SISTEMA
 */
Route::get('/archivo/{path}',function ($path){
    $path = storage_path() .'/'. str_replace('-','/', $path);
    if(!File::exists($path)) abort(404);

    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
});

Route::group(['middleware' => 'auth'], function () {
    /**
     * MODULOS Y FUNCIONES
     */
    Route::group(['prefix' => 'modulos-funciones'],function (){
        Route::get('/', 'ModulosFuncionesController@index');
        Route::post('/vista-modulos', 'ModulosFuncionesController@vistaModulos');
        Route::post('/vista-funciones', 'ModulosFuncionesController@vistaFunciones');
        Route::post('/actualizar-relacion', 'ModulosFuncionesController@actualizarRelacion');
        Route::post('/nuevo-modulo', 'ModulosFuncionesController@nuevoModulo');
        Route::post('/nueva-funcion', 'ModulosFuncionesController@nuevaFuncion');
        Route::post('form-modulo', 'ModulosFuncionesController@formModulo');
        Route::post('editar-modulo', 'ModulosFuncionesController@editarModulo');
        Route::post('form-funcion', 'ModulosFuncionesController@formFuncion');
        Route::post('editar-funcion', 'ModulosFuncionesController@editarFuncion');
    });

    /**
     * ROLES DEL SISTEMA
     */
    Route::group(['prefix' => 'rol'],function (){
        Route::get('/', 'RolController@index');
        Route::post('vista-roles', 'RolController@vistaRoles');
        Route::post('vista-privilegios', 'RolController@vistaPrivilegios');
        Route::post('crear', 'RolController@crear');
        Route::post('form', 'RolController@form');
        Route::post('editar', 'RolController@editar');
    });

    /**
     * USUARIOS DEL SISTEMA
     */
    Route::group(['prefix' => 'usuario'],function (){
        Route::get('/', 'UsuarioController@index');
        Route::get('/lista', 'UsuarioController@lista');
        Route::get('/create', 'UsuarioController@create');
        Route::post('/store', 'UsuarioController@store');
        Route::get('/edit/{id}', 'UsuarioController@edit');
        Route::post('/update', 'UsuarioController@update');
        Route::post('/delete', 'UsuarioController@delete');
    });

    /**
     * CORTES DEL SISTEMA
     */
    Route::group(['prefix' => 'corte'],function (){
        Route::get('/', 'CorteController@index');
        Route::get('/lista', 'CorteController@lista');
        Route::get('/importar', 'CorteController@importar');
        Route::post('/guardar', 'CorteController@guardar');
        Route::get('/detalle/{id}', 'CorteController@detalle');
        Route::get('/lista-pedidos-corte/{id}', 'CorteController@listaPedidosCorte');
        Route::post('/aplicar-malla-cobertura/{id}', 'CorteController@aplicarMallaCobertura');
        Route::get('/guias/{id}', 'CorteController@guias');
        Route::get('/guias-operador-logistico/{corte}/{operadorLogistico}', 'CorteController@guiasOperadorLogistico');
        Route::get('/lista-guias-operador-logistico/{corte}/{operadorLogistico}', 'CorteController@listaGuiasOperadorLogistico');
        Route::post('/reasignar-guias-operador-logistico', 'CorteController@reasignarGuiasOperadorLogistico');
    });

    /**
     * BODEGAS DEL SISTEMA
     */
    Route::group(['prefix' => 'bodega'],function (){
        Route::get('/', 'BodegaController@index');
        Route::get('/lista', 'BodegaController@lista');
        Route::get('/crear', 'BodegaController@crear');
        Route::post('/guardar', 'BodegaController@guardar');
        Route::get('/editar/{id}', 'BodegaController@editar');
        Route::post('/actualizar', 'BodegaController@actualizar');
    });

    /**
     * CLIENTE DEL SISTEMA
     */
    Route::group(['prefix' => 'empresario'],function (){
        Route::get('/', 'EmpresarioController@index');
        Route::get('/lista', 'EmpresarioController@lista');
        Route::get('/importacion-kits', 'EmpresarioController@importacionKits');
        Route::post('/importar-kits', 'EmpresarioController@importarKits');
        //Route::get('/crear', 'EmpresarioController@crear');
        //Route::post('/guardar', 'EmpresarioController@guardar');
        //Route::get('/editar/{id}', 'EmpresarioController@editar');
        //Route::post('/actualizar', 'EmpresarioController@actualizar');
    });

    /**
     * OPERADORES LOGÍSTICOS DEL SISTEMA
     */
    Route::group(['prefix' => 'operador-logistico'],function (){
        Route::get('/', 'OperadorLogisticoController@index');
        Route::get('/lista', 'OperadorLogisticoController@lista');
        Route::get('/crear', 'OperadorLogisticoController@crear');
        Route::post('/guardar', 'OperadorLogisticoController@guardar');
        Route::get('/editar/{id}', 'OperadorLogisticoController@editar');
        Route::post('/actualizar', 'OperadorLogisticoController@actualizar');
        Route::post('/borrar', 'OperadorLogisticoController@borrar');
    });

    /**
     * MALLAS DE COBERTURA DEL SISTEMA
     */
    Route::group(['prefix' => 'malla-cobertura'],function (){
        Route::get('/', 'MallaCoberturaController@index');
        Route::get('/lista', 'MallaCoberturaController@lista');
        Route::get('/crear', 'MallaCoberturaController@crear');
        Route::post('/guardar', 'MallaCoberturaController@guardar');
        Route::post('/borrar', 'MallaCoberturaController@borrar');
        Route::get('/importar', 'MallaCoberturaController@importar');
        Route::post('/guardar-importacion', 'MallaCoberturaController@guardarImportacion');
    });

    /**
     * PLANTILLAS DE CORREO DEL SISTEMA
     */
    Route::group(['prefix' => 'plantilla-correo'],function (){
        Route::get('/', 'PlantillaCorreoController@index');
        Route::get('/lista', 'PlantillaCorreoController@lista');
        Route::get('/crear', 'PlantillaCorreoController@crear');
        Route::post('/guardar', 'PlantillaCorreoController@guardar');
        Route::get('/editar/{id}', 'PlantillaCorreoController@editar');
        Route::post('/actualizar', 'PlantillaCorreoController@actualizar');
        Route::post('/borrar', 'PlantillaCorreoController@borrar');
    });

    /**
     * ESTADOS DE PEDIDOS DEL SISTEMA
     */
    Route::group(['prefix' => 'estado-pedido'],function (){
        Route::get('/', 'EstadoPedidoController@index');
        Route::get('/lista', 'EstadoPedidoController@lista');
        Route::get('/crear', 'EstadoPedidoController@crear');
        Route::post('/guardar', 'EstadoPedidoController@guardar');
        Route::get('/editar/{id}', 'EstadoPedidoController@editar');
        Route::post('/actualizar', 'EstadoPedidoController@actualizar');
        Route::post('/borrar', 'EstadoPedidoController@borrar');
    });

    /**
     * ESTADOS DE PEDIDOS RELACIONADOS CON LOS OPERADORES LOGISTICOS
     */
    Route::group(['prefix' => 'estado-operador-logistico'],function (){
        Route::get('/', 'EstadoOperadorLogisticoController@index');
        Route::get('/lista', 'EstadoOperadorLogisticoController@lista');
        Route::get('/crear', 'EstadoOperadorLogisticoController@crear');
        Route::post('/guardar', 'EstadoOperadorLogisticoController@guardar');
        Route::get('/editar/{id}', 'EstadoOperadorLogisticoController@editar');
        Route::post('/actualizar', 'EstadoOperadorLogisticoController@actualizar');
        Route::post('/borrar', 'EstadoOperadorLogisticoController@borrar');
    });
});


/**
 * TAREAS DEL SISTEMA
 */
Route::group(['prefix' => 'tareas-sistema'],function (){
    Route::post('/select-departamentos', function (\Illuminate\Http\Request $request){
        $departamentos = [''=>'Seleccione un departamento']+\FuxionLogistic\Models\Departamento::pluck('nombre','id')->toArray();
        $name = 'departamento';
        if($request->has('pais')){
            $departamentos = [''=>'Seleccione un departamento']+\FuxionLogistic\Models\Departamento::where('pais_id',$request->input('pais'))->pluck('nombre','id')->toArray();
        }

        if($request->has('name'))$name = $request->input('name');

        return view('layouts.componentes.select')
            ->with('elementos',$departamentos)
            ->with('name',$name)->render();
    });
    Route::post('/select-ciudades', function (\Illuminate\Http\Request $request){
        $ciudades = [''=>'Seleccione una ciudad']+\FuxionLogistic\Models\Ciudad::pluck('nombre','id')->toArray();
        $name = 'ciudad';
        if($request->has('departamento')){
            $ciudades = [''=>'Seleccione una ciudad']+\FuxionLogistic\Models\Ciudad::where('departamento_id',$request->input('departamento'))->pluck('nombre','id')->toArray();
        }

        if($request->has('name'))$name = $request->input('name');

        return view('layouts.componentes.select')
            ->with('elementos',$ciudades)
            ->with('name',$name)->render();
    });
});

/**
* ACCESO A IMAGENES DESDE LA APP
 * Autor: Carlos Ramirez
*/


Route::get('images/{pedido_id}/{filename}', function ($pedido_id, $filename)
{
    $path = storage_path() . '/app/'.$pedido_id.'/'.$filename;

    if(!File::exists($path)) abort(404);

    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
});