<?php

namespace FuxionLogistic\Models;

use FuxionLogistic\User;
use Illuminate\Database\Eloquent\Model;

class Guia extends Model
{
    protected $table = 'guias';
    protected $fillable = [
        'numero',
        'operador_logistico_id',
    ];

    public function pedidos(){
        return $this->hasMany(Pedido::class,'corte_id');
    }

    public function operadorLogistico(){
        return $this->belongsTo(OperadorLogistico::class,'operador_logistico_id');
    }
}
