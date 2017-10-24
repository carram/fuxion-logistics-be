<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Roles</div>

    <!-- List group -->
    <div class="list-group">
        @forelse($roles as $rol)
            <a class="list-group-item"> {{$rol->nombre}}
                <span class="fa fa-angle-right right btn-privilegios-rol cursor_pointer green-text font-large" data-rol="{{$rol->id}}"></span>
                @if(Auth::user()->tieneFuncion(2,2,$privilegio_superadministrador))
                    <span class="fa fa-pencil-square-o right btn-editar-rol cursor_pointer margin-right-20 blue-text" data-rol="{{$rol->id}}"></span>
                @endif
            </a>
        @empty
            <li class="list-group-item">No existen roles registrados.</li>
        @endforelse
    </div>
</div>