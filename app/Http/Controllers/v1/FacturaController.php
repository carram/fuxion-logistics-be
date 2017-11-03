<?php

namespace FuxionLogistic\Http\Controllers\v1;

use Illuminate\Http\Request;
use FuxionLogistic\Models\Pedido;
use Illuminate\Support\Facades\DB;
use FuxionLogistic\Models\Empresario;
use FuxionLogistic\Http\Controllers\Controller;

class FacturaController extends Controller
{
    //
    public function  show($guia){

        $pedidos = Pedido::select("pedidos.*","usuarios_exigo.nombre_impreso", "usuarios_exigo.rango_desde", "usuarios_exigo.rango_hasta","usuarios_exigo.resolucion","usuarios_exigo.fecha_resolucion","usuarios_exigo.direccion_factura" )
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("usuarios_exigo","pedidos.serie","=","usuarios_exigo.serie")
            ->where("guias.numero",$guia)->get();

        $empresario = Empresario::select("empresarios.*","users.*")
            ->join("pedidos","pedidos.empresario_id","=","empresarios.id")
            ->join("guias_pedidos","pedidos.id","=","guias_pedidos.pedido_id")
            ->join("guias","guias_pedidos.guia_id","=","guias.id")
            ->join("users","users.id","=","empresarios.user_id")
            ->where("guias.numero",$guia)->get();

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
                                            where g.numero = '".$guia."'");
        
        return view('factura.index', [ 'pedidos' => $pedidos, 'empresario' => $empresario , 'productos' => $productos ]);
       // return response(["data" => $data, "empresario" => $empresario, "productos" => $productos]);
    }
}
