@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Importación manual de kits de empresarios</p>
            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-kits-empresarios'])
            </div>
            <div class="alert alert-warning" role="alert">
                <p>El archivo de Excel a importar debe contener todos los campos requeridos en el <a href="#!"><strong>formato</strong>.</a> </p>
            </div>
            {!! Form::open(['id'=>'form-kits-empresarios']) !!}
                <div class="form-group col-xs-12 col-sm-8 col-md-9">
                    <label for="archivo">Archivo (.xls, .xlsx)</label>
                    <input type="file" name="archivo" id="archivo" class="form-control">
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3 margin-top-20">
                    <a href="#!" id="btn-guardar-kits-empresarios" class="col-xs-12 btn btn-primary margin-top-5">Importar</a>
                </div>
            {!! Form::close() !!}
        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/empresario/importacion_kits.js')}}"></script>
@endsection