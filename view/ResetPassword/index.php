<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>TIDESK - Recuperar Contraseña</title>

    <link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
    <link href="img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
    <link href="img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
    <link href="img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
    <link href="img/favicon.png" rel="icon" type="image/png">
    <link href="img/favicon.ico" rel="shortcut icon">

    <link rel="stylesheet" href="../../public/css/separate/pages/login.min.css">
    <link rel="stylesheet" href="../../public/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="../../public/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../public/css/main.css">

    <link rel="stylesheet" href="../../public/css/lib/bootstrap-sweetalert/sweetalert.css">
    <link rel="stylesheet" href="../../public/css/separate/vendor/sweet-alert-animations.min.css">

    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>

<body>
    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box reset-password-box" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="post" name="enviar">
                    <div class="" style="display: flex; align-items: center; justify-content: center;">
                        <img src="../../public/1.jpg" alt="" style="width: 40%; height: 40%;">
                    </div>
                    <header class="sign-title">Recuperar Contraseña</header>
                    <div class="form-group">
                        <input type="email" id="usu_correo" name="usu_correo" class="form-control" placeholder="E-Mail" required />
                        <input type="password" id="usu_passn1" name="usu_passn1" class="form-control" placeholder="New Pasword" required />
                        <input type="password" id="usu_passn2" name="usu_passn2" class="form-control" placeholder="New Password" required />
                        
                    </div>
                    <div class="" style="padding-left: 31px;">
                        <button type="submit" class="btn btn-rounded" name="enviar">Enviar</button> o <a href="../../index.php">Regresar</a>
                    </div>
                </form>
            </div>
        </div>
    </div><!--.page-center-->

    <script src="../../public/js/lib/jquery/jquery.min.js"></script>
    <script src="../../public/js/lib/tether/tether.min.js"></script>
    <script src="../../public/js/lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../public/js/plugins.js"></script>
    <script type="text/javascript" src="../../public/js/lib/match-height/jquery.matchHeight.min.js"></script>
    <script src="../../public/js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>
    <script>
        $(function() {
            $('.page-center').matchHeight({
                target: $('html')
            });

            $(window).resize(function() {
                setTimeout(function() {
                    $('.page-center').matchHeight({
                        remove: true
                    });
                    $('.page-center').matchHeight({
                        target: $('html')
                    });
                }, 100);
            });
        });
    </script>
    <script src="../../public/js/app.js"></script>
    <script type="text/javascript" src="resetpassword.js"></script>


    <?php
    if (isset($_POST['enviar'])) {
        //coneccion rapida con la base de datos 
        $conexion = mysqli_connect('localhost', 'bbbme11_ti', 'Gccima22.', 'bbbme11_tidesk');
        //$conexion = mysqli_connect('localhost', 'root', '', 'tidesk');

        //se resiven los datos del formulario y se almacenan en variables
        $correo = $_POST['usu_correo'];
        $npass1 = $_POST['usu_passn1'];
        $npass2 = $_POST['usu_passn2'];


        //consulta a la base de datos para consultar si existe el correo en la tabla ususarios 
        $sel = "SELECT COUNT(`usu_correo`) FROM `tm_usuario` WHERE `usu_correo`= '$correo';";
        $res = mysqli_query($conexion, $sel);
        $mos1 = mysqli_fetch_row($res);


        //primer validacion, si el numero que se resive en la parte de arriba es mayor que 0 entonces el correo existe
        if ($mos1[0] == 0) {
        
        //mensaje en caso de que el correo no exista en la tabla usuarios
            echo "<script>
        Swal.fire({
          icon: 'error',
          title: 'Oops...!',
          text: 'El correo proporcionado no existe.',  
          })
         
    </script>";
        } else {
            if ($npass1 != $npass2) {//validacion si las contrase���as coinciden en caso de no hacerlo se envia el mensaje de que no coinciden las contrasae���as 
                echo "<script>
                Swal.fire({
                  icon: 'error',
                  title: 'Oops...!',
                  text: 'Las contraseñas no coinciden.',  
                  })
                 
            </script>";
            } else {
                // Montamos la sentencia SQL
                $ssql = "update tm_usuario set usu_pass = '$npass1' WHERE usu_correo = '$correo'";


                // Ejecutamos la sentencia de actualización
                if ($conexion->query($ssql)) {

                    echo "<script>
                    Swal.fire({
                      icon: 'success',
                      title: 'Genial...!',
                      text: 'Ahora tienes una clave nueva...',  
                      })
                     
                </script>";
                } else {
                    echo "<script>
                Swal.fire({
                  icon: 'error',
                  title: 'Oops...!',
                  text: 'Hubo un error al actualizar el cliente',  
                  })
                 
            </script>";
                }
            }
        }
    }


    ?>
</body>

</html>