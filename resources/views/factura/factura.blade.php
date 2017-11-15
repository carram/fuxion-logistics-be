
{!! $spaces  !!}
<h2 style="text-align: center;" >FUXION FACTURA</h2>
{!! $spaces  !!}
<p>PROLIFE BIOTECH COLOMBIA SAS</p>
<p>NIT 900.413.155-8</p>
<p>{{ $pedido->direccion_factura  }}</p>
<p>COLOMBIA</p>

{!! $spaces  !!}
<?php
$inicial =$pedido->correlativo;
$ceros="00000000";//Variable que rellena los digitos faltantes para completar los ceros a la izquierda del número de factura
$ceros=substr($ceros,0,(strlen($ceros)-strlen($inicial)));
$date = new DateTime($pedido->fecha_orden);
$week = $date->format("W-Y");
$no_factura =$pedido->serie."-".$ceros.$inicial;

?>
<p>FACTURA DE VENTA:{{ $no_factura }}</p>
<p>FECHA:{{ $pedido->fecha_impresion  }}</p>
<p>RESOLUCION DE FACTURACION</p>
<p>Nº {{ $pedido->resolucion  }} de {{ $pedido->fecha_resolucion  }}</p>
<p>REGIMEN COMUN Grandes Contribuyentes</p>
<p> ### Res 600076 de 01 de diciembre del 2016</p><!-- CONFIRMAR -->
<p>FACTURADO POR: {{ $pedido->nombre_impreso  }}</p>
<p>RANGO AUTORIZADO DE LA {{   $pedido->rango_desde  }} AL {{ $pedido->rango_hasta  }}</p>

{!! $spaces  !!}

<p>TIPO EMPRESARIO:{{ $empresario[0]->tipo }}</p>
<p>CLIENTE:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos  }}</p>
<p>CC/RUNT/NIT:{{ $empresario[0]->identificacion  }}</p>
<p>PAT:{{ $empresario[0]->enroler_id  }}</p>
<p>SEMANA:{{ $week  }}</p><!-- CONFIRMAR A QUE FECHA SE CALCULA -->
<p>N PEDIDO:{{ $pedido->orden_id  }}</p>
<p>DESCUENTO: {{ $pedido->descuento }} </p>

<!-- <h2>ESTADO:{{ $pedido->razon_estado  }}</h2> -->
{!! $spaces  !!}
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
                <td>{{ strval($producto->precio_unitario) }}</td>
                <td>{{ strval($producto->total) }}</td>

            </tr>
        @else
            <?php
            $descuento=$producto->total;
            ?>
        @endif

    @endforeach
</table>

{!! $spaces  !!}

<p>SUBTOTAL:{{ $pedido->subtotal  }}</p>
<p>DCTO: {{ $descuento }}  </p>
<p>IVA:{{  $pedido->total_tax }}</p>
<p>FLETE:{{ $pedido->costo_envio  }}</p>
<p>TOTAL:{{ $pedido->total  }}</p>

{!! $spaces  !!}

<p>FORMAS DE PAGO:{{ $pedido->tipo_pago   }}</p>

{!! $spaces  !!}

<p>HAS OBTENIDO {{ $pedido->volumen_comisionable }} PUNTOS VOLUMEN</p>

{!! $spaces  !!}

<p>CONTACTO:{{ $empresario[0]->nombres." ".$empresario[0]->apellidos   }}</p>
<p>DIRECCION DE ENVIO:{{ $empresario[0]->direccion  }}</p>
<p>CIUDAD:{{ $empresario[0]->ciudad  }}</p>
<p>DEPARTAMENTO:{{ $empresario[0]->departamento  }}</p>
<p>NUMERO DE TELEFONO:{{ $empresario[0]->telefono  }}</p>

{!! $spaces  !!}

<p style="text-align: center;" >¡GRACIAS POR SU COMPRA!</p>
<p style="text-align: center;" >¡CON FUXION MEJORAMOS TU VIDA!</p>

{!! $spaces  !!}

<br />
<br />
<br />

@if(count($productos_enviados)>0)

    @include('factura.carta1')
@endif

