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
}
