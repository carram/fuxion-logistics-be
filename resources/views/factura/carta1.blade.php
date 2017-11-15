
{!! $spaces  !!}

<h2 style="text-align: center;" >FUXION CARTA 1</h2>

{!! $spaces  !!}

<p>Estimad@</p>

<p>Teniendo en cuenta la gran demanda de
    nuestros productos, en tu pedido número
    {{ $pedido->orden_id }} no fué
    posible enviar el/los siguientes productos:</p>

@foreach ($productos_enviados as $producto)
        <p><strong>PROD : </strong>{{ $producto["descripcion"]   }}</p>
       <p><strong>CANT : </strong>{{ $producto["cantidad"]  }}</p>

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

