<?php
    if(!isset($plantilla_correo))$plantilla_correo = new \FuxionLogistic\Models\PlantillaCorreo();
?>
<div class="col-md-6 col-lg-4 form-group">
    {!! Form::label('nombre','Nombre (*)') !!}
    {!! Form::text('nombre',null,['id'=>'nombre','class'=>'form-control','maxlength'=>150]) !!}
</div>
<div class="col-md-6 col-lg-4 form-group">
    {!! Form::label('asunto','Asunto (*)') !!}
    {!! Form::text('asunto',null,['id'=>'asunto','class'=>'form-control','maxlength'=>150]) !!}
</div>
<div class="col-md-6 col-lg-4 form-group">
    {!! Form::label('archivo','Archivo (*)') !!}
    {!! Form::text('archivo',null,['id'=>'archivo','class'=>'form-control','maxlength'=>250]) !!}
</div>