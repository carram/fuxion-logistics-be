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
}
