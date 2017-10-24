<?php

namespace FuxionLogistic\Http\Controllers;


use FuxionLogistic\Models\Bodega;
use FuxionLogistic\Models\Empresario;
use FuxionLogistic\Models\Corte;
use FuxionLogistic\Models\Pedido;
use FuxionLogistic\Models\Producto;
use FuxionLogistic\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\Datatables\Facades\Datatables;

class CorteController extends Controller
{
    public $privilegio_superadministrador = true;
    protected $modulo_id = 4;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('permisoModulo:'.$this->modulo_id.',' . $this->privilegio_superadministrador);
    }

    public function index()
    {
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');
        return view('corte/index')->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function lista(){
        $cortes = Corte::select('cortes.*',
            DB::raw('CONCAT(users.nombres," ",users.apellidos) as usuario'))
            ->join('users','cortes.user_id','=','users.id')
            ->get();

        $table = Datatables::of($cortes);//->removeColumn('id');

        $table = $table->editColumn('pedidos',function ($row){
            return Pedido::where('corte_id',$row->id)->count();
        })
        ->editColumn('opciones',function ($row){
            $opc = '';
            if(Auth::user()->tieneFunciones($this->modulo_id,[4],false,$this->privilegio_superadministrador)) {
                $opc .= '<a href="' . url('/corte/detalle') .'/'. $row->id . '" class="btn btn-xs btn-primary margin-2" data-toggle="tooltip" data-placement="bottom" title="Detalle"><i class="white-text fa fa-list-alt"></i></a>';
            }
            return $opc;
        })->rawColumns(['opciones']);
        $table = $table->make(true);
        return $table;
    }

    public function importar(){
        if(!Auth::user()->tieneFuncion($this->modulo_id,5,$this->privilegio_superadministrador))
            return redirect('/');
        return view('corte/importar')->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function guardar(Request $request){
        $rol = \FuxionLogistic\Models\Rol::where('empresarios','si')->first();
        if(!$rol){
            return response(['error'=>['Para realizar la importación de pedidos de forma manual es necesario que exista un rol asignable a empresarios.']],422);
        }
        $rules = [
            'archivo'=>'required|file|mimes:xlsx,xls|max:1000'
        ];

        $mensajes = [
            'archivo.required'=>'Seleccione un archivo.',
            'archivo.file'=>'Seleccione un archivo',
            'archivo.mimes'=>'El archivo seleccionado debe ser de tipo .xls o .xlsx.',
            'archivo.max'=>'El tamaño maximo del archivo es de 1MB',
        ];

        $this->validate($request,$rules,$mensajes);
        $complete = true;
        $error = '';

        Excel::load($request->file('archivo'),function ($reader) use (&$rol,&$error,&$complete){
            $results = $reader->all();
            DB::beginTransaction();
            //se crea un nuevo registro de importacion
            $corte = new Corte();
            $corte->user_id = Auth::user()->id;
            $corte->numero = Corte::ultimoNumeroCorte()+1;
            $corte->save();

            $i = 2;
            foreach ($results as $row){
                //se busca la bodega
                $bodega = Bodega::where('alias',$row->warehouse)->first();
                if(!$bodega){
                    $error = 'No se ha encontrado ninguna bodega con el alias "'.$row->warehouse.'". Para corregir el error registre la bodega en el sistema. Error en linea #'.$i;
                    $complete = false;
                    return false;
                }

                //se busca si el empresario ya existe en el sistema
                $empresario = Empresario::where('empresario_id',$row->customer_id)->first();
                //si no existe el empresario se crea un registro nuevo
                if(!$empresario){
                    if(!$row->correo || $row->correo == ''){
                        $error = 'El correo de todos los empresarios es obligatorio, por favor registre el correo. Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }
                    if(!$row->customer_id || $row->customer_id == ''){
                        $error = 'El campo customer_id de todos los empresarios es obligatorio, por favor registre el campo solicitado. Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }
                    if(!filter_var($row->correo,FILTER_VALIDATE_EMAIL)){
                        $error = 'El valor de correo ('.$row->correo.') no es válido. Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }

                    //se validan usuarios con el mismo correo
                    $user_email = User::where('email',$row->correo)->first();
                    if($user_email){
                        $error = 'Ya existe un usuario con el correo ('.$row->correo.'). Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }

                    $user_client = new User();
                    $user_client->nombres = $row->first_name_ped;
                    $user_client->apellidos = $row->last_name_ped;
                    $user_client->telefono = $row->telefono;
                    $user_client->email = $row->correo;
                    $user_client->tipo_identificacion = 'C.C';
                    $user_client->identificacion = $row->identificaion_del_cliente;
                    $user_client->rol_id = $rol->id;
                    $user_client->save();

                    $empresario = new Empresario();
                    $empresario->tipo = $row->customer_type;
                    $empresario->direccion = $row->direccion_referencia;
                    $empresario->ciudad = $row->ciudad;
                    $empresario->departamento = $row->departamento;
                    $empresario->empresario_id = $row->customer_id;
                    $empresario->enroler_id = $row->enroller_id;
                    $empresario->user_id = $user_client->id;
                    $empresario->save();
                }

                //se busca si existe la orden con el mismo orden_id
                $pedido = Pedido::where('orden_id',$row->order_id)->first();
                //si existe se conprueba que este relacionado con la misma importación
                if($pedido){
                    if($pedido->corte_id && $pedido->corte_id != $corte->id){
                        $error = 'Ya se ha registrado un corte con código '.$row->order_id.' Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }
                }else{
                    if(!$row->order_id || $row->order_id == ''){
                        $error = 'El campo order_id es requerido en el formato, por favor registre el campo solicitado. Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }
                    //se crea el corte si no existe
                    $pedido = new Pedido();
                    $pedido->fecha_orden = $row->fecha_de_orden;
                    $pedido->fecha_impresion = $row->fecha_de_impresia3n;
                    $pedido->serie = $row->serie;
                    $pedido->correlativo = $row->correlativo;
                    $pedido->orden_id = $row->order_id;
                    $pedido->impreso_por = $row->impreso_por;
                    $pedido->subtotal = floatval($row->subtotal)/10000;
                    $pedido->total_tax = floatval($row->total_tax)/10000;
                    $pedido->total = floatval($row->order_total)/10000;
                    $pedido->tipo_pago = $row->payment_type;
                    $pedido->volumen_comisionable = floatval($row->commissionable_volume)/10000;
                    $pedido->costo_envio = floatval($row->shipping_charge)/10000;
                    $pedido->empresario_id = $empresario->id;
                    $pedido->bodega_id = $bodega->id;
                    $pedido->estado = 'pendiente';//valor por defecto mientras se evalua si se cambia
                    $pedido->save();
                }

                //se consulta si existe el producto
                $producto = Producto::where('codigo',$row->item_code)->first();
                //si no existe el producto se crea el registro
                if(!$producto){
                    if(!$row->item_code || $row->item_code == ''){
                        $error = 'El campo item code es requerido en el formato, por favor registre el campo solicitado. Error en linea #'.$i;
                        $complete = false;
                        return false;
                    }
                    $producto = new Producto();
                    $producto->codigo = $row->item_code;
                    $producto->codigo = $row->item_description;
                    $producto->save();
                }

                //se relaciona el corte con el producto
                $pedido->productos()->save($producto,[
                    'cantidad'=>floatval($row->quantity)/10000,
                    'precio_unitario'=>floatval($row->price_each)/10000,
                    'descuento'=>floatval($row->discount)/10000,
                    'total'=>floatval($row->order_line_total)/10000
                ]);

                $validar_flete = false;
                //se valida si el empresario a adquirido o no el kit de afiliación
                if(!$empresario->validarKit()){
                    //se valida si el kit es el item o producto relacionado
                    if($producto->descripcion == 'KIT DE AFILIACION COLOMBIA'){
                        $empresario->kit = 'si';
                        $empresario->save();
                        $validar_flete = true;
                    }else{
                        //corte pendiente y sin corte y envio de correo a soporte, push y correo a empresario
                        $pedido->estado = 'pendiente';
                        $pedido->save();
                    }
                }else{
                    //el empresario si tiene kit
                    $validar_flete = true;
                }

                //validacion de flete o costo de envio
                if($validar_flete){
                    //si tiene flete
                    if($row->shipping_charge){
                        $pedido->corte_id = $corte->id;
                        $pedido->estado = 'en cola';
                        $pedido->save();

                        //se relacionan los pedidos pendientes con este corte
                        $pedidos_pendientes = Pedido::where('empresario_id',$empresario->id)->where('estado','pendiente')->get();
                        foreach ($pedidos_pendientes as $p_p){
                            $p_p->corte_id = $corte->id;
                            $p_p->estado = 'en cola';
                            $p_p->save();
                        }

                        //enviar correo y push a empresario
                    }
                }
                $i++;
            }

        });

        if(!$complete) {
            DB::rollBack();
            return response(['error' => [$error]], 422);
        }else {
            DB::commit();
            return ['success' => true];
        }
    }

    public function detalle($id){
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');
        $corte = Corte::find($id);
        if(!$corte)return redirect('/corte');

        return view('corte/detalle')
            ->with('privilegio_superadministrador',$this->privilegio_superadministrador)
            ->with('corte',$corte);
    }

    public function listaPedidosCorte($id){
        $corte = Corte::find($id);
        if(!$corte)return redirect('/corte');

        $pedidos = Pedido::select('pedidos.*',DB::raw('CONCAT(users.nombres," ",users.apellidos) as empresario'))
            ->join('empresarios','pedidos.empresario_id','=','empresarios.id')
            ->join('users','empresarios.user_id','=','users.id')
            ->where('pedidos.corte_id',$id)
            ->get();

        $table = Datatables::of($pedidos);//->removeColumn('id');

        /*$table = $table->editColumn('bodega',function ($row){
            return $row->bodega->nombre;
        })
        ->editColumn('precio_unitario',function ($row){
            return '$ '.number_format($row->precio_unitario,2,',','.');
        })
        ->editColumn('total_producto',function ($row){
            return '$ '.number_format($row->total_producto,2,',','.');
        })
        ->editColumn('total_tax',function ($row){
            return '$ '.number_format($row->total_tax,2,',','.');
        })
        ->editColumn('costo_envio',function ($row){
            return '$ '.number_format($row->costo_envio,2,',','.');
        })
        ->editColumn('descuento',function ($row){
            return number_format($row->descuento,2,',','.').'%';
        })
        ->editColumn('total',function ($row){
            return '$ '.number_format($row->total,2,',','.');
        });*/

        $table = $table->make(true);
        return $table;
    }


}
