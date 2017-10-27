<?php

namespace FuxionLogistic\Models;

use Illuminate\Database\Eloquent\Model;

class OperadorLogistico extends Model
{
    protected $table = "operadores_logisticos";

    protected $fillable = [
        'nombre',
        'prefijo',
        'contacto',
        'ws',
        'ubicacion_id',
    ];

    public function ubicacion(){
        return $this->belongsTo(Ubicacion::class,'ubicacion_id');
    }

    public function guias(){
        return $this->hasMany(Guia::class,'operador_logistico_id');
    }

    public function guiasAsignadasPorCorte($corte,$count = false){
        if($count){
            return $this->guias()->select('guias.*')
                ->join('pedidos','guias.id','=','pedidos.guia_id')
                ->join('cortes','pedidos.corte_id','=','cortes.id')
                ->where('cortes.id',$corte)
                ->count();
        }else{
            return $this->guias()->select('guias.*')
                ->join('pedidos','guias.id','=','pedidos.guia_id')
                ->join('cortes','pedidos.corte_id','=','cortes.id')
                ->where('cortes.id',$corte)
                ->get();
        }
    }
}
