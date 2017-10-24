$(function () {
    //cargarTablaCortes();
})

function setCols(columns) {
    cols = columns
}

function cargarTablaCortes() {
    var tabla_cortes = $('#tabla-cortes').dataTable({ "destroy": true });
    tabla_cortes.fnDestroy();
    $.fn.dataTable.ext.errMode = 'none';
    $('#tabla-cortes').on('error.dt', function(e, settings, techNote, message) {
        console.log( 'DATATABLES ERROR: ', message);
    })

    tabla_cortes = $('#tabla-cortes').DataTable({
        lenguage: idioma_tablas,
        processing: true,
        serverSide: true,
        ajax: $("#general_url").val()+"/corte/lista",
        columns: cols,
        fnRowCallback: function (nRow, aData, iDisplayIndex) {
            $(nRow).attr('id','row_'+aData.id);
            setTimeout(function () {
            },300);
        },
    });
}