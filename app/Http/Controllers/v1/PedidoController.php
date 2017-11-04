<?php

namespace FuxionLogistic\Http\Controllers\v1;

use FuxionLogistic\Models\Corte;
use FuxionLogistic\Models\Empresario;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use FuxionLogistic\Models\Pedido;
use FuxionLogistic\Http\Controllers\Controller;

class PedidoController extends Controller
{
    //

    public function getPedido($barcode,$corte_id)
    {

        $pedidos = Pedido::select("pedidos.*","guias.*", "guias_pedidos.id as guia_pedido_id","pedidos.id as pedido_id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("cortes","pedidos.corte_id","=","cortes.id")
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
                                        pr.id as producto_id
                                    from
                                        pedidos_productos pp
                                            inner join productos pr on pr.id=pp.producto_id
                                            inner join pedidos pe on pe.id=pp.pedido_id
                                            inner join guias_pedidos gp on gp.pedido_id = pe.id
                                            inner join guias g on g.id = gp.guia_id
                                            where g.numero = '".$barcode."'  and pr.codigo <> 'DSCT' ");


        $estado= DB::select("SELECT
                                razon_estado
                                    FROM
                                v_historial_estados_pedido hep
                            WHERE
                                hep.historial_estado_pedido_id = (SELECT 
                                        MAX(id) AS max_id
                                    FROM
                                        historial_estados_pedidos he
                                    WHERE
                                        pedido_id = '". $pedidos[0]->pedido_id."')");

        return response(["data" => $pedidos, "empresario" => $empresario, "productos" => $productos, "estado" => $estado[0]->razon_estado ]);
    }


    public function getDevolucion($barcode)
    {

        $pedidos = Pedido::select("pedidos.*","guias.*", "guias_pedidos.id as guia_pedido_id")
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
                                GROUP BY pedido_id) and corte_id='".$corte."' and user_id='".Auth::user()->id."'");


        return response(["en_cola" => $en_cola[0]->en_cola, "total" => $total[0]->total ]);
    }
}
