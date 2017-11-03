<?php
 $spaces = "------------------------";
    $ddate =  $data[0]->fecha_orden ;
    $date = new DateTime($ddate);
    $week = $date->format("W-Y");
    $descuento=0;

?>

<h2>FUXION</h2>
<p>PROLIFE BIOTECH COLOMBIA SAS</p>
<p>NIT 900.413.155-8</p>
<p>CARRERA 19 No.123-86 - BOGOTA</p>
<p>COLOMBIA</p>

<p>{{ $spaces  }}</p>

<p>FACTURA DE VENTA:{{ $data[0]->prefijo_facturacion.$data[0]->serie.$data[0]->correlativo  }}</p>
<p>FECHA:{{ $data[0]->fecha_impresion  }}</p>
<p>RESOLUCION DE FACTURACION</p>
<p>Nº 18762001629294 de 21/12/2016</p>
<p>REGIMEN COMUN Grandes Contribuyentes</p>
<p> ### Res 600076 de 01 de diciembre del 2016</p><!-- CONFIRMAR -->
<p>FACTURADO POR: {{ $data[0]->impreso_por  }}</p>
<p>RANGO AUTORIZADO DE LA 36360 AL 58000</p><!-- CONFIRMAR -->

<p>{{ $spaces  }}</p>

<p>TIPO EMPRESARIO:{{ $empresario[0]->tipo }}</p>
<p>CLIENTE:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos  }}</p>
<p>CC/RUNT/NIT:{{ $empresario[0]->identificacion  }}</p>
<p>PAT:{{ $empresario[0]->enroler_id  }}</p>
<p>SEMANA:{{ $week  }}</p><!-- CONFIRMAR A QUE FECHA SE CALCULA -->
<p>N PEDIDO:{{ $data[0]->orden_id  }}</p>
<p>DESCUENTO: PREGUNTAR !!! </p><!-- NO LLEGA POR NINGUN LADO -->

<p>{{ $spaces  }}</p>

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




