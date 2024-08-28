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
								<?php
									if($_SESSION["rol_id"]==1){
									?>
													<li><a href="#">Inicio</a></li>
									<li class="active">Consultar Ticket</li>
									<?php
										} else {
									?>
									<li><a href="./../Home/">Inicio</a></li>
									<li class="active">Consultar Ticket</li>
									<?php
										}
								?>
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


			<div class="box-typical box-typical-padding">
				<table id="ticket_data" class="table table-bordered table-striped table-vcenter js-dataTable-full">
					<thead>
						<tr>
						<th style="width: 5%;">Nro.Ticket</th>
							<th style="width: 15%;">Categoria</th>
							<th class="d-none d-sm-table-cell" style="width: 40%;">Titulo</th>
							<th class="d-none d-sm-table-cell" style="width: 5%;">Estado</th>
							<th class="d-none d-sm-table-cell" style="width: 10%;">Fecha Creación</th>
							<th class="d-none d-sm-table-cell" style="width: 10%;">Fecha Asignación</th>
							<th class="d-none d-sm-table-cell" style="width: 10%;">Soporte</th>
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

	<?php require_once("modalasignar.php"); ?>

	<?php require_once("../MainJs/js.php"); ?>


	<script type="text/javascript" src="consultarticket.js"></script>
</body>
</html>
<?php
} else {
	header("Location:"."http://localhost/TI-Desk/"."index.php");
	//header("Location:"."https://tidesk.grupoccima.com/"."index.php");
	
}
?>