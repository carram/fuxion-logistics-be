<?php

namespace FuxionLogistic\Http\Controllers;


use FuxionLogistic\Models\Bodega;
use FuxionLogistic\Models\Empresario;
use FuxionLogistic\Models\Corte;
use FuxionLogistic\Models\EstadoPedido;
use FuxionLogistic\Models\Guia;
use FuxionLogistic\Models\MallaCobertura;
use FuxionLogistic\Models\OperadorLogistico;
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
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');

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
        if(!Auth::user()->tieneFuncion($this->modulo_id,5,$this->privilegio_superadministrador))
            return redirect('/');
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
            $estado_pendiente = EstadoPedido::where('no_asignacion_corte','si')->first();
            $estado_en_cola = EstadoPedido::where('asignacion_corte','si')->first();

            if(!$estado_en_cola || !$estado_pendiente){
                $error = 'Para registrar cortes asegurese de registrar los <a href="'.url("/estado-pedido/crear").'" target="_blank">estados del pedido</a> con corte asignado y pedido sin corte asignado.';
                $complete = false;
                return false;
            }

            $results = $reader->all();
            DB::beginTransaction();
            //se crea un nuevo registro de importacion
            $corte = new Corte();
            $corte->user_id = Auth::user()->id;
            $corte->numero = Corte::ultimoNumeroCorte()+1;
            $corte->save();

            $i = 2;
            //foreach para relacionar los pedidos con los productos
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
                    $empresario->direccion = trim($row->direccion_referencia);
                    $empresario->ciudad = trim($row->ciudad);
                    $empresario->departamento = trim($row->departamento);
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
                    $pedido->descuento = floatval($row->discount)/10000;
                    $pedido->tipo_pago = $row->payment_type;
                    $pedido->volumen_comisionable = floatval($row->commissionable_volume)/10000;
                    $pedido->costo_envio = floatval($row->shipping_charge)/10000;
                    $pedido->empresario_id = $empresario->id;
                    $pedido->bodega_id = $bodega->id;
                    $pedido->corte_id = $corte->id;
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
                    $producto->codigo = trim($row->item_code);
                    $producto->descripcion = trim($row->item_description);
                    $producto->save();
                }

                //se relaciona el corte con el producto
                $pedido->productos()->save($producto,[
                    'cantidad'=>floatval($row->quantity)/10000,
                    'precio_unitario'=>floatval($row->price_each)/10000,
                    'total'=>floatval($row->order_line_total)/10000
                ]);
                $i++;
            }

            $pedidos_corte = $corte->pedidos;

            //foreach para determinar el estado de cada pedido y su relacion con el corte
            foreach ($pedidos_corte as $pedido){
                $empresario = $pedido->empresario;
                $empresario_kit = false;

                //si el empresario tiene kit registrado
                //o aparece en la lista de empresarios con kit
                if($empresario->validarKit()){
                    $empresario_kit = true;
                }else{
                    //se valida si en el pedido se envia el kit
                    $productos_pedido = $pedido->productos;
                    foreach ($productos_pedido as $producto){
                        if($producto->descripcion == 'KIT DE AFILIACION COLOMBIA'){
                            $empresario->kit = 'si';
                            $empresario->save();
                            $empresario_kit = true;
                        }
                    }
                }

                $en_cola = false;
                //si el empresario tiene kit y flete debe quedar en cola y con la relacion con el corte
                //de lo contrario se quita la relacion con el corte y se deja pendiente
                if($empresario_kit){
                    if($pedido->costo_envio){
                        $en_cola = true;
                    }
                }

                if($en_cola){
                    $pedido->estadosPedidos()->save($estado_en_cola);
                }else{
                    $pedido->estadosPedidos()->save($estado_pendiente);
                    $pedido->corte_id = null;
                }
                $pedido->save();
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
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');
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

    public function aplicarMallaCobertura($id){
        if(!Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador))
            return response(['error'=>['Unauthorized.']],401);
        $corte = Corte::find($id);

        if(!$corte)return response(['error'=>['La información enviada es incorrecta.']],422);

        DB::beginTransaction();
        $pedidos = $corte->pedidos;

        foreach ($pedidos as $pedido){
            if(!$pedido->guia_id) {
                //guias con igual serie y correlativo donde se pueda agrupar el pedido
                //solo se envia en una guía máximo dos pedidos, donde uno sea el kit de afiliación
                $guia_factura = Guia::select('guias.*')
                    ->join('pedidos', 'guias.id', '=', 'pedidos.guia_id')
                    ->join('pedidos_productos', 'pedidos.id', '=', 'pedidos_productos.pedido_id')
                    ->join('productos', 'pedidos_productos.producto_id', '=', 'productos.id')
                    ->where('pedidos.serie', $pedido->serie)
                    ->where('pedidos.correlativo', $pedido->correlativo)
                    ->where('productos.descripcion','KIT DE AFILIACION COLOMBIA')->first();


                if ($guia_factura && $guia_factura->pedidos()->count()==1) {
                    $pedido->guia_id = $guia_factura->id;
                    $pedido->save();
                } else {//no tiene guia con que relacionar

                    $empresario = $pedido->empresario;
                    $malla_cobertura = MallaCobertura::where('destino', $empresario->ciudad)->first();
                    if (!$malla_cobertura) return response(['error' => ['No existe una malla de cobertura destinada para ' . $empresario->ciudad]], 422);

                    $guia = new Guia();
                    $guia->malla_cobertura_id = $malla_cobertura->id;
                    $guia->operador_logistico_id = $malla_cobertura->operador_logistico_id;
                    $guia->save();
                    $pedido->guia_id = $guia->id;
                    $pedido->save();
                }
            }
        }
        DB::commit();
        return ['success'=>true];

    }

    public function guias($id){
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');

        $corte = Corte::find($id);
        if(!$corte)return redirect('/');
        return view('corte.guias')->with('corte',$corte)->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function guiasOperadorLogistico($corte,$operadorLogistico){
        if(!Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador))
            return redirect('/');

        $corte = Corte::find($corte);
        $operador_logistico = OperadorLogistico::find($operadorLogistico);

        if(!$corte || !$operador_logistico)return redirect('/');

        return view('corte.guias_operador_logistico')
            ->with('corte',$corte)
            ->with('operador_logistico',$operador_logistico)
            ->with('privilegio_superadministrador',$this->privilegio_superadministrador);
    }

    public function listaGuiasOperadorLogistico($corte,$operadorLogistico){
        if(!Auth::user()->tieneFuncion($this->modulo_id,4,$this->privilegio_superadministrador))
            return redirect('/');

        $corte = Corte::find($corte);
        $operador_logistico = OperadorLogistico::find($operadorLogistico);

        if(!$corte || !$operador_logistico)return redirect('/');

        $guias = $operador_logistico->guias()
            ->select(
                'guias.*',
                'pedidos.serie',
                'empresarios.ciudad as destino',
                'pedidos.correlativo',
                'guias.created_at as fecha_guia',
                'empresarios.tipo as tipo_empresario',
                DB::raw('CONCAT(users.nombres," ",users.apellidos) as empresario')
            )
            ->join('pedidos','guias.id','=','pedidos.guia_id')
            ->join('cortes','pedidos.corte_id','=','cortes.id')
            ->join('empresarios','pedidos.empresario_id','=','empresarios.id')
            ->join('users','empresarios.user_id','=','users.id')
            ->where('cortes.id',$corte->id)
            ->where('guias.estado','registrada')
            ->get();

        $table = Datatables::of($guias);//->removeColumn('id');

        $table = $table->editColumn('seleccione',function ($row){
            return '<input type="checkbox" name="guias[]" value="'.$row->id.'">';
        })->rawColumns(['seleccione']);
        $table = $table->make(true);
        return $table;
    }

    public function reasignarGuiasOperadorLogistico(Request $request){
        if(!Auth::user()->tieneFuncion($this->modulo_id,2,$this->privilegio_superadministrador))
            return response(['error'=>['Unauthorized.']],401);

        if(!$request->has('guias'))
            return response(['error'=>['No se ha seleccionado ningúna guía']],422);

        if(!is_array($request->input('guias')))
            return response(['error'=>['La información enviada es incorrecta']],422);

        if(!$request->has('operador'))
            return response(['error'=>['Seleccione un operador logístico']],422);

        $operador_logistico = OperadorLogistico::find($request->input('operador'));

        if(!$operador_logistico)
            return response(['error'=>['La información enviada es incorrecta']],422);

        foreach ($request->input('guias') as $id_guia){
            $guia = Guia::where('estado','registrada')->find($id_guia);
            if($guia->operador_logistico_id != $operador_logistico->id){
                $guia->update(
                    ['operador_logistico_id'=>$operador_logistico->id]
                );
            }
        }
        return ['success'=>true];
    }

    public function guiasAutomaticas($corte_id,$operador_logistico_id){
        $corte = Corte::find($corte_id);
        $operador_logistico = OperadorLogistico::find($operador_logistico_id);
        $guias = $operador_logistico->guias()->select('guias.*')
            ->join('pedidos','guias.id','=','pedidos.guia_id')
            ->join('cortes','pedidos.corte_id','=','cortes.id')
            ->where('cortes.id',$corte->id)
            ->where('guias.estado','registrada')
            ->get();
        dd($guias);
    }
}
