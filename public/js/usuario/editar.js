$(function () {
    $('#btn-guardar-usuario').click(function () {
        guardarUsuario();
    });
    $('#web,#fuxion_track,#fuxion_trax').change(function () {
        iniciosSesion($(this));
    })

    iniciosSesion();
})

function iniciosSesion(element = null) {
    //si se selecciona el inicio de session web
    //se habilita la seleccion de F. Track (empleados)
    //se deshabilita la seleccion de F. Trax (empresarios)
    if($('#web').prop('checked')){
        $('#fuxion_track').attr('disabled',false);
        $('#fuxion_trax').attr('disabled',true);
        $('#fuxion_trax').prop('checked',false);
    }else {
        $('#fuxion_track').attr('disabled',false);
        $('#fuxion_trax').attr('disabled',false);
        if(element != null){
            if($(element).attr('id') == 'fuxion_track'){
                if($('#fuxion_track').prop('checked')){
                    $('#fuxion_trax').prop('checked',false);
                }
            }
            if($(element).attr('id') == 'fuxion_trax'){
                if($('#fuxion_trax').prop('checked')){
                    $('#fuxion_track').prop('checked',false);
                }
            }
        }
    }


}

function guardarUsuario(){

    var params = new FormData(document.getElementById('form-editar-usuario'));
    var url = $("#general_url").val()+"/usuario/update";

    abrirBlockUiCargando('Guardando');
    $.ajax({
        url: url,
        data: params,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            abrirAlerta("alertas-editar-usuario","success",['Usuario editado con éxito'],null,'body');
            cerrarBlockUiCargando();
        },
        error: function (jqXHR, error, state) {
            abrirAlerta("alertas-editar-usuario","danger",JSON.parse(jqXHR.responseText),null,'body');
            cerrarBlockUiCargando();
        }
    });
}