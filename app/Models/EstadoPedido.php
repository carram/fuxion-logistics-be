<?php

namespace FuxionLogistic\Models;

use FuxionLogistic\User;
use Illuminate\Database\Eloquent\Model;

class EstadoPedido extends Model
{
    protected $table = 'estados_pedidos';
    protected $fillable = [
        'nombre',
        'descripcion',
        'notificacion_push',
        'notificacion_correo',
        'defecto_no_kit',
        'defecto_no_corte',
        'plantilla_correo_id',
    ];
}
