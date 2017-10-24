<?php

namespace FuxionLogistic\Models;

use FuxionLogistic\User;
use Illuminate\Database\Eloquent\Model;

class Corte extends Model
{
    protected $table = 'cortes';
    protected $fillable = [
        'user_id',
        'numero',
        'estado'
    ];

    public function pedidos(){
        return $this->hasMany(Pedido::class,'corte_id');
    }

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public static function ultimoNumeroCorte(){
        $ultimo_corte = Corte::orderBy('numero','DESC')->first();
        if($ultimo_corte)return $ultimo_corte->numero;
        return 0;
    }
}
