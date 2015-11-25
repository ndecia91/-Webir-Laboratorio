<?php
include_once('conexion.php');

function guardarPreviaCurso($idCarrera,$idCurso,$idPrevia,$actividad,$actividadPrevia){
	
	echo "guardarPreviaCurso <br>";
	var_dump($idCarrera);
	
	$conexion = null;
	$conexion = conectar();
		
	$conexion->begin_transaction();
	
	$consultas = true;
	
	//Si la consulta es incorrecta => $consultas = false.
	$conexion->query("INSERT INTO previas_cursos (idCarrera,idCurso,idPrevia,actividad,actividadPrevia) VALUES ('$idCarrera','$idCurso','$idPrevia','$actividad','$actividadPrevia');") ? null : $consultas=false;		
	
	//Si $consultas TRUE => COMMIT sino ROLLBACK
	if($consultas){
		$conexion->commit();
		echo("commit");
	} else {
		$errors[] = $conexion->error;
		var_dump($errors);
		$conexion->rollback();
		echo("rollback");
	}
	
	$conexion->close();

}//end function guardarPreviaCurso

function guardarPreviaGrupo($idCarrera,$idCurso,$idGrupo,$actividad){

	echo "guardarPreviaGrupo <br>";
	
	$conexion = null;
	$conexion = conectar();
		
	$conexion->begin_transaction();
	
	$consultas = true;
	
	//Si la consulta es incorrecta => $consultas = false.
	$conexion->query("INSERT INTO previas_grupos (idCarrera,idCurso,idGrupo,actividad) VALUES ('$idCarrera','$idCurso','$idGrupo','$actividad');") ? null : $consultas=false;		
	
	//Si $consultas TRUE => COMMIT sino ROLLBACK
	if($consultas){
		$conexion->commit();
		echo("commit");
	} else {
		$conexion->rollback();
		echo("rollback");
	}
	
	$conexion->close();
	
}//end function guardarPreviaGrupo

?>