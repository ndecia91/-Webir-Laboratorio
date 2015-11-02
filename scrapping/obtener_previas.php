<?php

/*
*
* Obtiene las previas de tipo CURSO/EXAMEN
*
*/

include ('../bd/conexion.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

try {
	$client = new Client();

	$idCarrera= 72;

	$previaDeCurso;

	//Abro conexion
	$bd = conectar();

	if($bd != null){
		$bd->autocommit(false);
		
		$bd->begin_transaction();
		
		$cursos= $bd->query("SELECT * FROM cursos");
		
		if($cursos != false and $cursos->num_rows != 0 ){
			while($row = $cursos->fetch_assoc()) {
				$idCurso= $row["idCurso"];
				echo "----------------------------idCurso: " . $idCurso . "<br>";
				obtenerPreviasCurso($idCarrera,$idCurso);
			}
		}

		//Cierro conexion
		$bd->close();
	}
}
catch (Exception $e) {
	echo 'Excepcion capturada: ',  $e->getMessage(), "\n";
}


/*----------FUNCTIONS--------------*/


function obtenerPreviasCurso($idCarrera,$idCurso) {
	//Formulario con las materias
	$crawler = $GLOBALS['client']->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.imprime?carrera=' . $idCarrera . '&cicl=0&p_mat=' . $idCurso);

	$tabla = $crawler->filter('table table')->eq(0);
	$filas = $tabla->filter('tr')->each(function($fila,$index) {

		global $idCarrera, $idCurso;
		$descarto= false;
		
		if($index > 0){
			echo "LINEA: " . $index . "<br>";
			
			$cantColumnas= $fila->filter('td')->count();
			if ($cantColumnas==5) {
				
				//Obtener datos
				
				$actividad= trim($fila->filter('td')->eq(0)->text());
				//echo "ACTIVIDAD: " . $actividad . "<br>";

				$previa= trim($fila->filter('td')->eq(1)->text());
				//echo "PREVIA: " . $previa . "<br>";

				$nombre= trim($fila->filter('td')->eq(2)->text());
				//echo "NOMBRE: " . $nombre . "<br>";

				$actPrevia= trim($fila->filter('td')->eq(3)->text());
				//echo "ACT PREVIA: " . $actPrevia . "<br>";
				
				$obs= trim($fila->filter('td')->eq(4)->text());
				//echo "OBS: " . $obs . "<br>";
			
				//Procesar datos
				
				if ($obs=='(*)' || $actPrevia=='Grupo') {
					echo "descarto (* o grupo)";
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
				}
			} elseif ($cantColumnas==3) {
				echo "MINIMO CREDITOS <br>";
				
				//Obtener datos
				
				$actividad= trim($fila->filter('td')->eq(0)->text());
				//echo "ACTIVIDAD: " . $actividad . "<br>";

				$minCreditos= trim($fila->filter('td')->eq(1)->text());
				//echo "MINIMO CREDITOS: " . $minCreditos . "<br>";

				$area= trim($fila->filter('td')->eq(1)->text());
				//echo "AREA: " . $area . "<br>";
			}
						
			echo "<br>";
		
		}//end if index>0
	});
}//end function obtenerPreviasCurso

function guardarPrevia($idCarrera,$idCurso,$idPrevia,$actividad,$actividadPrevia){
	
	echo "guardarPrevia <br>";
	
	$GLOBALS['bd']->begin_transaction();
	
	$consultas = true;
	
	//Si la consulta es incorrecta => $consultas = false.
	$GLOBALS['bd']->query("INSERT INTO previas_cursos (idCarrera,idCurso,idPrevia,actividad,actividadPrevia) VALUES ('$idCarrera','$idCurso','$idPrevia','$actividad','$actividadPrevia');") ? null : $consultas=false;		
	
	//Si $consultas TRUE => COMMIT sino ROLLBACK
	if($consultas){
		$GLOBALS['bd']->commit();
		echo("commit");
	} else {
		$GLOBALS['bd']->rollback();
		echo("rollback");
	}

}//end function guardarPrevia
 
 
?>