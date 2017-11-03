<?php

namespace FuxionLogistic\Http\Controllers\v1;

use Illuminate\Http\Request;
use FuxionLogistic\Http\Controllers\Controller;

class AutorizacionController extends Controller
{
    //
    public function index(){

        return response([ 'data' => 'Ok'] );
    }
}
