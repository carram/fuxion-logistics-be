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
        return $this->belongsTo(Corte::class,'importacion_id');
    }

    public function productos(){
        return $this->belongsToMany(Producto::class,'pedidos_productos','pedido_id','producto_id');
    }

    public function bodega(){
        return $this->belongsTo(Bodega::class,'bodega_id');
    }
}
