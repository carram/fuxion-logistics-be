@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Crear estado de pedido</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-nuevo-estado-pedido'])
            </div>
            {!! Form::open(['id'=>'form-crear-estado-pedido']) !!}
                @include('estado_pedido.form')

                <div class="col-xs-12">
                    <a class="btn btn-primary right btn-submit" id="btn-guardar-estado-pedido">Guardar</a>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/estado_pedido/crear.js')}}"></script>
@stop


