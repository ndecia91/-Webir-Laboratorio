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

function guardar_datos_aprobacion($idCurso, $datos){
	
	try {
		
		$conexion = null;
		$conexion = conectar();
		
		$conexion->begin_transaction();
		
		//Chequeo si existe el curso
		if(!existe_curso($idCurso)){
			echo "<p style='padding: 5px;background-color: #FFC107;color: white;'>[guardar_datos_aprobacion]: El curso $idCurso no existe.</p>";
			return;
		}
		
		//Nota promedio
		$success = $conexion->query("SELECT nota_promedio, total_cursantes, aprobados, exonerados, porcentaje_aprobacion FROM cursos WHERE idCurso = '$idCurso'");
			
		if(!$success){
			throw new Exception("[guardar_datos_aprobacion]: Error al almacenar datos de aprobacion del curso $idCurso.");
		}
		
		$query = $success->fetch_assoc();
		if($datos['nota_promedio'] != 'S/N'){
			$nota_promedio =  number_format(((float)$query['nota_promedio'] + (float)$datos['nota_promedio'])/2, 1, '.', '');
		}else{
			$nota_promedio = 'S/N';
		}
		
		//Total cursantes
		$total_cursantes = (int)$datos['total_cursantes'] + (int)$query['total_cursantes'];
		
		if(isset($datos['aprobados'])){
			//Aprobados
			$aprobados = (int)$datos['aprobados'] + (int)$query['aprobados'];
		}
	
		//Exonerados
		$exonerados = (int)$datos['exonerados'] + (int)$query['exonerados'];
		
		//Porcentaje de aprobacion
		$porcentaje_aprobacion =  number_format(($exonerados/$total_cursantes)*100 , 1, '.', '');
		
		//Actualizo los datos
		if(isset($datos['aprobados'])){
			$success = $conexion->query("UPDATE cursos SET nota_promedio = '$nota_promedio', total_cursantes = $total_cursantes, aprobados = $aprobados, exonerados = $exonerados, porcentaje_aprobacion = $porcentaje_aprobacion WHERE idCurso = '$idCurso'");
		}else{
			$success = $conexion->query("UPDATE cursos SET nota_promedio = '$nota_promedio', total_cursantes = $total_cursantes, exonerados = $exonerados, porcentaje_aprobacion = $porcentaje_aprobacion WHERE idCurso = '$idCurso'");
		}
		
		//Commit
		$success = $conexion->commit();
		
		if(!$success){
			throw new Exception("[guardar_datos_aprobacion]: Error al hacer commit curso $idCurso.");
		}
		
		echo "<p style='padding: 5px;background-color: green;color: white;'>[guardar_datos_aprobacion]: Datos aprobacion de $idCurso han sido actualizado correctamente.</p>";
			
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