<?php

namespace FuxionLogistic\Http\Controllers\v1;

use FuxionLogistic\Models\Empresario;
use Illuminate\Support\Facades\DB;
use FuxionLogistic\Models\Pedido;
use FuxionLogistic\Http\Controllers\Controller;

class PedidoController extends Controller
{
    //

    public function show($guia)
    {
        $pedidos = Pedido::join("guias","guias.id","=","pedidos.guia_id")->where("guias.numero",$guia)->get();

        $empresario = Empresario::select("empresarios.*","users.*")
            ->join("pedidos","pedidos.empresario_id","=","empresarios.id")
            ->join("guias","guias.id","=","pedidos.guia_id")
            ->join("users","users.id","=","empresarios.user_id")
            ->where("guias.numero",$guia)->get();

        $productos = DB::select("select
                                        pr.*,
                                        pp.*
                                    from
                                        pedidos_productos pp
                                            inner join productos pr on pr.id=pp.producto_id
                                            inner join pedidos pe on pe.id=pp.pedido_id
                                            inner join guias g on g.id = pe.guia_id
                                            where g.numero = '".$guia."'  and pr.codigo <> 'DSCT' ");

        return response(["data" => $pedidos, "empresario" => $empresario, "productos" => $productos]);
    }
}
