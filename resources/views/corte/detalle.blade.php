@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">
                Pedidos en corte #{{$corte->numero}}
                @if($corte->guias_asignadas == 'si')
                    <a href="#!" class="right text-primary font-medium margin-top-5 btn-solicitar-guias">Solicitar guías</a>
                @else
                    <a href="{{url('/corte/guias/'.$corte->id)}}" class="right text-primary font-medium margin-top-5 btn-solicitar-guias">Solicitar guías</a>
                @endif
            </p>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-pedidos-corte'])
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
                @if($corte->guias_asignadas == 'si')
                    <a href="#!" class="btn btn-primary right btn-solicitar-guias">Solicitar guías</a>
                @else
                    <a href="{{url('/corte/guias/'.$corte->id)}}" class="btn btn-primary right btn-solicitar-guias">Solicitar guías</a>
                @endif
            </div>
        </div>
        {!! Form::hidden('corte',$corte->id,['id'=>'corte']) !!}
    </div>

@endsection

@section('js')
    @parent
    <script src="{{asset('js/corte/detalle.js')}}"></script>
@stop


