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

            <table class="dataTable table-hover">
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
                            <td class="text-center">{!! $ol->guiasAsignadasPorCorte($corte->id,true) ? '<a href="'.url('/corte/guias-operador-logistico/'.$corte->id.'/'.$ol->id).'" class="btn btn-primary">Modificar asignación</a>' : ''!!}</td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center" colspan="3">No existen operadores logísticos para asignar guías</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>

        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/corte/importar.js')}}"></script>
@endsection