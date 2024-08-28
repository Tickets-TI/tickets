var tabla;
var usu_id = $('#user_idx').val();
var rol_id = $('#rol_idx').val();


function init(){

    $("#ticket_form").on("submit",function(e){
        guardar(e);	
    });
}


$(document).ready(function(){

    $.post("../../controller/usuario.php?op=combo", function (data){
        $('#usu_asign').html(data);
    });

    if (rol_id==1) {
        tabla=$('#ticket_data').dataTable({
            "aProcessing": true,
            "aServerSide": true,
            dom: 'Bfrtip',
            "searching": true,
            lengthChange: false,
            colReorder: true,
            buttons: [
                   ],
            "ajax":{
                url : '../../controller/ticket.php?op=listar_x_usu',
                type : "post",
                dataType : "json",
                data:{ usu_id : usu_id},
                error: function(e){
                    console.log(e.responseText);
                }
            },
            "bDestroy": true,
            "responsive": true,
            "bImfo": true,
            "iDisplayLength": 10,
            "autoWidth": false,
            "language":{
                "sProcessing": "Procesando",
                "sLengthMenu": "Mostrar _MENU_ Registros",
                "sPZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando total de 0 registros",
                "sInfoFiltered": "(filtrando de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": "",
                "sLoadingRecords": "Cargando...",
                "sPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria":{
                    "sSortAscending": ": Activar para ordenar de manera ascendente",
                    "sSortDescending": ": Activar para ordenar de manera descendente"
                }
            }
    
        }).DataTable();


    } else {
        tabla=$('#ticket_data').dataTable({
            "aProcessing": true,
            "aServerSide": true,
            dom: 'Bfrtip',
            "searching": true,
            lengthChange: false,
            colReorder: true,
            buttons: [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                   ],
            "ajax":{
                url : '../../controller/ticket.php?op=listar',
                type : "post",
                dataType : "json",
                error: function(e){
                    console.log(e.responseText);
                }
            },
            "bDestroy": true,
            "responsive": true,
            "bImfo": true,
            "iDisplayLength": 10,
            "autoWidth": false,
            "language":{
                "sProcessing": "Procesando",
                "sLengthMenu": "Mostrar _MENU_ Registros",
                "sPZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando total de 0 registros",
                "sInfoFiltered": "(filtrando de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": "",
                "sLoadingRecords": "Cargando...",
                "sPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria":{
                    "sSortAscending": ": Activar para ordenar de manera ascendente",
                    "sSortDescending": ": Activar para ordenar de manera descendente"
                }
            }
    
        }).DataTable();
    }
});


function ver(tick_id){
    window.open('http://localhost/TI-Desk/view/DetalleTicket/?ID='+tick_id+'');
    //window.open('https://tidesk.grupoccima.com//view/DetalleTicket/?ID='+tick_id+'');
}
function asignar(tick_id){
    $.post("../../controller/ticket.php?op=mostrar", {tick_id : tick_id}, function (data){
        data = JSON.parse(data);
        $('#tick_id').val(data.tick_id);

        $('#mdltitulo').html('Asignar Agente');
    });
    $("#modalasignar").modal('show');
}

function guardar(e){
    e.preventDefault();
	var formData = new FormData($("#ticket_form")[0]);
    $.ajax({
        url: "../../controller/ticket.php?op=asignar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(datos){    
            
            $("#modalasignar").modal('hide');
            $("#ticket_data").DataTable().ajax.reload();
        }
    }); 
}
init();