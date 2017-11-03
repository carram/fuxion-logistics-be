<?php

namespace FuxionLogistic\Models;

use FuxionLogistic\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Correo extends Model
{
    protected $table = 'correos';
    protected $fillable = [
        'tipo',
        'fecha_programada',
        'estado',
        'titulo',
        'mensaje',
        'boton',
        'texto_boton',
        'url_boton',
        'plantilla_correo_id',
    ];

    public function usuarios()
    {
        return $this->belongsToMany(User::class, 'users_correos', 'correo_id', 'user_id');
    }

    public function plantillaCorreo()
    {
        return $this->belongsTo(PlantillaCorreo::class, 'plantilla_correo_id');
    }

    /**
     * Valida y registra la información de un correo en la db
     *
     * @param $tipo => tipo de correo 'programado', 'prioritario'
     * @param null $fecha_programada => Fecha de envio si el tipo es programado
     * @param string $titulo => texto
     * @param string $mensaje => html
     * @param bool $boton => si el correo debe tener un botón
     * @param string $texto_boton
     * @param string $url_boton
     * @param $plantilla_correo_id => campo id de la tabla planillas_correos
     * @param array $remitentes => array con ids de remitentes del correo
     * @return array => ['success'=>true] -> correo registrado con éxito ******* ['success'=>false,'error'=>''] -> correo con errores y detalle del error
     */
    private static function crear($tipo, $fecha_programada = null, $titulo = '', $mensaje = '', $boton = false, $texto_boton = '', $url_boton = '',PlantillaCorreo $plantilla_correo, Collection $remitentes)
    {
        $correo = new Correo();
        //validacion de tipo de correo
        if ($tipo != 'programado' && $tipo != 'prioritario') {
            return [
                'success' => false,
                'error' => 'El tipo de correo debe estar entre los valores (programado o prioritario)'
            ];
        }
        $correo->tipo = $tipo;

        //validacion de fecha
        if ($tipo == 'programado') {
            if ($fecha_programada == null) {
                return [
                    'success' => false,
                    'error' => 'La fecha de envio programado es obligatoria cuando el tipo de correo es "programado"'
                ];
            }
            $hoy = strtotime(date('Y-m-d'));
            $fecha_programada_time = strtotime(date('Y-m-d'), $fecha_programada);
            if ($hoy > $fecha_programada_time) {
                return [
                    'success' => false,
                    'error' => 'La fecha de envío programado no debe ser menor a la fecha actual'
                ];
            }

            $correo->fecha_programada = $fecha_programada;
        }

        //mensaje obligatotio
        if ($mensaje == '') {
            return [
                'success' => false,
                'error' => 'El mensaje del correo es obligatorio'
            ];
        }

        $correo->mensaje = $mensaje;

        if($titulo != null)
            $correo->titulo = $titulo;

        //plantilla de correo creada en db
        if (!$plantilla_correo->exists) {
            return [
                'success' => false,
                'error' => 'La plantilla de correo no existe'
            ];
        }

        $correo->plantilla_correo_id = $plantilla_correo->id;

        if($boton){
            $correo->boton = 'si';
            $correo->texto_boton = $texto_boton;
            $correo->url_boton = $url_boton;
        }

        //validacion de remitentes
        if (!count($remitentes)) {
            return [
                'success' => false,
                'error' => 'La información de los remitentes es obligatoria'
            ];
        }


        DB::beginTransaction();
        $correo->save();
        foreach ($remitentes as $remitente) {
            if (!$remitente->exists) {
                return [
                    'success' => false,
                    'error' => 'La información de los remitentes es incorrecta'
                ];
            }else{
                $correo->usuarios()->save($remitente);
            }
        }
        DB::commit();
        return ['success'=>true];
    }

    public static function pedidoEnCola(Empresario $empresario,Pedido $pedido){
        $plantilla_correo = PlantillaCorreo::where('nombre','Pedido en cola')->first();
        if(!$plantilla_correo){
            return [
                'success'=>false,
                'error'=>'No se ha encontrado ningúna plantilla con el nombre "Pedido en cola"'
            ];
        }

        $usuario = $empresario->user;
        if(!$usuario->email){
            return [
                'success'=>false,
                'error'=>'El empresario no tiene una cuenta de correo registrada'
            ];
        }

        $tipo = 'prioritario';
        $titulo = 'Estimad@ '.$usuario->nombres.' '.$usuario->apellidos;

        $mensaje = 'Fuxión le informa que su pedido con número de factura <strong>'.$pedido->serie.''.$pedido->correlativo.'</strong>'
            .'ha cambiadao su estado a "pedido en cola".';

        return self::crear($tipo,null,$titulo,$mensaje,false,'','',$plantilla_correo, new Collection([$usuario]));
    }
}