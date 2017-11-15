<?php

namespace FuxionLogistic\Http\Controllers\v1;

use FuxionLogistic\Models\Corte;
use FuxionLogistic\Models\Empresario;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use FuxionLogistic\Models\Pedido;
use FuxionLogistic\Http\Controllers\Controller;
use Yajra\Datatables\Request;

class PedidoController extends Controller
{
    //

    public function getPedido($barcode,$corte_id)
    {

        $pedidos = Pedido::select("pedidos.*","guias.*","t1.razon_estado as razon_estado", "guias_pedidos.id as guia_pedido_id","pedidos.id as pedido_id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("cortes","pedidos.corte_id","=","cortes.id")
            ->leftJoin(DB::raw("(SELECT
                                    razon_estado,
                                    estado_pedido_id,
                                    pedido_id as pid
                                    FROM
                                v_historial_estados_pedido hep
                            WHERE
                                hep.historial_estado_pedido_id in (SELECT 
                                        MAX(id) AS max_id
                                    FROM
                                        historial_estados_pedidos he group by pedido_id)
                                    ) as t1"),"t1.pid","=","pedidos.id")
            ->where("guias.numero",$barcode)
            ->where("cortes.id",$corte_id)
            ->get();

        $empresario = Empresario::select("empresarios.*","users.*")
            ->join("pedidos","pedidos.empresario_id","=","empresarios.id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("users","users.id","=","empresarios.user_id")
            ->where("guias.numero",$barcode)->first();

        $productos = DB::select("select
                                        pr.*,
                                        pp.*,
                                        pr.id as producto_id,
                                        pe.id as pedido_id,
                                        gp.id as guia_pedido_id
                                    from
                                        pedidos_productos pp
                                            inner join productos pr on pr.id=pp.producto_id
                                            inner join pedidos pe on pe.id=pp.pedido_id
                                            inner join guias_pedidos gp on gp.pedido_id = pe.id
                                            inner join guias g on g.id = gp.guia_id
                                            where g.numero = '".$barcode."'  and pr.codigo <> 'DSCT' order by pe.id ");




        return response(["data" => $pedidos, "empresario" => $empresario, "productos" => $productos  ]);
    }


    public function getDevolucion($barcode)
    {

        $pedidos = Pedido::select("pedidos.*","guias.*", "guias_pedidos.id as guia_pedido_id", "pedidos.id as pedido_id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->where("guias.numero",$barcode)
            ->get();

        $empresario = Empresario::select("empresarios.*","users.*")
            ->join("pedidos","pedidos.empresario_id","=","empresarios.id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("users","users.id","=","empresarios.user_id")
            ->where("guias.numero",$barcode)->get();

        $productos = DB::select("select
                                        pr.*,
                                        pp.*,
                                        pr.id as producto_id
                                    from
                                        pedidos_productos pp
                                            inner join productos pr on pr.id=pp.producto_id
                                            inner join pedidos pe on pe.id=pp.pedido_id
                                            inner join guias_pedidos gp on gp.pedido_id = pe.id
                                            inner join guias g on g.id = gp.guia_id
                                            where g.numero = '".$barcode."'  and pr.codigo <> 'DSCT' ");

        // dd($corte_id);

        return response(["data" => $pedidos, "empresario" => $empresario, "productos" => $productos]);
    }
    
    public function setIngreso(Request $r){
        $ids = json_decode($r->input("id"));

        //dd($ids);
        if(isset($ids)) {
            foreach ($ids as $id) {
                DB::statement("insert into historial_estados_pedidos (pedido_id, estado_pedido_id,razon_estado, created_at) values ('" . $id->id . "','8','Ingresado a bodega','" . date("Y-m-d h:i:s") . "')");

            }

            return response(['success' => true]);
        }
    }

    public function setEstado(Request $r){

        $pedidos = DB::select("select 
                                    * 
                                from 
                                    v_guias_pedidos_corte
                                 where numero_guia='".$r->input("guia")."'
                                             ");

        $respuesta = "";
        foreach ($pedidos as $pedido){


            if($r->input("cambiado")=='true') {
                $conteo = DB::select("select count(*) as total from v_productos_enviados where pedido_id='" . $pedido->pedido_id . "'  ");

                if($conteo[0]->total>0) {
                    $respuesta = "Cambio de estado del pedido $pedido->pedido_id a Pendiente por productos";
                    DB::statement("insert into historial_estados_pedidos (pedido_id, estado_pedido_id, razon_estado, created_at) values ('$pedido->pedido_id','8','Pendiente por productos','" . date("Y-m-d h:i:s") . "')");
                }
                else {
                    $respuesta = "Cambio de estado del pedido $pedido->pedido_id a Enviado";
                    DB::statement("insert into historial_estados_pedidos (pedido_id, estado_pedido_id, created_at) values ('$pedido->pedido_id','11','" . date("Y-m-d h:i:s") . "')");
                }
            }else{
                $respuesta = "Cambio de estado del pedido $pedido->pedido_id a Enviado";
                DB::statement("insert into historial_estados_pedidos (pedido_id, estado_pedido_id, created_at) values ('$pedido->pedido_id','11','" . date("Y-m-d h:i:s") . "')");
            }
        }


        return response([ "data" => $respuesta, 'success' => true ]);
    }

    public function getConsolidado($corte){
        $en_cola=DB::select("select count(*) as en_cola from v_historial_estados_pedido
                                where 
                                    historial_estado_pedido_id in
                                    (SELECT 
                                    MAX(id) AS max_id
                                FROM
                                    fuxion_logistic.historial_estados_pedidos
                                GROUP BY pedido_id) and corte_id='".$corte."' and estado_pedido_id='9' and user_id='".Auth::user()->id."'");


        $total=DB::select("select count(*) as total from v_historial_estados_pedido
                                where 
                                    historial_estado_pedido_id in
                                    (SELECT 
                                    MAX(id) AS max_id
                                FROM
                                    fuxion_logistic.historial_estados_pedidos
                                GROUP BY pedido_id) and corte_id='".$corte."'  and user_id='".Auth::user()->id."'");


        return response(["en_cola" => $en_cola[0]->en_cola, "total" => $total[0]->total ]);
    }
}
