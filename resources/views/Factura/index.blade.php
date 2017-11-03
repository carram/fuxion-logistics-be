<?php
 $spaces = "--------------------------------------";









?>
@foreach ($datas as $data)

<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<h2>FUXION</h2>
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<p>PROLIFE BIOTECH COLOMBIA SAS</p>
<p>NIT 900.413.155-8</p>
<p>{{ $data->direccion_factura  }}</p>
<p>COLOMBIA</p>

<p>{{ $spaces  }}</p>
<?php
    $inicial =$data->correlativo;
    $ceros="00000000";//Variable que rellena los digitos faltantes para completar los ceros a la izquierda del número de factura

    $ceros=substr($ceros,0,(strlen($ceros)-strlen($inicial)));
    $date = new DateTime($data->fecha_orden);
    $week = $date->format("W-Y");
    $no_factura =$data->serie."-".$ceros.$inicial;


?>

<p>FACTURA DE VENTA:{{ $no_factura }}</p>
<p>FECHA:{{ $data->fecha_impresion  }}</p>
<p>RESOLUCION DE FACTURACION</p>
<p>Nº {{ $data->resolucion  }} de {{ $data->fecha_resolucion  }}</p>
<p>REGIMEN COMUN Grandes Contribuyentes</p>
<p> ### Res 600076 de 01 de diciembre del 2016</p><!-- CONFIRMAR -->
<p>FACTURADO POR: {{ $data->nombre_impreso  }}</p>
<p>RANGO AUTORIZADO DE LA {{   $data->rango_desde  }} AL {{ $data->rango_hasta  }}</p><!-- CONFIRMAR -->

<p>{{ $spaces  }}</p>

<p>TIPO EMPRESARIO:{{ $empresario[0]->tipo }}</p>
<p>CLIENTE:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos  }}</p>
<p>CC/RUNT/NIT:{{ $empresario[0]->identificacion  }}</p>
<p>PAT:{{ $empresario[0]->enroler_id  }}</p>
<p>SEMANA:{{ $week  }}</p><!-- CONFIRMAR A QUE FECHA SE CALCULA -->
<p>N PEDIDO:{{ $data->orden_id  }}</p>
<p>DESCUENTO: {{ $data->descuento }} </p><!-- NO LLEGA POR NINGUN LADO -->

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

<p>SUBTOTAL:{{ $data->subtotal  }}</p>
<p>DCTO: {{ $descuento }}  </p>
<p>IVA:{{  $data->total_tax }}</p>
<p>FLETE:{{ $data->costo_envio  }}</p>
<p>TOTAL:{{ $data->total  }}</p>

<p>{{ $spaces  }}</p>

<p>FORMAS DE PAGO:{{ $data->tipo_pago   }}</p>

<p>{{ $spaces  }}</p>

<p>HAS OBTENIDO {{ $data->volumen_comisionable }} PUNTOS VOLUMEN</p>

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

@endforeach

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
    ___________ no fué
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




