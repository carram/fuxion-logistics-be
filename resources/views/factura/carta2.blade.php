
<?php

$spaces = ":::::::::::::::::::::::::::::::::::";
$centrado = ":::::::";

?>

<h3>{{ $spaces  }}</h3>

<h2>FUXION CARTA 2</h2>
<h3>{{ $spaces  }}</h3>

<p>Estimad@</p>

<p>Teniendo en cuenta la gran demanda de
    nuestros productos, en tu pedido número
    {{ $pedido->serie."-".$pedido->correlativo  }} no fué
    posible enviar el/los siguientes productos:</p>

@foreach ($productos as $producto)
    @if($producto->codigo!=='DSCT' && $producto->pedido_id==$pedido->pedido_id)
        <?php


            $contador = \Illuminate\Support\Facades\DB::select("select cantidad from productos_enviados pe where producto_id='".$producto->producto_id."' and guia_pedido_id='".$pedido->gp_id."' ");
            if(count($contador)>0){
                //echo "select cantidad from productos_enviados pe where producto_id='".$producto->producto_id."' and guia_pedido_id='".$pedido->gp_id."' ";
                ?>
                <p><strong>PROD:</strong>{{ $producto->descripcion }}</p>
                <p><strong>CANT:</strong>{{ $producto->cantidad - $contador[0]->cantidad  }}</p>
        <?php
            }

        ?>






    @endif

@endforeach

<p>PROLIFE BIOTECH COLOMBIA S.A.S.,
    ofrece mil disculpas por los inconvenientes
    causados. Los productos relacionados serán
    enviados en los próximos días sin cargos
    adicionales, por lo cual recibirás un mensaje
    vía email a la dirección registrada indicándote
    los datos del nuevo envío.</p>
<p>Gracias por tu comprensión.</p>
<p>Prolife Biotech Colombias S.A.S
    FuXion</p>
<h3>{{ $centrado }}<strong>Mejoramos tu vida</strong>{{ $centrado  }}</h3>

