<?php
require_once("../../config/conexion.php");
session_destroy();
header("Location:"."http://localhost/TI-Tickets/"."index.php");
exit();
?>