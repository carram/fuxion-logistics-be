<?php

namespace FuxionLogistic\Http\Controllers;

use FuxionLogistic\Http\Requests\RequestFuncion;
use FuxionLogistic\Http\Requests\RequestModulo;
use FuxionLogistic\Models\Funcion;
use FuxionLogistic\Models\Modulo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ModulosFuncionesController extends Controller
{
    public $privilegio_superadministrador = true;
    protected $modulo_id = 1;

    public function __construct()
    {
        $this->middleware('permisoModulo:'.$this->modulo_id.',' . $this->privilegio_superadministrador);
    }

    function index()
    {
        return view("modulos_funciones.index")
            ->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function vistaModulos()
    {
        return view('modulos_funciones.lista_modulos')
            ->with('modulos', Modulo::orderBy("nombre")->get())
            ->with('privilegio_superadministrador', $this->privilegio_superadministrador);
    }

    public function vistaFunciones(Request $request)
    {
        $modulo = null;
        if ($request->has('modulo'))
            $modulo = Modulo::find($request->input('modulo'));

        return view('modulos_funciones.lista_funciones')
            ->with('funciones', Funcion::orderBy("nombre")->get())
            ->with('modulo', $modulo)
            ->with('privilegio_superadministrador', $this->privilegio_superadministrador);
    }


    /**
     * Actualiza la relacion entre un módulo y unla funcion seleccionada.
     */
    public function actualizarRelacion(Request $request)
    {
        if (!Auth::user()->tieneFuncion($this->modulo_id, 2, $this->privilegio_superadministrador))
            return response(['error' => ['Unauthorized.']], 401);

        if ($request->has('accion') && $request->has('funcion')) {
            $modulo = Modulo::find($request->input('modulo'));
            $funcion = Funcion::find($request->input('funcion'));
            if ($modulo && $funcion) {
                if ($request->input('accion') == 'agregar') {
                    if (!$modulo->tieneFuncion($request->input('funcion'))) {
                        $modulo->funciones()->save($funcion);
                    }
                    return ['success' => true];
                } else if ($request->input('accion') == 'eliminar') {
                    if ($modulo->tieneFuncion($request->input('funcion'))) {
                        $modulo->funciones()->detach($funcion);
                    }
                    return ['success' => true];
                }
            }
        }
        return response(['error' => ['La información enviada es incorrecta']], 422);
    }

    public function nuevoModulo(RequestModulo $request)
    {
        if (!Auth::user()->tieneFuncion($this->modulo_id, 1, $this->privilegio_superadministrador))
            return response(['error' => ['Unauthorized.']], 401);

        $modulo = new Modulo($request->all());
        $modulo->save();
        return ['success' => true];
    }

    public function nuevaFuncion(RequestFuncion $request)
    {
        if (!Auth::user()->tieneFuncion($this->modulo_id, 1, $this->privilegio_superadministrador))
            return response(['error' => ['Unauthorized.']], 401);

        $funcion = new Funcion($request->all());
        $funcion->save();
        return ['success' => true];
    }

    public function formModulo(Request $request){
        $modulo = new Modulo();
        if($request->has('modulo'))$modulo = Modulo::find($request->input('modulo'));

        return view('modulos_funciones/form_modulo')->with('modulo',$modulo)->render();
    }

    public function editarModulo(RequestModulo $request)
    {
        if (!Auth::user()->tieneFuncion($this->modulo_id, 2, $this->privilegio_superadministrador))
            return response(['error' => ['Unauthorized.']], 401);
        if (!$request->has('modulo'))
            return response(['error' => ['La información enviada es incorrecta.']], 422);

        $modulo = Modulo::find($request->input('modulo'));
        $identificador = $modulo->identificador;
        $modulo->fill($request->all());
        $modulo->identificador = $identificador;
        $modulo->save();
        return ['success' => true];
    }

    public function formFuncion(Request $request){
        $funcion = new Funcion();
        if($request->has('funcion'))$funcion = Funcion::find($request->input('funcion'));

        return view('modulos_funciones/form_funcion')->with('funcion',$funcion)->render();
    }

    public function editarFuncion(RequestFuncion $request)
    {
        if (!Auth::user()->tieneFuncion($this->modulo_id, 2, $this->privilegio_superadministrador))
            return response(['error' => ['Unauthorized.']], 401);

        if (!$request->has('funcion'))
            return response(['error' => ['La información enviada es incorrecta.']], 422);

        $funcion = Funcion::find($request->input('funcion'));
        $identificador = $funcion->identificador;
        $funcion->fill($request->all());
        $funcion->identificador = $identificador;
        $funcion->save();
        return ['success' => true];
    }
}