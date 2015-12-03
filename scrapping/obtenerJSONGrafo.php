<?php

/* 

Creación del grafo en json que contiene nodos y aristas. 

Tenemos 3 tipos de aristas: -> source, target, puntaje, actividad (lo que dice)
	* De Curso a Grupo (tiene source (idCurso), target (idGrupo), puntaje y actividad previa (CURSO o EXAMEN))
	* De Grupo a Curso (tiene source (idGrupo), target (idCurso), actividad previa (GRUPO) y actividad (CURSO o EXAMEN))
	* De Curso a Curso (tiene source (idCurso1), target (idCurso2), actividad previa (CURSO o EXAMEN) y actividad (CURSO o EXAMEN))
	
Tenemos 2 tipos de nodos: 
	* De Curso (tiene id, nombre, tipo (CURSO) , semestre, instituto, creditos, validez, nota_promedio, total_cursantes, aprobados, exonerados, %aprobacion)
	* De Grupo (tiene id, nombre, tipo (GRUPO) , min, max) 
	
*/

include ('../persistencia/conexion.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

function obtener_grafo($idCarrera){
	
	// Primero tengo que obtener los nodos y después hacer las aristas

	$grafo = array(
		"nodes" => array(),
		"edges"	=> array()
	);	

	try {
		$client = new Client();

		//$previaDeCurso;

		//Abro conexion
		$bd = conectar();

		$fila = array();
		
		if($bd != null){
			$bd->autocommit(false);
			
			$bd->begin_transaction();

			// Obtengo los NODOS
			
			echo "Obteniendo Nodos Cursos...<br>";
			
			// Obtengo los nodos que son de tipo CURSO que sean de la carrera seleccionada
			$infoCursos= $bd->query("SELECT c.idCurso, CONVERT(c.nombre USING utf8) as nombre, c.instituto, c.creditos, c.validez, 
									 c.semestre, c.exonerable, c.nota_promedio, c.total_cursantes, c.aprobados, c.exonerados, c.porcentaje_aprobacion 
									 FROM cursos c, curso_carrera cc
									 WHERE cc.idCarrera = '$idCarrera' AND c.idCurso = cc.idCurso");
			$i = 0;		
			$filaCurso = array();
			if($infoCursos != false and $infoCursos->num_rows != 0 ){
				while($rowCurso = $infoCursos->fetch_assoc()) {
					
					$idCurso = $rowCurso["idCurso"];
					$grafo["nodes"][0]["data"][$i]["id"] = "C" . $idCurso;
					
					$nombre = $rowCurso["nombre"];
					$grafo["nodes"][0]["data"][$i]["name"] = utf8_encode($nombre);
					//echo 'NOMBRE COMUN: ' . $nombre . '<br>';
					//echo 'NOMBRE ENCODE: ' . $filaCurso["data"]["name"] . '<br>';
					
					$grafo["nodes"][0]["data"][$i]["tipo"] = "CURSO";
						
					$instituto = $rowCurso["instituto"];
					$grafo["nodes"][0]["data"][$i]["instituto"] = $instituto;
					
					$creditos = $rowCurso["creditos"];
					$grafo["nodes"][0]["data"][$i]["creditos"] = $creditos;
					
					$validez = $rowCurso["validez"];
					$grafo["nodes"][0]["data"][$i]["validez"] = $validez;
					
					$semestre = $rowCurso["semestre"];
					$grafo["nodes"][0]["data"][$i]["semestre"] = $semestre;
					
					$exonerable = $rowCurso["exonerable"];
					$grafo["nodes"][0]["data"][$i]["exonerable"] = utf8_encode($exonerable);
					
					$notaProm = $rowCurso["nota_promedio"];
					$grafo["nodes"][0]["data"][$i]["nota_promedio"] = $notaProm;
					
					$totalCursantes = $rowCurso["total_cursantes"];
					$grafo["nodes"][0]["data"][$i]["total_cursantes"] = $totalCursantes;
					
					$aprobados = $rowCurso["aprobados"];
					$grafo["nodes"][0]["data"][$i]["aprobados"] = $aprobados;
					
					$exonerados = $rowCurso["exonerados"];
					$grafo["nodes"][0]["data"][$i]["exonerados"] = $exonerados;
					
					$aprobacion = $rowCurso["porcentaje_aprobacion"];
					$grafo["nodes"][0]["data"][$i]["aprobacion"] = $aprobacion;
					
					//$grafo["nodes"][0][data][$i] = $filaCurso;
					
					//echo 'filaCurso: ' . json_encode($grafo) . '<br>';
					
					$i = $i + 1;
					
				}
			}
			
			echo "Obteniendo Nodos Grupos...<br>";
			
			// Obtengo los nodos que son de tipo GRUPO cuyas materias sean de la carrera seleccionada
			$infoGrupos= $bd->query("SELECT g.idGrupo, g.nombre, g.min, g.max 
									 FROM grupos g
									 WHERE g.idGrupo in ( SELECT DISTINCT cg.idGrupo
														  FROM curso_grupo cg, curso_carrera cc
														  WHERE cc.idCarrera = '$idCarrera' AND cg.idCurso = cc.idCurso)");
			$i = 0;		
			$filaGrupo = array();
			if($infoGrupos != false and $infoGrupos->num_rows != 0 ){
				while($rowGrupo = $infoGrupos->fetch_assoc()) {
					
					$idGrupo = $rowGrupo["idGrupo"];
					$grafo["nodes"][1]["data"][$i]["id"] = "G" . $idGrupo;
					
					$nombre = $rowGrupo["nombre"];
					$grafo["nodes"][1]["data"][$i]["name"] = $nombre;
					
					$grafo["nodes"][1]["data"][$i]["tipo"] = "GRUPO";
					
					$min = $rowGrupo["min"];
					$grafo["nodes"][1]["data"][$i]["min"] = $min;
					
					$max = $rowGrupo["max"];
					$grafo["nodes"][1]["data"][$i]["max"] = $max;
					
					//$grafo["nodes"][1][$i] = $filaGrupo;
					
					$i = $i + 1;

				}
			}
			
			// Obtengo las ARISTAS
			
			echo "Obteniendo Aristas de Cursos a Grupos...<br>";
			
			// Obtengo las aristas que son de Cursos a Grupos, que sean de la carrera seleccionada
			$aristasCG= $bd->query("SELECT cg.idGrupo, cg.idCurso, cg.puntaje, cg.actividad
									 FROM curso_grupo cg, curso_carrera cc
									 WHERE cc.idCarrera = '$idCarrera' AND cg.idCurso = cc.idCurso");
			$i = 0;		
			$aristaCG = array();
			if($aristasCG != false and $aristasCG->num_rows != 0 ){
				while($rowCG = $aristasCG->fetch_assoc()) {
					
					$idCurso = $rowCG["idCurso"];
					$grafo["edges"][0]["data"][$i]["source"] = "C" . $idCurso;
					
					$idGrupo = $rowCG["idGrupo"];
					$grafo["edges"][0]["data"][$i]["target"] = "G" . $idGrupo;
					
					$puntaje = $rowCG["puntaje"];
					$grafo["edges"][0]["data"][$i]["puntaje"] = $puntaje;
					
					$actividad = $rowCG["actividad"];
					$grafo["edges"][0]["data"][$i]["actividadPrevia"] = $actividad;
					
					//$grafo["edges"][0]["data"][$i] = $aristaCG;
					
					$i = $i + 1;
					
				}
			}
			
			echo "Obteniendo Aristas de Grupos a Cursos...<br>";
			
			// Obtengo las aristas que son de Grupos a Cursos, que sean de la carrera seleccionada
			$aristasGC= $bd->query("SELECT pg.idCurso, pg.idGrupo, pg.actividad
									 FROM previas_grupos pg, curso_carrera cc  
									 WHERE cc.idCarrera = '$idCarrera' AND pg.idCurso = cc.idCurso");
			$i = 0;		
			$aristaGC = array(); 
			if($aristasGC != false and $aristasGC->num_rows != 0 ){   
				while($rowGC = $aristasGC->fetch_assoc()) {
					
					$idGrupo = $rowGC["idGrupo"];
					$grafo["edges"][1]["data"][$i] ["source"] = "G" . $idGrupo;
					
					$idCurso = $rowGC["idCurso"];
					$grafo["edges"][1]["data"][$i] ["target"] = "C" . $idCurso;

					$grafo["edges"][1]["data"][$i] ["actividad"] = "GRUPO";
					
					$actividad = $rowGC["actividad"];
					$grafo["edges"][1]["data"][$i] ["actividadPrevia"] = $actividad;
					
					//$grafo["edges"][1]["data"][$i] = $aristaGC;
					
					$i = $i + 1;
					
				}
			}
			
			echo "Obteniendo Aristas de Cursos a Cursos...<br>";
			
			// Obtengo las aristas que son de Cursos a Cursos, que sean de la carrera seleccionada
			$aristasCC= $bd->query("SELECT pc.idCurso, pc.idPrevia, pc.actividadPrevia, pc.actividad
									 FROM previas_cursos pc, curso_carrera cc  
									 WHERE cc.idCarrera = '$idCarrera' AND pc.idCurso = cc.idCurso");
			$i = 0;		
			$aristaCC = array(); 
			if($aristasCC != false and $aristasCC->num_rows != 0 ){   
				while($rowCC = $aristasCC->fetch_assoc()) {
					
					$idCurso = $rowCC["idCurso"];
					$grafo["edges"][2]["data"][$i]["source"] = "C" . $idCurso;
					
					$idPrevia = $rowCC["idPrevia"];
					$grafo["edges"][2]["data"][$i]["target"] = "C" . $idPrevia;
					
					$actividadPrevia = $rowCC["actividadPrevia"];
					$grafo["edges"][2]["data"][$i]["actividadPrevia"] = $actividadPrevia;
					
					$actividad = $rowCC["actividad"];
					$grafo["edges"][2]["data"][$i]["actividad"] = $actividad;
					
					//$grafo["edges"][2]["data"][$i] = $aristaCC;
					
					//echo "fila: " . json_encode($aristaCC);
					
					$i = $i + 1;
					
				}
			}
			
			//Cierro conexion
			$bd->close();
		}
	}
	catch (Exception $e) {
		echo 'Excepcion capturada: ',  $e->getMessage(), "\n";
	}

	$grafo_json = json_encode($grafo);
	echo "grafo: " . json_encode($grafo) . "<br>";
	var_dump ($grafo_json);

}

$idCarrera = '7200';
obtener_grafo($idCarrera);

?>