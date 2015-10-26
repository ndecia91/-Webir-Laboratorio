<?php

/*
*
* Obtiene los cursos y los alamacena en la tabla cursos
*
*/

include ('../bd/conexion.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

$client = new Client();

$idCarrera= 72;

$previaDeCurso;

//Conecto con la BD
$conexion = conectar();
	
if($conexion != false){
		
	try{
		
		$conexion->begin_transaction();
		
		$sql = "SELECT * FROM cursos";
		$cursos = $conexion->query($sql);
		if($cursos != false and $cursos->num_rows != 0 ){
			while($row = $cursos->fetch_assoc()) {
				echo "idCurso: " . $row["idCurso"] . "<br>";
				$idCurso= $row["idCurso"];
				//obtenerPreviasCurso($idCarrera,$idCurso,$client);
			}
		}

		$conexion->close();
		return true;
		
	} catch (Exception $e) {
		$conexion->rollback();
		echo('Error en SQL: ' . $sql . ' Error: ' . $conexion->error);
		return false;
	}
}



/*FUNCTIONS*/


function obtenerPreviasCurso($idCarrera,$idCurso,$client) {
	//Formulario con las materias
	$crawler = $client->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.imprime?carrera=' . $idCarrera . '&cicl=0&p_mat=' . $idCurso);


	$tabla = $crawler->filter('table table')->eq(0);
	$filas = $tabla->filter('tr')->each(function($fila,$index) {

		global $idCarrera, $idCurso;
		$descarto= false;
		
		if($index > 0){
			
			//Obtener datos
			
			$actividad= trim($fila->filter('td')->eq(0)->text());
			echo "ACTIVIDAD: " . $actividad . "<br>";

			$previa= trim($fila->filter('td')->eq(1)->text());
			echo "PREVIA: " . $previa . "<br>";

			$nombre= trim($fila->filter('td')->eq(2)->text());
			echo "NOMBRE: " . $nombre . "<br>";

			$actPrevia= trim($fila->filter('td')->eq(3)->text());
			echo "ACT PREVIA: " . $actPrevia . "<br>";
			
			$obs= trim($fila->filter('td')->eq(4)->text());
			echo "OBS: " . $obs . "<br>";
		
			//Procesar datos
			
			if ($obs=='(*)' || $actPrevia=='Grupo') {
				echo "entre al descarto";
				$descarto= true;
			}
			
			if ($actividad=='Curso') {
				$GLOBALS['previaDeCurso']= true;
			} elseif ($actividad=='Examen') {
				$GLOBALS['previaDeCurso']= false;
			}
			
			if ($GLOBALS['previaDeCurso']) {
				$actividad= 'curso';
			} else {
				$actividad= 'examen';
			}

			if ($actPrevia=='Curso aprobado') {
				$actPrevia= 'curso';
			} elseif ($actPrevia=='Curso aprobado') {
				$actPrevia= 'examen';
			}			
			
		
			if ($descarto===false) {
				guardarPrevia($idCarrera,$idCurso,$previa,$actividad,$actPrevia);
				echo "no descarto <br>";
			}
			
			echo "<br>";
		
		}//end if index>0
	});
}//end function 

function guardarPrevia($idCarrera,$idCurso,$idPrevia,$actividad,$actividadPrevia){
	
	echo "guardarPrevia <br>";
	//Conecto con la BD
	$conexion = conectar();
	
	if($conexion != false){
		
		try{
			
			$conexion->begin_transaction();
			
			//Chequeo si existe el curso
			//$sql = "SELECT 'idCurso' FROM cursos WHERE idCurso = $idCurso";
			//$curso = $conexion->query($sql);
			//if($curso != false and $curso->num_rows == 0 ){
				//Almaceno el curso
				$conexion->autocommit(FALSE);
				$sql = "INSERT INTO previas_cursos (idCarrera,idCurso,idPrevia,actividad,actividadPrevia) VALUES ('$idCarrera','$idCurso','$idPrevia','$actividad','$actividadPrevia')";
				$conexion->query($sql);
				$res = $conexion->commit();
			//}
			
			$conexion->close();
			return true;
			
		} catch (Exception $e) {
			$conexion->rollback();
			echo('Error en SQL: ' . $sql . ' Error: ' . $conexion->error);
			return false;
		}
	}

	return false;
}
 

?>