
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<h2>FUXION</h2>
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
<p>PROLIFE BIOTECH COLOMBIA SAS</p>
<p>NIT 900.413.155-8</p>
<p>{{ $pedido->direccion_factura  }}</p>
<p>COLOMBIA</p>

<p>{{ $spaces  }}</p>
<?php
$inicial =$pedido->correlativo;
$ceros="00000000";//Variable que rellena los digitos faltantes para completar los ceros a la izquierda del número de factura
$ceros=substr($ceros,0,(strlen($ceros)-strlen($inicial)));
$date = new DateTime($pedido->fecha_orden);
$week = $date->format("W-Y");
$no_factura =$pedido->serie."-".$ceros.$inicial;

?>
<h1>FACTURA DE VENTA:{{ $no_factura }}</h1>
<p>FECHA:{{ $pedido->fecha_impresion  }}</p>
<p>RESOLUCION DE FACTURACION</p>
<p>Nº {{ $pedido->resolucion  }} de {{ $pedido->fecha_resolucion  }}</p>
<p>REGIMEN COMUN Grandes Contribuyentes</p>
<p> ### Res 600076 de 01 de diciembre del 2016</p><!-- CONFIRMAR -->
<p>FACTURADO POR: {{ $pedido->nombre_impreso  }}</p>
<p>RANGO AUTORIZADO DE LA {{   $pedido->rango_desde  }} AL {{ $pedido->rango_hasta  }}</p>

<p>{{ $spaces  }}</p>

<p>TIPO EMPRESARIO:{{ $empresario[0]->tipo }}</p>
<p>CLIENTE:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos  }}</p>
<p>CC/RUNT/NIT:{{ $empresario[0]->identificacion  }}</p>
<p>PAT:{{ $empresario[0]->enroler_id  }}</p>
<p>SEMANA:{{ $week  }}</p><!-- CONFIRMAR A QUE FECHA SE CALCULA -->
<p>N PEDIDO:{{ $pedido->orden_id  }}</p>
<p>DESCUENTO: {{ $pedido->descuento }} </p>

<h2>ESTADO:{{ $pedido->razon_estado  }}</h2>
<p>{{ $spaces  }}</p>
<?php
        $descuento=0;
$productos_enviados=[];
?>
<table>
    <tr>
        <td>CANT</td>
        <td>PRODUCTO</td>
        <td>PU</td>
        <td>VALOR TOTAL</td>
    </tr>
    @foreach ($productos as $producto)
        @if($producto->codigo!=='DSCT' && $producto->pedido_id==$pedido->pedido_id)
            <?php
                //echo "select cantidad from productos_enviados pe where producto_id='".$producto->producto_id."' and guia_pedido_id='".$pedido->gp_id."' ";
                if($cambio){
                    $contador = \Illuminate\Support\Facades\DB::select("select cantidad from productos_enviados pe where producto_id='".$producto->producto_id."' and guia_pedido_id='".$pedido->gp_id."' ");
                    if(count($contador)>0){
                        $temp = [ "cantidad" => $producto->cantidad - $contador[0]->cantidad , "descripcion" => $producto->descripcion ];
                        array_push($productos_enviados,$temp);
                    }
                }
            ?>
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

<p>SUBTOTAL:{{ $pedido->subtotal  }}</p>
<p>DCTO: {{ $descuento }}  </p>
<p>IVA:{{  $pedido->total_tax }}</p>
<p>FLETE:{{ $pedido->costo_envio  }}</p>
<p>TOTAL:{{ $pedido->total  }}</p>

<p>{{ $spaces  }}</p>

<p>FORMAS DE PAGO:{{ $pedido->tipo_pago   }}</p>

<p>{{ $spaces  }}</p>

<p>HAS OBTENIDO {{ $pedido->volumen_comisionable }} PUNTOS VOLUMEN</p>

<p>{{ $spaces  }}</p>

<p>CONTACTO:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos   }}</p>
<p>DIRECCION DE ENVIO:{{ $empresario[0]->direccion  }}</p>
<p>CIUDAD:{{ $empresario[0]->ciudad  }}</p>
<p>DEPARTAMENTO:{{ $empresario[0]->departamento  }}</p>
<p>NUMERO DE TELEFONO:{{ $empresario[0]->telefono  }}</p>

<p>{{ $spaces  }}</p>

<p>¡GRACIAS POR SU COMPRA!</p>
<p>¡CON FUXION MEJORAMOS TU VIDA!</p>
<p>{{ $spaces  }}</p>
<p>{{ $spaces  }}</p>
@if(count($productos_enviados)>0)
    @include('factura.carta1')
@endif

