<?php
$spaces = "--------------------------------------";







?>
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<h2>FUXION</h2>
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<p>PROLIFE BIOTECH COLOMBIA SAS</p>
<p>NIT 900.413.155-8</p>
<p>{{ $data[0]->direccion_factura  }}</p>
<p>COLOMBIA</p>

<p>{{ $spaces  }}</p>
<?php

$inicial =$data[0]->correlativo;

$ceros="00000000";//Variable que rellena los digitos faltantes para completar los ceros a la izquierda del número de factura

$ceros=substr($ceros,0,(strlen($ceros)-strlen($inicial)));

$date = new DateTime($data[0]->fecha_orden);
$week = $date->format("W-Y");
$no_factura =$data[0]->serie."-".$ceros.$inicial;

?>
<p>FACTURA DE VENTA:{{ $no_factura }}</p>
<p>FECHA:{{ $data[0]->fecha_impresion  }}</p>
<p>RESOLUCION DE FACTURACION</p>
<p>Nº {{ $data[0]->resolucion  }} de {{ $data[0]->fecha_resolucion  }}</p>
<p>REGIMEN COMUN Grandes Contribuyentes</p>
<p> ### Res 600076 de 01 de diciembre del 2016</p><!-- CONFIRMAR -->
<p>FACTURADO POR: {{ $data[0]->nombre_impreso  }}</p>
<p>RANGO AUTORIZADO DE LA {{   $data[0]->rango_desde  }} AL {{ $data[0]->rango_hasta  }}</p><!-- CONFIRMAR -->

<p>{{ $spaces  }}</p>

<p>TIPO EMPRESARIO:{{ $empresario[0]->tipo }}</p>
<p>CLIENTE:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos  }}</p>
<p>CC/RUNT/NIT:{{ $empresario[0]->identificacion  }}</p>
<p>PAT:{{ $empresario[0]->enroler_id  }}</p>
<p>SEMANA:{{ $week  }}</p><!-- CONFIRMAR A QUE FECHA SE CALCULA -->
<p>N PEDIDO:{{ $data[0]->orden_id  }}</p>
<p>DESCUENTO: {{ $data[0]->descuento }} </p><!-- NO LLEGA POR NINGUN LADO -->

<p>{{ $spaces  }}</p>
<?php
$descuento=0;
?>
<table>
    <tr>
        <td>CANT</td>
        <td>PRODUCTO</td>
        <td>PU</td>
        <td>VALOR TOTAL</td>
    </tr>
    @foreach ($productos as $producto)
        @if($producto->codigo!=='DSCT')
            <tr>
                <td>{{ $producto->cantidad  }}</td>
                <td>{{ $producto->descripcion }}</td>
                <td>{{ $producto->precio_unitario }}</td>
                <td>{{ $producto->total }}</td>

            </tr>
        @else
            <?php
            $descuento=$producto->total;
            ?>
        @endif

    @endforeach
</table>

<p>{{ $spaces  }}</p>

<p>SUBTOTAL:{{ $data[0]->subtotal  }}</p>
<p>DCTO: {{ $descuento }}  </p>
<p>IVA:{{  $data[0]->total_tax }}</p>
<p>FLETE:{{ $data[0]->costo_envio  }}</p>
<p>TOTAL:{{ $data[0]->total  }}</p>

<p>{{ $spaces  }}</p>

<p>FORMAS DE PAGO:{{ $data[0]->tipo_pago   }}</p>

<p>{{ $spaces  }}</p>

<p>HAS OBTENIDO {{ $data[0]->volumen_comisionable }} PUNTOS VOLUMEN</p>

<p>{{ $spaces  }}</p>
<!-- LOS DATOS DEL PED - PEDIDO NO LLEGAN A LAS TABLAS AUN -->
<p>CONTACTO:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos   }}</p>
<p>DIRECCION DE ENVIO:{{ $empresario[0]->direccion  }}</p>
<p>CIUDAD:{{ $empresario[0]->ciudad  }}</p>
<p>DEPARTAMENTO:{{ $empresario[0]->departamento  }}</p>
<p>NUMERO DE TELEFONO:{{ $empresario[0]->telefono  }}</p>

<p>{{ $spaces  }}</p>

<p>¡GRACIAS POR SU COMPRA!</p>
<p>¡CON FUXION MEJORAMOS TU VIDA!</p>



<?php

$spaces = ":::::::::::::::::::::::::::::::::::";
$centrado = "::::::::::::";

?>

<p>{{ $spaces  }}</p>

<h2>FUXION</h2>
<p>{{ $spaces  }}</p>

<p>Estimad@</p>

<p>Teniendo en cuenta la gran demanda de
    nuestros productos, en tu pedido número
    {{ $data[0]->orden_id  }} no fué
    posible enviar el/los siguientes productos:</p>

@foreach ($productos as $producto)
    @if($producto->codigo!=='DSCT')
        <p>PRODUCTO:{{ $producto->descripcion  }}</p>
        <p>CANTIDAD:{{ $producto->cantidad }}</p>
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
<p>{{ $centrado }}<strong>Mejoramos tu vida</strong>{{ $centrado  }}</p>




