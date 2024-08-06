<?php
require_once("../../config/conexion.php");
if(isset($_SESSION["usu_id"])){
?>
<!DOCTYPE html>
<html>
    <?php require_once("../MainHead/head.php");?>
    <title>Detalle Ticket</title>
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
							<h3>Detalle Ticket</h3>
							<span id="lblestado"></span>
							<span class="label label-pill label-primary" id="lblnomusuario"></span>
							<span class="label label-pill label-default" id="lblfechcrea">99/99/9999</span>
							<ol class="breadcrumb breadcrumb-simple">
								<li><a href="../Home">Home</a></li>
								<li class="active">Detalle Ticket</li>
							</ol>
						</div>
					</div>
				</div>
			</header>


			<div class="box-typical box-typical-padding">
				<div class="row">

					<div class="col-lg-6">
						<fieldset class="form-group">
							<label class="form-label semibold" for="cat_nom">Categoria</label>
							<input type="text" class="form-control" id="cat_nomb" name="cat_nom" readonly>
						</fieldset>
					</div>

					<div class="col-lg-6">
						<fieldset class="form-group">
							<label class="form-label semibold" for="tick_titulo">Titulo</label>
							<input type="text" class="form-control" id="tick_titulo" name="tick_titulo" readonly>
						</fieldset>
					</div>

					<div class="col-lg-12">
						<fieldset class="form-group">
							<label class="form-label semibold" for="tick_titulo">Descripcion</label>
							<input type="text" class="form-control" id="tick_titulo" name="tick_titulo" readonly>
						</fieldset>
					</div>
				</div>
			</div>

            <section class="activity-line" id="lbldetalle">                   
            </section>

			<div class="box-typical box-typical-padding">



                <p>
					Respuesta
				</p>

                    <div class="row">

                            <div class="col-lg-12">
                                <fieldset class="form-group">
                                    <label class="form-label semibold" for="tickd_descrip">Descripción</label>
                                    <div class="summernote-theme-1" >
                                        <textarea id="tickd_descrip" class="summernote" name="tickd_descrip"></textarea>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <button type="submit" name="action" value="add" class="btn btn-rounded  btn-primary">Enviar</button>
                            </div>
                    
                	</div>


            </div>

		</div>
	</div>
	<!-- Contenido -->
	<?php require_once("../MainJs/js.php"); ?>
	<script type="text/javascript" src="detalleticket.js"></script>
</body>
</html>
<?php
} else {
	header("Location:"."http://localhost/TI-Tickets/"."index.php");
}
?>