var cols = [
    {data: 'orden_id', name: 'orden_id', "className": "text-center"},
    {data: 'fecha_orden', name: 'fecha_orden'},
    {data: 'fecha_impresion', name: 'fecha_impresion'},
    {data: 'serie', name: 'serie'},
    {data: 'correlativo', name: 'correlativo'},
    {data: 'impreso_por', name: 'impreso_por'},
    {data: 'empresario', name: 'empresario'}
];
$(function () {
    cargarTablaPedidosCorte();
})

function cargarTablaPedidosCorte() {
    var tabla_pedidos_corte = $('#tabla-pedidos-corte').dataTable({ "destroy": true });
    tabla_pedidos_corte.fnDestroy();
    $.fn.dataTable.ext.errMode = 'none';
    $('#tabla-pedidos-corte').on('error.dt', function(e, settings, techNote, message) {
        console.log( 'DATATABLES ERROR: ', message);
    })

    tabla_pedidos_corte = $('#tabla-pedidos-corte').DataTable({
        lenguage: idioma_tablas,
        processing: true,
        serverSide: true,
        ajax: $("#general_url").val()+"/corte/lista-pedidos-corte/"+$('#corte').val(),
        columns: cols,
        fnRowCallback: function (nRow, aData, iDisplayIndex) {
            $(nRow).attr('id','row_'+aData.id);
            setTimeout(function () {
            },300);
        },
    });
}