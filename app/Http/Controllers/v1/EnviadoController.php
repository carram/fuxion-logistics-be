<?php

namespace FuxionLogistic\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use FuxionLogistic\Http\Controllers\Controller;

class EnviadoController extends Controller
{
    //
    public function store(Request $request){

        $productos = json_decode($request->input("productos"));
        $guia_pedido_id = $request->input("guia_pedido_id");

        //dd($productos);

        $sql="insert into productos_enviados (cantidad, producto_id, guia_pedido_id) values ";
        foreach($productos as $producto)
             $sql.="('".$producto->envio."','".$producto->producto_id."','".$guia_pedido_id."'),";

        $sql=substr($sql,0,-1);

        DB::statement($sql);

        return response(["productos" => $productos, "sql"=>$sql, "guia_pedido_id" => $guia_pedido_id] );
    }
}
