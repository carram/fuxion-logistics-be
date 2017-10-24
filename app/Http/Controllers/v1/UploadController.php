<?php

namespace App\Http\Controllers\v1;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Mockery\CountValidator\Exception;


class UploadController extends Controller
{

   // public function  __construct(){
    //    $this->middleware('auth.basic');
//}

    public function index(){
        //Metodo GET sin nada mas en la URL, traer todos los registros
        
        return response(["data" => "En el index"]);
    }
    public function  show($id){
        //Metodo get y con el id en la url luego de modulos/[$id]
        
            return response(["No existe"=>false],500);
        
    }

    public function store(Request $r){

        if($r->file('picture')){
           // $r->file('picture')->store('subidas/movil');
            //Storage::putFile('subidas/movil', $r->file('picture'));
            $r->file('picture')->storeAs('subidas/movil', "foto_". $r->input("orden") .".jpg");
        }
        return response(["data" => $r->all()]);
    }

   
}
