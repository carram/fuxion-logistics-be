@extends('layouts.app')

@section('content')
    <div class="container white padding-50">
        <div class="row">
            <p class="titulo_principal margin-bottom-20">Cortes</p>

            <div class="contenedor-opciones-vista">
                @if(Auth::user()->tieneFuncion(4,5, $privilegio_superadministrador))
                    <a href="{{url('corte/importar')}}" type="button" class="btn btn-primary btn-circle"><i class="fa fa-upload"></i></a>
                @endif
            </div>

            <div class="col-xs-12">
                @include('layouts.alertas',['id_contenedor'=>'corte'])
            </div>

            <table id="tabla-cortes" class="table-hover">
                <thead>
                    <th>No. orden</th>
                    <th>Estado</th>
                    <th>No. corte</th>
                    <th>Fecha corte</th>
                    <th>Fecha orden</th>
                    <th>Serie</th>
                    <th>Código producto</th>
                    <th>Cantidad</th>
                    <th>Precio unitario</th>
                    <th>Descuento</th>
                    <th>Total</th>
                    <th>Total tax (pedido)</th>
                    <th>Costo envio (pedido)</th>
                    <th>Total (pedido)</th>
                    <th>Bodega</th>
                    <th>Cliente</th>
                </thead>
            </table>
        </div>
    </div>

    <div id="modal-eliimnar-pedido" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mySmallModalLabel">Eliminar</h4>
                </div>
                <div class="modal-body">
                    <p>¿Está seguro de eliminar este pedido?</p>
                    <div class="row text-right">
                        <div class="col-xs-12">
                            <a class="btn btn-sm btn-primary" data-dismiss="modal">No</a>
                            <a class="btn btn-sm btn-danger" id="btn-action-eliminar-pedido">Si</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('js')
    @parent
    <script src="{{asset('js/corte/index.js')}}"></script>
@stop


