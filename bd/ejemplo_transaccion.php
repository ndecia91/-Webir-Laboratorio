<?php
 include ('conexion.php');


$bd = conectar();
if($bd != false){
	$bd->autocommit(false);
	
	$bd->begin_transaction();
	
	$consultas = true;
	
	//Si la consulta es incorrecta => $consultas = false.
	$bd->query("CONSULTA") ? null : $consultas=false;
	$bd->query("CONSULTA") ? null : $consultas=false;
	
	//Si $consultas TRUE => COMMIT sino ROLLBACK
	if($consultas){
		$bd->commit();
		echo("commit");
	} else {
		$bd->rollback();
		echo("rollback");
	}
}

//Cierro conexion
$bd->close();
	
?>