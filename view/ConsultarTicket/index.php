<?php
require_once("../../config/conexion.php");
if(isset($_SESSION["usu_id"])){
?>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<?php require_once("../MainHead/head.php");?>
    <title>Consultar Ticket</title>
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
							<h3>Consultar Ticket</h3>
							<ol class="breadcrumb breadcrumb-simple">
								<li><a href="../Home">Home</a></li>
								<li class="active">Consultar Ticket</li>
							</ol>
						</div>
					</div>
				</div>
			</header>



			<script type="text/javascript">
				$(document).ready(function(){
					$('#btnLlamar').on("click", function(){
						$("#miModal").modal();
					});



				});
			</script>



			<!-- <input type="button" id="btnLlamar" value="Agregar ticket" class="btn btn-primary"> -->


			<!-- Inicio Modal -->
			<form method="post" id="ticket_form">

				<div id="miModal" class="modal fade show" role="dialog" aria-hideen="true">
					<div class="modal-dialog modal-lg">

					<div class="modal-content">
							<input type="hidden" id="usu_id" name="usu_id" value="<?php echo $_SESSION["usu_id"] ?>">

								<div class="col-lg-6">
									<fieldset class="form-group">
										<label class="form-label semibold" for="exampleInput">Categoria</label>
										<select id="cat_id" name="cat_id"  class="form-control">
											
										</select>
									</fieldset>
								</div>

								<div class="col-lg-6">
											<fieldset class="form-group">
												<label class="form-label semibold" for="tick_titulo">Titulo</label>
												<input type="text" class="form-control" id="tick_titulo" name="tick_titulo" placeholder="Ingrese Titulo">
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
											<button type="submit" name="action" value="add" class="btn btn-rounded btn-inline btn-primary">Guardar</button>
								</div>
					</div>
								
					</div>
				</div>
			</forn>

			<!-- Fin Modal -->

			<div class="box-typical box-typical-padding">
				<table id="ticket_data" class="table table-bordered table-striped table-vcenter js-dataTable-full">
					<thead>
						<tr>
						<th style="width: 5%;">Nro.Ticket</th>
							<th style="width: 15%;">Categoria</th>
							<th class="d-none d-sm-table-cell" style="width: 40%;">Titulo</th>
							<th class="d-none d-sm-table-cell" style="width: 5%;">Estado</th>
							<th class="d-none d-sm-table-cell" style="width: 10%;">Fecha Creación</th>
							<th class="text-center" style="width: 5%;"></th>
						</tr>
					</thead>
					<tbody>
						<h1></h1>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<!-- Contenido -->
	<?php require_once("../MainJs/js.php"); ?>
	<script type="text/javascript" src="consultarticket.js"></script>
	<script type="text/javascript" src="../NuevoTicket/nuevoticket.js"></script>
</body>
</html>
<?php
} else {
	header("Location:"."http://localhost/TI-Desk/"."index.php");
	//header("Location:"."https://tidesk.grupoccima.com/"."index.php");
	
}
?>