<?php

namespace FuxionLogistic\Models;

use Illuminate\Database\Eloquent\Model;
use Maatwebsite\Excel\Facades\Excel;

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

    public function ubicacion()
    {
        return $this->belongsTo(Ubicacion::class, 'ubicacion_id');
    }

    public function guias()
    {
        return $this->hasMany(Guia::class, 'operador_logistico_id');
    }

    public function guiasAsignadasPorCorte($corte, $count = false)
    {
        if ($count) {
            return $this->guias()->select('guias.*')
                ->join('guias_pedidos', 'guias.id', '=', 'guias_pedidos.guia_id')
                ->join('pedidos', 'guias_pedidos.pedido_id', '=', 'pedidos.id')
                ->join('cortes', 'pedidos.corte_id', '=', 'cortes.id')
                ->where('cortes.id', $corte)
                ->count();
        } else {
            return $this->guias()->select('guias.*')
                ->join('guias_pedidos', 'guias.id', '=', 'guias_pedidos.guia_id')
                ->join('pedidos', 'guias_pedidos.pedido_id', '=', 'pedidos.id')
                ->join('cortes', 'pedidos.corte_id', '=', 'cortes.id')
                ->where('cortes.id', $corte)
                ->get();
        }
    }

    public function excelGuias($corte)
    {
        $guias = $this->guias()->select('guias.*')
            ->join('guias_pedidos', 'guias.id', '=', 'guias_pedidos.guia_id')
            ->join('pedidos', 'guias_pedidos.pedido_id', '=', 'pedidos.id')
            ->join('cortes', 'pedidos.corte_id', '=', 'cortes.id')
            ->where('cortes.id', $corte)
            ->where('guias.estado', 'registrada')
            ->get();

        if (strtolower($this->nombre) == 'deprisa') {
            return $this->excelDeprisa($guias);
        } else if (strtolower($this->nombre) == 'servientrega') {
            return $this->excelServientrega($guias);
        }
    }

    public function excelDeprisa($guias)
    {
        $archivo = storage_path('/app/plantillas/operador_logistico/plantilla_deprisa.xlsx');

        $data = [];

        foreach ($guias as $guia) {
            $empresario = $guia->empresario();
            $user = $empresario->user;
            $factura = $guia->factura();
            $data[] = [
                $user->nombres . ' ' . $user->apellidos,
                $user->identificacion,
                0,// ?
                $empresario->direccion,
                $empresario->ciudad,
                $empresario->codigoPostal(),
                $user->telefono,
                '',// CODIGO DEL PRODUCTO?
                1,//BULTOS ?
                1,//KILOS ?
                '',//MERCANCIA ?
                '',//VALOR MERCANCIA ?
                '',//OBSERVACIONES ?
                $factura

            ];
        }

        return Excel::load($archivo, function ($file) use ($data) {
            $file->sheet('Hoja1', function ($sheet) use ($data) {
                $sheet->fromArray($data, null, 'A2', false, false);
            });
        })->download('xls');
    }

    public function excelServientrega($guias)
    {
        $archivo = storage_path('/app/plantillas/operador_logistico/plantilla_servientrega.xlsx');

        $data = [];

        foreach ($guias as $guia) {
            $empresario = $guia->empresario();
            $user = $empresario->user;
            $factura = $guia->factura();
            $data[] = [
                $user->identificacion,
                $user->nombres.' '.$user->apellidos,
                $empresario->direccion,
                $empresario->codigoPostal(),
                $empresario->ciudad,
                $empresario->departamento,
                $user->telefono,
                $user->email,
                $user->telefono,
                '',//Tiempo de Entrega; ?
                '',//Generar Sobreporte; ?
                '',//Nombre de la Unidad de Empaque; ?
                '',//Dice Contener; ?
                '',//Valor declarado;?
                '',//Número de Piezas; ?
                '', //Cantidad; ?
                '',//Remisión; ?
                '',//Alto; ?
                '',//Ancho; ?
                '',//Largo; ?
                '',//Peso; ?
                '',//Producto;?
                '',//Empaque y Embalaje; ?
                '',//Forma de Pago; ?
                '',//Medio de Transporte; ?
                '',//Generar Cajaporte; ?
                '',//Unidad de longitud; ?
                '',//Unidad de peso; ?
                $factura
            ];
        }

        return Excel::load($archivo, function ($file) use ($data) {
            $file->sheet('Hoja1', function ($sheet) use ($data) {
                $sheet->fromArray($data, null, 'A2', false, false);
            });
        })->download('xls');
    }

    public function enviarGuiasAutomaticas($corte){
        $guias_deprisa = $this->guias()->select('guias.*')
            ->join('guias_pedidos', 'guias.id', '=', 'guias_pedidos.guia_id')
            ->join('pedidos', 'guias_pedidos.pedido_id', '=', 'pedidos.id')
            ->join('cortes', 'pedidos.corte_id', '=', 'cortes.id')
            ->where('cortes.id', $corte)
            ->where('guias.estado', 'registrada')
            ->whereNull('guias.numero')
            ->get();

        if(strtolower($this->nombre) == 'deprisa'){

        }else if(strtolower($this->nombre) == 'servientrega'){

        }
    }

    //public functio
}