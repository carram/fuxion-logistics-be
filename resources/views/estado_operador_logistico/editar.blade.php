@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Editar estado de operador logístico</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-editar-estado-operador-logistico'])
            </div>
            {!! Form::model($estado_operador_logistico,['id'=>'form-editar-estado-operador-logistico']) !!}
                {!! Form::hidden('id',$estado_operador_logistico->id) !!}
                @include('estado_operador_logistico.form')

                <div class="col-xs-12">
                    <a class="btn btn-primary right btn-submit" id="btn-editar-estado-operador-logistico">Guardar</a>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/estado_operador_logistico/editar.js')}}"></script>
@stop


