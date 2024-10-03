$(document).on("click","#cambiar", function(){
    swal({
        title: "TI Desk",
        text: "¿Esta seguro de Cambiar de ventana?",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-warning",
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false
    });
});