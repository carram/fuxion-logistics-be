<?php

namespace FuxionLogistic\Models;

use Illuminate\Database\Eloquent\Model;

class Archivo extends Model
{
    protected $table = 'archivos';


    protected $fillable = [
        'nombre',
        'ubicacion',
    ];

}
