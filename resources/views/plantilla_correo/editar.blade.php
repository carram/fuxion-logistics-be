@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Editar plantilla de correo</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-editar-plantilla-correo'])
            </div>
            {!! Form::model($plantilla_correo,['id'=>'form-editar-plantilla-correo']) !!}
                {!! Form::hidden('id',$plantilla_correo->id) !!}
                @include('plantilla_correo.form')

                <div class="col-xs-12">
                    <a class="btn btn-primary right btn-submit" id="btn-editar-plantilla-correo">Guardar</a>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js//plantilla_correo/editar.js')}}"></script>
@stop


