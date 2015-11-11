<?php

include_once('conexion.php');
include_once('../persistencia/persistencia_cursos.php');
 /*
* Almacena el grupo en la base de datos.
* Si el grupo ya existe la funcion no tiene efecto y
* unicamente se escribe un mensaje de warning.
* Se lanza una excepcion ante cualquier error con la bd.
*/
function guardar_grupo ($datosGrupo){
	
	try {
		
		$idGrupo = $datosGrupo['idGrupo'];
		$nombre = $datosGrupo['nombre'];
		$min = $datosGrupo['min'];
		$max = $datosGrupo['max'];
		$conexion = null;
		$conexion = conectar();
		
		$conexion->begin_transaction();
		
		//Chequeo si existe el grupo
		if(existe_grupo($datosGrupo['idGrupo'])){
			echo "<p style='padding: 5px;background-color: #FFC107;color: white;'>[guardar_curso]: El grupo $idGrupo ya existe.</p>";
			return;
		}
		
		//Genero las consultas
		$success = $conexion->query("INSERT INTO grupos (idGrupo,nombre,min,max) VALUES ('$idGrupo', '$nombre', $min, $max)");
		
		foreach($datosGrupo['cursos'] as $curso){
			
			//Chequeo si el curso existe
			$idCurso = $curso['idCurso'];
			$puntaje = $curso['puntaje'];
			$actividad = $curso['actividad'];
			
			$existe = existe_curso($idCurso);
			
			if($existe)
				$success = $conexion->query("INSERT INTO curso_grupo (idGrupo,idCurso,puntaje,actividad) VALUES ('$idGrupo', '$idCurso', $puntaje, '$actividad')");
				
		}
			
		if(!$success)
			throw new Exception("[guardar_grupo]: Error al almacenar el grupo $idGrupo.");
	
		//Commit
		$success = $conexion->commit();
		
		if(!$success)
			throw new Exception("[guardar_grupo]: Error al hacer commit del grupo $idGrupo.");
		
		echo "<p style='padding: 5px;background-color: green;color: white;'>[guardar_grupo]: El grupo $idGrupo ha sido almacenado correctamente.</p>";
				
	}catch (Exception $e){
		
		if ($conexion != null)
			$conexion->rollback();
		
		throw $e;
		
	} finally {
		
		if ($conexion != null)
			$conexion->close();
	
	}

}

function existe_grupo($idGrupo){
	
	$conexion = conectar();
	
	$sql  = "SELECT 'idGrupo' FROM grupos WHERE idGrupo = '$idGrupo'";
	
	$resultado  = $conexion->query($sql);

    if ($resultado == false)
		throw new Exception("<p style='padding: 5px;background-color: #F44336;color: white;'>[existe_grupo]: Error al chequear si existe el grupo $idGrupo.</p>");

	$existe_grupo = $resultado->num_rows > 0;

    return $existe_grupo;
}
?>