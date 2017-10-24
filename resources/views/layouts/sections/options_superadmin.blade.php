<li class=""><a href="{{url('/corte')}}" class="{{$color}}">Cortes</a></li>
<li class=""><a href="{{url('/operador-logistico')}}" class="{{$color}}">Operadores logísticos</a></li>
<li class=""><a href="{{url('/malla-cobertura')}}" class="{{$color}}">Malla de cobertura</a></li>

<li class="dropdown">
    <a href="#" class="dropdown-toggle {{$color_items}} no-color-focus" data-toggle="dropdown" role="button" aria-expanded="false">
        Sistema
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" role="menu">
        <li class=""><a href="{{url('/modulos-funciones')}}" class="">Módulos & funciones</a></li>
        <li class=""><a href="{{url('/rol')}}" class="">Roles</a></li>
        <li class=""><a href="{{url('/usuario')}}" class="">Usuarios</a></li>
        <li class=""><a href="{{url('/bodega')}}" class="">Bodegas</a></li>
    </ul>
</li>

<li class="dropdown">
    <a href="#" class="dropdown-toggle {{$color_items}} no-color-focus" data-toggle="dropdown" role="button" aria-expanded="false">
        Más
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" role="menu">
        <li class=""><a href="{{url('/empresario/importacion-kits')}}" class="">Importación de kits</a></li>
        <li class=""><a href="{{url('/plantilla-correo')}}" class="">Plantillas de correo</a></li>
        <li class=""><a href="{{url('/estado-pedido')}}" class="">Estados de pedidos</a></li>
        <li class=""><a href="{{url('/estado-operador-logistico')}}" class="">Estados de operadores logísticos</a></li>
    </ul>
</li>


