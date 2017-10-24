<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Funciones
        @if($modulo)
            - {{$modulo->nombre}} <span class="fa fa-times-circle margin-left-10 cursor_pointer cerrar-funciones"></span>
        @endif
    </div>

    <!-- List group -->
    <ul class="list-group">
        @forelse($funciones as $funcion)
            <li class="list-group-item">
                @if($modulo)
                    <?php $disabled = ''; ?>
                    @if(!Auth::user()->tieneFuncion(1,2,$privilegio_superadministrador))
                        <?php $disabled = 'disabled' ?>
                    @endif

                    @if($modulo->tieneFuncion($funcion->id))
                        <div class="no-margin">
                            <label>
                                <input type="checkbox" class="check-funcion" {{$disabled}} checked data-funcion="{{$funcion->id}}"> {{$funcion->nombre.' ('.$funcion->identificador.')'}}
                            </label>
                        </div>
                    @else
                        <div class="no-margin">
                            <label>
                                <input type="checkbox" class="check-funcion" {{$disabled}} data-funcion="{{$funcion->id}}"> {{$funcion->nombre.' ('.$funcion->identificador.')'}}
                            </label>
                        </div>
                    @endif
                @else
                    {{$funcion->nombre}}
                    <span class="badge white-text left margin-right-10 blue darken-2">{{$funcion->identificador}}</span>
                    @if(Auth::user()->tieneFuncion(1,2,$privilegio_superadministrador))
                        <span class="fa fa-pencil-square-o right btn-editar-funciones-modulo cursor_pointer blue-text" data-funcion="{{$funcion->id}}"></span>
                    @endif
                @endif
            </li>
        @empty
            <li class="list-group-item">No existen funciones registradas.</li>
        @endforelse
    </ul>
</div>