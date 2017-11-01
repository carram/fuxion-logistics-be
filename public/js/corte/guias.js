$(function () {
    $('#btn-descargar-guias-manuales').click(function () {
        if($('#operador_logistico').val()){
            if($('#corte').val()){
                window.location.href = $('#general_url').val()+'/corte/descarga-guias/'+$('#corte').val()+'/'+$('#operador_logistico').val();
            }else{
                window.location.reload(true);
            }
        }else{
            abrirAlerta('alertas-guias','danger',['Seleccione un operador logístico'],null,'body');
        }
    })
})