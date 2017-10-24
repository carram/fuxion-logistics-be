@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Editar malla de cobertura</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-editar-malla-cobertura'])
            </div>
            {!! Form::model($malla_cobertura,['id'=>'form-editar-malla-cobertura']) !!}
                {!! Form::hidden('id',$malla_cobertura->id,['id'=>'id']) !!}
                @include('malla_cobertura.form')

                <div class="col-xs-12 no-padding">
                    <div class="col-xs-12 margin-top-40">
                        <a href="#!" class="cursor_pointer btn-submit btn btn-primary right" id="btn-actualizar-malla-cobertura">Guardar</a>
                    </div>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/malla_cobertura/editar.js')}}"></script>
@stop