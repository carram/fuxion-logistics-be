@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Editar operador logìstico</p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-editar-operador-logistico'])
            </div>
            {!! Form::model($operador_logistico,['id'=>'form-editar-operador-logistico']) !!}
                {!! Form::hidden('id',$operador_logistico->id,['id'=>'id']) !!}
                @include('operador_logistico.form')

                <div class="col-xs-12 no-padding">
                    <div class="col-xs-12 margin-top-40">
                        <a href="#!" class="cursor_pointer btn-submit btn btn-primary right" id="btn-actualizar-operador-logistico">Guardar</a>
                    </div>
                </div>
            {!! Form::close() !!}

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/operador_logistico/editar.js')}}"></script>
@stop