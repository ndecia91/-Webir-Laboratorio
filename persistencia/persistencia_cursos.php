<?php

include_once('conexion.php');

 /*
* Almacena el curso en la base de datos.
* Si el curso ya existe la funcion no tiene efecto y
* unicamente se escribe un mensaje de warning.
* Se lanza una excepcion ante cualquier error con la bd.
*/
function guardar_curso ($idCarrera, $idCurso, $nombreCurso){
	
	try {
		
		$conexion = null;
		$conexion = conectar();
		
		$conexion->begin_transaction();
		
		//Chequeo si existe el curso
		if(existe_curso($idCurso)){
			echo "<p style='padding: 5px;background-color: #FFC107;color: white;'>[guardar_curso]: El curso $idCurso ya existe.</p>";
			return;
		}
		
		//Genero las consultas
		$success = $conexion->query("INSERT INTO cursos (idCurso,nombre) VALUES ('$idCurso', '$nombreCurso')");
		$success = $conexion->query("INSERT INTO curso_carrera (idCarrera,idCurso) VALUES ('$idCarrera', '$idCurso')");
				
		if(!$success){
			throw new Exception("[guardar_curso]: Error al almacenar el curso $idCurso.");
		}
		
		//Commit
		$success = $conexion->commit();
		
		if(!$success){
			throw new Exception("[guardar_curso]: Error al hacer commit del curso $idCurso.");
		}
		
		echo "<p style='padding: 5px;background-color: green;color: white;'>[guardar_curso]: El curso $idCurso ha sido almacenado correctamente.</p>";
				
	}catch (Exception $e){
		
		if ($conexion != null)
			$conexion->rollback();
		
		throw $e;
		
	} finally {
		
		if ($conexion != null)
		$conexion->close();
	
	}

}

function existe_curso($idCurso){
	
	$conexion = conectar();
	
	$sql  = "SELECT 'idCurso' FROM cursos WHERE idCurso = '$idCurso'";
	
	$resultado  = $conexion->query($sql);

    if ($resultado == false)
		throw new Exception("<p style='padding: 5px;background-color: #F44336;color: white;'>[existe_curso]: Error al chequear si existe el curso $idCurso.</p>");

	$existe_curso = $resultado->num_rows > 0;

    return $existe_curso;
}

function guardar_creditos_validez($idCurso, $creditos, $validez){
	
	
	try {
		
		$conexion = null;
		$conexion = conectar();
		
		$conexion->begin_transaction();
		
		//Chequeo si existe el curso
		if(!existe_curso($idCurso)){
			echo "<p style='padding: 5px;background-color: #FFC107;color: white;'>[guardar_curso]: El curso $idCurso no existe.</p>";
			return;
		}
		
		//Genero las consultas
		
		$success = $conexion->query("UPDATE cursos SET creditos = $creditos, validez = $validez WHERE idCurso = '$idCurso'");

		if(!$success){
			throw new Exception("[guardar_creditos_validez]: Error al almacenar creditos y validez  del curso $idCurso.");
		}
		
		//Commit
		$success = $conexion->commit();
		
		if(!$success){
			throw new Exception("[guardar_creditos_validez]: Error al hacer commit de la info del curso $idCurso.");
		}
		
		echo "<p style='padding: 5px;background-color: green;color: white;'>[guardar_creditos_validez]: Creditos y validez del curso $idCurso han sido actualizado correctamente.</p>";
				
	}catch (Exception $e){
		
		if ($conexion != null)
			$conexion->rollback();
		
		throw $e;
		
	} finally {
		
		if ($conexion != null)
		$conexion->close();
	
	}
}

?>