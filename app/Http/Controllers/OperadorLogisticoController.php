<?php

namespace FuxionLogistic\Http\Controllers;

use FuxionLogistic\Http\Requests\RequestOperadorLogistico;
use FuxionLogistic\Http\Requests\UsuarioRequest;
use FuxionLogistic\Mail\NuevaCuenta;
use FuxionLogistic\Models\Archivo;
use FuxionLogistic\Models\Ciudad;
use FuxionLogistic\Models\Departamento;
use FuxionLogistic\Models\OperadorLogistico;
use FuxionLogistic\Models\Ubicacion;
use FuxionLogistic\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Yajra\Datatables\Facades\Datatables;

class OperadorLogisticoController extends Controller
{

    public $privilegio_superadministrador = true;
    protected $modulo_id = 7;

    function __construct()
    {
        $this->middleware('permisoModulo:'.$this->modulo_id.',' . $this->privilegio_superadministrador,['except'=>['']]);
    }

    public function index(){
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');
        return view('operador_logistico.index')->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function crear(){
        if(!Auth::user()->tieneFuncion($this->modulo_id,1,$this->privilegio_superadministrador))
            return redirect('/');

        return view('operador_logistico.crear')->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function guardar(RequestOperadorLogistico $request){
        if(!Auth::user()->tieneFuncion($this->modulo_id,1,$this->privilegio_superadministrador))
            return response(['error'=>['Unauthorized.']],401);
        DB::beginTransaction();

        $ubicacion = new Ubicacion();
        $ubicacion->fill($request->all());
        $ubicacion->ciudad_id = $request->input('ciudad');
        $ubicacion->save();

        $operador_logistico = new OperadorLogistico($request->all());
        $operador_logistico->ubicacion_id = $ubicacion->id;

        if($request->has('web_service'))
                $operador_logistico->ws = 'si';

        $operador_logistico->save();

        DB::commit();

        return ['success'=>true];
    }

    public function editar($id){
        if(!Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador))
            return redirect('/');

        $operador_logistico = OperadorLogistico::select('operadores_logisticos.*',
                'ubicaciones.barrio as barrio','ubicaciones.calle as calle','ubicaciones.carrera as carrera','ubicaciones.numero as numero','ubicaciones.especificaciones as especificaciones')
            ->join('ubicaciones','operadores_logisticos.ubicacion_id','=','ubicaciones.id')
            ->where('operadores_logisticos.id',$id)->first();
        if(!$operador_logistico) return redirect('/');

        $departamentos = Departamento::where('pais_id',$operador_logistico->ubicacion->ciudad->departamento->pais->id)->pluck('nombre','id')->toArray();
        $ciudades = Ciudad::where('departamento_id',$operador_logistico->ubicacion->ciudad->departamento->id)->pluck('nombre','id')->toArray();

        return view('operador_logistico.editar')
            ->with('operador_logistico',$operador_logistico)
            ->with('ciudades',$ciudades)
            ->with('departamentos',$departamentos)
            ->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function actualizar(RequestOperadorLogistico $request){
        if(!Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador))
            return response(['error'=>['Unauthorized']],401);

        DB::beginTransaction();

        $operador_logistico = OperadorLogistico::find($request->input('id'));
        if(!$operador_logistico)return response(['error'=>['La información enviada es incorrecta']],422);

        $ubicacion_id = $operador_logistico->ubicacion_id;
        $operador_logistico->fill($request->all());
        $operador_logistico->ubicacion_id = $ubicacion_id;
        if($request->has('web_service')) $operador_logistico->ws = 'si';
        else $operador_logistico->ws = 'no';
        $operador_logistico->save();

        $ubicacion = $operador_logistico->ubicacion;
        $ubicacion->fill($request->all());
        $ubicacion->ciudad_id = $request->input('ciudad');
        $ubicacion->save();

        DB::commit();
        return ['success'=>true];
    }

    public function borrar(Request $request){
        if($request->has('id')){
            $operador_logistico = OperadorLogistico::find($request->input('id'));
            if($operador_logistico){
                $operador_logistico->delete();
            }

            return ['success'=>true];
        }
        return response(['error'=>['La información enviada es incorrecta']],422);
    }

    public function lista(){
        $operadores_logisticos = OperadorLogistico::select('operadores_logisticos.*','ciudades.nombre as ciudad')
            ->join('ubicaciones','operadores_logisticos.ubicacion_id','=','ubicaciones.id')
            ->join('ciudades','ubicaciones.ciudad_id','=','ciudades.id')
            ->orderBy('operadores_logisticos.created_at', 'ASC')->get();

        $table = Datatables::of($operadores_logisticos);//->removeColumn('id');

        $table = $table->editColumn('opciones', function ($r) {
            $opc = '';
            if(Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador)) {
                $opc .= '<a href="' . url('/operador-logistico/editar') .'/'. $r->id . '" class="btn btn-xs btn-primary margin-2" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="white-text fa fa-pencil-square-o"></i></a>';
            }

            if(Auth::user()->tieneFuncion($this->modulo_id,3,$this->privilegio_superadministrador)) {
                $opc .= '<a href="#!" data-operador-logistico="'.$r->id.'" class="btn btn-xs btn-danger margin-2 btn-eliminar-operador-logistico" data-toggle="modal" data-target="#modal-eliminar-operador-logistico"><i class="white-text fa fa-trash"></i></a>';
            }

            return $opc;

        })->rawColumns(['opciones']);

        if(!Auth::user()->tieneFunciones($this->modulo_id,[2,3],false,$this->privilegio_superadministrador))$table->removeColumn('opciones');

        $table = $table->make(true);
        return $table;
    }
}
