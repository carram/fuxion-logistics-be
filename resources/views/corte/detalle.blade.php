@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">
                Pedidos en corte #{{$corte->numero}}
                <a href="{{url('/corte/solicitar-guias/'.$corte->id)}}" class="right text-primary font-medium margin-top-5">Solicitar guías</a>
            </p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'pedidos-corte'])
            </div>

            <table id="tabla-pedidos-corte" class="table-hover">
                <thead>
                    <th>No. orden</th>
                    <th>Fecha de orden</th>
                    <th>Fecha de impresion</th>
                    <th>Serie</th>
                    <th>Correlativo</th>
                    <th>Impreso por</th>
                    <th>Empresario</th>
                </thead>
            </table>
            <div class="col-xs-12 margin-top-20">
                <a href="{{url('/corte/solicitar-guias/'.$corte->id)}}" class="btn btn-primary right">Solicitar guías</a>
            </div>
        </div>
        {!! Form::hidden('corte',$corte->id,['id'=>'corte']) !!}
    </div>

@endsection

@section('js')
    @parent
    <script src="{{asset('js/corte/detalle.js')}}"></script>
@stop


