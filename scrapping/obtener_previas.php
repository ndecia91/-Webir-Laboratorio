<?php

/*
*
* Obtiene las previas de tipo CURSO/EXAMEN
*
*/

include ('../persistencia/conexion.php');
include ('../persistencia/persistencia_previas.php');
include_once ('../scrapping/obtener_grupo.php');

require_once 'lib/goutte.phar';
use Goutte\Client;


function obtener_previas($idCarrera){
	echo 'holaa';
	try {
		$client = new Client();

		$previaDeCurso;
		//Abro conexion
		$bd = conectar();
		if($bd != null){
			$bd->autocommit(false);
			$bd->begin_transaction();
			$cursos= $bd->query("SELECT * FROM curso_carrera WHERE idCarrera = '$idCarrera'");
			echo '<br> num_rows: ' . $cursos->num_rows . '<br>';
			if($cursos != false and $cursos->num_rows != 0 ){
				while($row = $cursos->fetch_assoc()) {
					$idCurso= $row["idCurso"];
					echo "----------------------------idCurso: " . $idCurso . "<br>";
					obtenerPreviasCurso($idCarrera,$idCurso,$client);
				}
			}

			//Cierro conexion
			$bd->close();
		}
	}
	catch (Exception $e) {
		echo 'Excepcion capturada: ',  $e->getMessage(), "\n";
	}
}



/*----------FUNCTIONS--------------*/


function obtenerPreviasCurso($idCarrera,$idCurso,$client) {
	//Formulario con las materias
	//$crawler = $GLOBALS['client']->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.imprime?carrera=' . $idCarrera . '&cicl=0&p_mat=' . $idCurso);
	$crawler = $client->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.imprime?carrera=72&cicl=0&p_mat=' . $idCurso);
	
	$tabla = $crawler->filter('table table')->eq(0);
	$filas = $tabla->filter('tr')->each(function($fila,$index) use($idCarrera,$idCurso) {
		
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
				echo "NOMBRE: " . $nombre . "<br>";

				$actPrevia= trim($fila->filter('td')->eq(3)->text());
				//echo "ACT PREVIA: " . $actPrevia . "<br>";
				
				$obs= trim($fila->filter('td')->eq(4)->text());
				//echo "OBS: " . $obs . "<br>";
			
				//Procesar datos
				
				//Es previa del Curso o del Examen
				if ($actividad=='Curso') {
					$GLOBALS['previaDeCurso']= true;
				} elseif ($actividad=='Examen') {
					$GLOBALS['previaDeCurso']= false;
				}				
				if ($GLOBALS['previaDeCurso']) {
					$actividad= 'CURSO';
				} else {
					$actividad= 'EXAMEN';
				}
				
				if ($obs=='(*)') {
					echo "descarto (*)";
				} else {
					if ($actPrevia=='Grupo') {
						//La previa es un Grupo
						$url= $fila->filter('td')->eq(2)->filter('a')->eq(0)->attr('href');
						$url= 'http://www1.bedelias.edu.uy' . $url;
						echo $url;
						obtener_grupo($url);
						guardarPreviaGrupo($idCarrera,$idCurso,$previa,$actividad);
					} else {
						//La previa es un Curso aprobado o un Examen aprobado
						if ($actPrevia=='Curso aprobado') {
							$actPrevia= 'CURSO';
						} elseif ($actPrevia=='Curso aprobado') {
							$actPrevia= 'EXAMEN';
						}			
						guardarPreviaCurso($idCarrera,$idCurso,$previa,$actividad,$actPrevia);
					}
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


obtener_previas('7200');

?>