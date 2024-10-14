<?php
require_once("../../config/conexion.php");
if(isset($_SESSION["usu_id"])){
?>
<!DOCTYPE html>
<html>
    <?php require_once("../MainHead/head.php");?>
    <title>Nuevo Ticket</title>

 <head> 
    
 <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  
</head>
<body class="with-side-menu">

    <?php require_once("../MainHeader/header.php");?>

	<div class="mobile-menu-left-overlay"></div>
	
    <?php require_once("../MainNav/nav.php");?>

	<!-- Contenido -->
	<div class="page-content">
		<div class="container-fluid">

            <header class="section-header">
				<div class="tbl">
					<div class="tbl-row">
						<div class="tbl-cell">
							<h3>Nuevo Ticket</h3>
							<ol class="breadcrumb breadcrumb-simple">
                                <?php
                                    if($_SESSION["rol_id"]==1){
                                ?>
								<li><a href="#">Inicio</a></li>
                                <li class="active">Nuevo Ticket</li>
                                <?php
                                    } else {
                                 ?>
								<li><a href="./../Home/">Inicio</a></li>
								<li class="active">Nuevo Ticket</li>
                                <?php
                                    }
                                ?>
							</ol>
						</div>
					</div>
				</div>
			</header>

            <div class="box-typical box-typical-padding">



                <h5 class="m-t-lg with-border">Ingresar Información</h5>

                    <div class="row">
                        <form method="post" id="ticket_form">


                            
                            <input type="hidden" id="usu_id" name="usu_id" value="<?php echo $_SESSION["usu_id"] ?>">

                            <div class="col-lg-12">
                                <fieldset class="form-group">
                                    <label class="form-label semibold" for="tick_titulo">Titulo</label>
                                    <input type="text" class="form-control" id="tick_titulo" name="tick_titulo" placeholder="Ingrese Titulo">
                                </fieldset>
                            </div>
                            <div class="col-lg-6">
                                <fieldset class="form-group">
                                    <label class="form-label semibold" for="exampleInput">Categoria</label>
                                    <select id="cat_id" name="cat_id"  class="form-control">
                                        
                                    </select>
                                </fieldset>
                            </div>

                            <div class="col-lg-6">
                                <fieldset class="form-group">
                                <label class="form-label semibold" for="exampleInput">Documentos</label>
                                <input type="file" name="fileElem" id="fileElem" class="form-control" multiple>
                                </fieldset>
                            </div>
                            
                            <div class="col-lg-12">
                                <fieldset class="form-group">
                                    <label class="form-label semibold" for="tick_descrip">Descripción</label>
                                    <div class="summernote-theme-1" >
                                        <textarea id="tick_descrip" class="summernote" name="tick_descrip"></textarea>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <button type="submit" name="action" value="add" class="btn btn-rounded btn__primary">Guardar</button>
                            </div>
                        </form>
                    
                </div>


            </div>
		</div>
	</div>
	<!-- Contenido -->
	<?php require_once("../MainJs/js.php"); ?>
	<script type="text/javascript" src="nuevoticket.js"></script>
</body>
</html>
<?php
} else {
	header("Location:"."http://localhost/TI-Desk/"."index.php");
    //header("Location:"."https://tidesk.grupoccima.com/"."index.php");
}
?>