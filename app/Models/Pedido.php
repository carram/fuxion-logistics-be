<?php

namespace FuxionLogistic\Models;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $table = 'pedidos';
    protected $fillable = [
        'fecha_orden',
        'fecha_impresion',
        'serie',
        'correlativo',
        'orden_id',
        'impreso_por',
        'subtotal',
        'total_tax',
        'costo_envio',
        'descuento',
        'total',
        'tipo_pago',
        'volumen_comisionable',
        'empresario_id',
        'bodega_id',
        'corte_id',
    ];

    public function empresario(){
        return $this->belongsTo(Empresario::class,'empresario_id');
    }

    public function corte(){
        return $this->belongsTo(Corte::class,'corte_id');
    }

    public function productos(){
        return $this->belongsToMany(Producto::class,'pedidos_productos','pedido_id','producto_id');
    }

    public function bodega(){
        return $this->belongsTo(Bodega::class,'bodega_id');
    }

    public function estadosPedidos(){
        return $this->belongsToMany(EstadoPedido::class,'historial_estados_pedidos','pedido_id','estado_pedido_id');
    }

    public function guia(){
        return $this->belongsTo(Guia::class,'pedidos.guia_id');
    }
}
