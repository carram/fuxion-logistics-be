<?php

namespace FuxionLogistic\Console\Commands;

use FuxionLogistic\Mail\PlantillaCorreo;
use FuxionLogistic\Models\Correo;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class EnviarCorreos extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:enviar-correos';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Envío de correos almacenados en la base de datos';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $correos = Correo::where('estado','pendiente')->get();
        foreach ($correos as $correo){
            echo 'Enviando...';
            $remitentes = $correo->usuarios;
            Mail::to($remitentes)->send(new PlantillaCorreo($correo));
            $correo->estado = 'enviado';
            $correo->save();
        }
    }
}
