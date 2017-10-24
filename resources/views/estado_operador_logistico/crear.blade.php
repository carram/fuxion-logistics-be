@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Crear estado de operador logístico</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-nuevo-estado-operador-logistico'])
            </div>
            {!! Form::open(['id'=>'form-crear-estado-operador-logistico']) !!}
                @include('estado_operador_logistico.form')

                <div class="col-xs-12">
                    <a class="btn btn-primary right btn-submit" id="btn-guardar-estado-operador-logistico">Guardar</a>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/estado_operador_logistico/crear.js')}}"></script>
@stop


