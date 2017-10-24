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
        'plantilla_correo_id',
    ];
}
