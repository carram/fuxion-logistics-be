@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Editar bodega</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-editar-bodega'])
            </div>
            {!! Form::model($bodega,['id'=>'form-editar-bodega']) !!}
                {!! Form::hidden('bodega',$bodega->id) !!}
                @include('bodega.form')

                <div class="col-xs-12">
                    <a class="btn btn-primary right btn-submit" id="btn-editar">Guardar</a>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js//bodega/editar.js')}}"></script>
@stop


