<?php

namespace FuxionLogistic\Models;

use FuxionLogistic\User;
use Illuminate\Database\Eloquent\Model;

class Guia extends Model
{
    protected $table = 'guias';
    protected $fillable = [
        'numero',
        'estado',
        'operador_logistico_id',
        'malla_cobertura_id',
        'foto_1',
        'foto_2',
    ];

    public function pedidos(){
        return $this->belongsToMany(Pedido::class,'guias_pedidos','guia_id','pedido_id');
    }

    public function operadorLogistico(){
        return $this->belongsTo(OperadorLogistico::class,'operador_logistico_id');
    }

    public function empresario(){
        return Empresario::select('empresarios.*')
            ->join('pedidos','empresarios.id','=','pedidos.empresario_id')
            ->join('guias_pedidos','pedidos.id','=','guias_pedidos.pedido_id')
            ->join('guias','guias_pedidos.guia_id','=','guias.id')
            ->where('guias.id',$this->id)->first();
    }

    public function factura(){
        $pedidos = $this->pedidos;
        foreach ($pedidos as $pedido){
            if(count($pedidos) > 1){
                $productos = $pedido->productos;
                foreach ($productos as $producto){
                    if($producto->descripcion != 'KIT DE AFILIACION COLOMBIA'){
                        return $pedido->serie.'-'.$pedido->correlativo;
                    }
                }
            }else{
                return $pedido->serie.'-'.$pedido->correlativo;
            }
        }
    }
}
