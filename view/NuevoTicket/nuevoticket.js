
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

});

function guardaryeditar(e){
    e.preventDefault();
    var formData = new FormData($("#ticket_form")[0]);
    if ($('#tick_descrip').summernote('isEmpty') || $('#tick_titulo').val()==''){
        swal("Advertencia!", "Campos Vacios", "warning");
    }else{
        var totalfiles = $('#fileElem').val().length;
        for (var i = 0; i < totalfiles; i++) {
            formData.append("files[]", $('#fileElem')[0].files[i]);
        }
        console.log(formData);
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
                swal("Correcto!", "Registrado Correctamente", "success");
            }
        });
    }
}


let formularioCompleto = false;

    // Verifica si los campos obligatorios están completados
    function verificarFormulario() {
      const titulo = document.getElementById('tick_titulo').value;
      const categoria = document.getElementById('cat_id').value;
      const documentos = document.getElementById('fileElem').value;
      const descripcion = document.getElementById('tick_descrip').value;
      // Si el campo 'nombre' o 'email' está vacío, el formulario no está completo
      if (titulo && categoria && documentos && descripcion) {
        formularioCompleto = true;
      } else {
        formularioCompleto = false;
      }
    }

    // Verifica el estado del formulario antes de que el usuario intente salir
    window.addEventListener('beforeunload', function(event) {
      verificarFormulario();
      if (!formularioCompleto) {
        // Prevenir el comportamiento por defecto del navegador
        event.preventDefault();

        // Mostrar el modal de SweetAlert2
        Swal.fire({
          title: "¿Estás seguro?",
          text: "No podrás revertir esta acción!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Sí, quiero salir",
          cancelButtonText: "Cancelar"
        }).then((result) => {
          if (result.isConfirmed) {
            // Si el usuario confirma, podemos proceder con el cambio de página o actualizar
            window.location.href = document.referrer; // O redirigir a otra página si es necesario
          }
        });
      }
    });
init();