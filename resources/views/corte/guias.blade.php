<?php
    $operadores_logisticos = \FuxionLogistic\Models\OperadorLogistico::all();
?>
@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Guías según malla de cobertura</p>
            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'alertas-guias'])
            </div>
            <div class="alert alert-info" role="alert">
                <p>Guías asignadas a facturas según malla de cobertura para el corte <strong>#{{$corte->numero}}</strong></p>
            </div>

            <table class="dataTable table-hover" style="border: 1px solid #ddd !important;">
                <thead>
                    <th width="50%">Operador logístico</th>
                    <th class="text-center">Cantidad de guías</th>
                    <th class="text-center">Opciones</th>
                </thead>
                <tbody>
                    @forelse($operadores_logisticos as $ol)
                        <tr>
                            <td>{{$ol->nombre}}</td>
                            <td class="text-center">{{$ol->guiasAsignadasPorCorte($corte->id,true)}}</td>
                            <td class="text-center">{!! $ol->guiasAsignadasPorCorte($corte->id,true) ? '<a href="'.url('/corte/guias-operador-logistico/'.$corte->id.'/'.$ol->id).'" class="btn btn-success">Modificar asignación</a>' : ''!!}</td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center" colspan="3">No existen operadores logísticos para asignar guías</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row margin-top-40"></div>
            {!! Form::hidden('corte',$corte->id,['id'=>'corte']) !!}
            <div class="col-md-3 no-padding">
                {!! Form::label('operador_logistico','Guías por operador logístico') !!}
                {!! Form::select('operador_logistico',[''=>'Seleccione un operador logístico']+$operadores_logisticos->pluck('nombre','id')->toArray(),null,['id'=>'operador_logistico','class'=>'form-control']) !!}
            </div>
            <div class="col-md-3 margin-top-5">
                <a href="#!" id="btn-descargar-guias-manuales" class="btn btn-primary col-xs-12 margin-top-20">Descargar archivo para OL</a>
            </div>
            <div class="col-md-3 margin-top-5">
                <a href="{{url('/corte/guias-manuales/'.$corte->id)}}" class="btn btn-primary col-xs-12 margin-top-20">Guias manuales</a>
            </div>
            <div class="col-md-3 margin-top-5">
                <a href="#!" class="btn btn-primary col-xs-12 margin-top-20">Guías automaticas</a>
            </div>
        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/corte/guias.js')}}"></script>
@endsection