<?php
require_once("../../config/conexion.php");
session_destroy();
header("Location:"."http://localhost/TI-Desk/"."index.php");
//header("Location:"."https://tidesk.grupoccima.com/"."index.php");
exit();
?>