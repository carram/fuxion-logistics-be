<?php

namespace FuxionLogistic\Http\Controllers\v1;

use Illuminate\Http\Request;
use FuxionLogistic\Http\Controllers\Controller;
use FuxionLogistic\Models\Corte;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CorteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $cortes = Corte::select('cortes.*',
            DB::raw('CONCAT(users.nombres," ",users.apellidos) as usuario'))
            ->join('users','cortes.user_id','=','users.id')
            ->where('cortes.user_id',Auth::user()->id)
            ->get();

//        if(count($cortes)>0)
            return response(["data" => $cortes]);
  //      else
    //        return response(["sucess" => "ok"]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function aplicarMallaCobertura($id){

        $corte = Corte::find($id);

        if(!$corte)return response(['error'=>['La información enviada es incorrecta.']],422);
        if($corte->guias_asignadas == 'si')return ['success'=>true];

        DB::beginTransaction();
        $pedidos = $corte->pedidos;

        foreach ($pedidos as $pedido){
            if(!$pedido->guia_id) {
                //guias con igual serie y correlativo donde se pueda agrupar el pedido
                //solo se envia en una guía máximo dos pedidos, donde uno sea el kit de afiliación
                $guia_factura = Guia::select('guias.*')
                    ->join('guias_pedidos', 'guias.id', '=', 'guias_pedidos.guia_id')
                    ->join('pedidos', 'guias_pedidos.pedido_id', '=', 'pedidos.id')
                    ->join('pedidos_productos', 'pedidos.id', '=', 'pedidos_productos.pedido_id')
                    ->join('productos', 'pedidos_productos.producto_id', '=', 'productos.id')
                    ->where('pedidos.serie', $pedido->serie)
                    ->where('pedidos.correlativo', $pedido->correlativo)
                    ->where('guias.estado','registrada')
                    ->where('productos.descripcion','KIT DE AFILIACION COLOMBIA')->first();


                if ($guia_factura && $guia_factura->pedidos()->count()==1) {
                    $guia_factura->pedidos()->save($pedido);
                } else {//no tiene guia con que relacionar

                    $empresario = $pedido->empresario;
                    $malla_cobertura = MallaCobertura::where('destino', $empresario->ciudad)->first();
                    if (!$malla_cobertura) return response(['error' => ['No existe una malla de cobertura destinada para ' . $empresario->ciudad]], 422);

                    $guia = new Guia();
                    $guia->malla_cobertura_id = $malla_cobertura->id;
                    $guia->operador_logistico_id = $malla_cobertura->operador_logistico_id;
                    $guia->save();
                    $guia->pedidos()->save($pedido);
                }
            }
        }
        $corte->guias_asignadas = 'si';
        $corte->save();
        DB::commit();
        return ['success'=>true];

    }

    public function getNumeroGuias($id){
        $guias = DB::select("
                            select total, op.id as operador_id, op.nombre as operador_nombre from (
                            SELECT 
                                COUNT(*) AS total, t.operador_logistico_id
                            FROM
                                (SELECT 
                                    *
                                FROM
                                    fuxion_logistic.v_guias_pedidos_corte
                                    WHERE corte_id = '$id'
                                GROUP BY guia_id) AS t
                            GROUP BY t.corte_id , t.operador_logistico_id
                            ) as p 
                            right join operadores_logisticos op on op.id= p.operador_logistico_id 
                            
                            ");

//        if(count($cortes)>0)
        return response(["data" => $guias]);
    }

    public function getGuiasPorOperadorYCorte($operador_id, $corte_id){
        $guias = DB::select("select DISTINCT(g.id) as guia_id,  g.numero, e.direccion, e.ciudad
                                from guias g
                                inner join guias_pedidos gp on g.id=gp.guia_id
                                inner join pedidos p on gp.pedido_id=p.id
                                inner join empresarios e on p.empresario_id = e.id
                                 where g.operador_logistico_id='$operador_id'
                                 and p.corte_id='$corte_id'");
        $operadores = DB::select("select * from operadores_logisticos where id <>'$operador_id' order by id asc");
        return response(["data" => $guias, "operadores" => $operadores ]);
    }
}
