@component('mail::message')
# {{$titulo}}

{!! $mensaje !!}

@if($boton)
    @component('mail::button', ['url' => $url_boton])
        {!! $texto_boton !!}
    @endcomponent
@endif

@endcomponent
