let formChanged = false;
let intentionalSubmit = false; 

function init(){
    $("#ticket_form").on("submit",function(e){
        guardaryeditar(e);	
    });
}

$(document).ready(function() {
    $('#tick_descrip').summernote({
        height: 150,
        lang: "es-ES",
        popover: {
            image: [],
            link: [],
            air: []
        },
        callbacks: {
            onImageUpload: function(image) {
                console.log("Image detect...");
                myimagetreat(image[0]);
            },
            onPaste: function (e) {
                console.log("Text detect...");
            }
        },
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
    });

    $.post("../../controller/categoria.php?op=combo",function(data, status){
        $('#cat_id').html(data);
    });

    // Detectar cambios en inputs y select
    $('#ticket_form input, #ticket_form select').on('change', function() {
        if (!intentionalSubmit) {
            formChanged = true;
        }
    });

    // Detectar cambios en Summernote
    $('#tick_descrip').on('summernote.change', function() {
        if (!intentionalSubmit) {
            formChanged = true;
        }
    });


    // Interceptar clicks en enlaces de navegación
    $('a').not('[href="#"]').click(function(e) {
        if (formChanged && !intentionalSubmit) {
            if (!confirm('¿Está seguro que desea salir? Los cambios no guardados se perderán.')) {
                e.preventDefault();
            }
        }
    });
});

function guardaryeditar(e){
    e.preventDefault();
    var formData = new FormData($("#ticket_form")[0]);
    if ($('#tick_descrip').summernote('isEmpty') || $('#tick_titulo').val()=='' || $('#cat_id').val()==''){
        swal("Advertencia!", "Campos Vacios", "warning");
    }else{
        intentionalSubmit = true; // Indicar que es un envío intencional
        var totalfiles = $('#fileElem').val().length;
        for (var i = 0; i < totalfiles; i++) {
            formData.append("files[]", $('#fileElem')[0].files[i]);
        }
        
        $.ajax({
            url: "../../controller/ticket.php?op=insert",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(datos){
                console.log(datos);
                $('#tick_titulo').val('');
                $('#tick_descrip').summernote('reset');
                $('#fileElem').val('');
                formChanged = false;
                intentionalSubmit = false;
                swal("Correcto!", "Registrado Correctamente", "success");
                // Si necesitas recargar la página después del éxito:
                // setTimeout(function() {
                //     location.reload();
                // }, 1500);
            },
            error: function(xhr, status, error) {
                intentionalSubmit = false; // Resetear en caso de error
                swal("Error!", "No se pudo registrar el ticket", "error");
                console.error(xhr.responseText);
            }
        });
    }
}

init();