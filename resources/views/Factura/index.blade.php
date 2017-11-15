
<?php


$spaces = "<strong>:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::</strong>";
$centrado = "::::::::::::::";
?>
        <div style="width:350px; overflow: hidden; font-family:'Arial'; "  >

@foreach ($pedidos as $pedido)

@if($cambio)
    @include('factura.factura')



@elseif($cambio==false)
    @if($pedido->razon_estado=='Pendiente por productos')
        @include('factura.carta2')

    @elseif($cambio==false && is_null($pedido->razon_estado)  && $pedido->estado_pedido_id!='11' )
        @include('factura.factura')

    @endif
@endif


@endforeach

        </div>


<?php

        ?>


