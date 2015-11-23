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

// Primero tengo que obtener los nodos y después hacer las aristas

$idCarrera = '7200';

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
		$infoCursos= $bd->query("SELECT c.idCurso, c.nombre, c.instituto, c.creditos, c.validez, c.nota_promedio, 
								 c.total_cursantes, c.aprobados, c.exonerados, c.porcentaje_aprobacion 
								 FROM cursos c, curso_carrera cc
								 WHERE cc.idCarrera = '$idCarrera' AND c.idCurso = cc.idCurso");
		$i = 0;		
		$filaCurso = array();
		if($infoCursos != false and $infoCursos->num_rows != 0 ){
			while($rowCurso = $infoCursos->fetch_assoc()) {
				
				$idCurso = $rowCurso["idCurso"];
				$filaCurso["data"]["id"] = "C" . $idCurso;
				
				$nombre = $rowCurso["nombre"];
				$filaCurso["data"]["name"] = $nombre;
				
				$filaCurso["data"]["tipo"] = "CURSO";
				
				$filaCurso["data"]["semestre"] = "1";
				
				$instituto = $rowCurso["instituto"];
				$filaCurso["data"]["instituto"] = $instituto;
				
				$creditos = $rowCurso["creditos"];
				$filaCurso["data"]["creditos"] = $creditos;
				
				$validez = $rowCurso["validez"];
				$filaCurso["data"]["validez"] = $validez;
				
				$notaProm = $rowCurso["nota_promedio"];
				$filaCurso["data"]["nota_promedio"] = $notaProm;
				
				$totalCursantes = $rowCurso["total_cursantes"];
				$filaCurso["data"]["total_cursantes"] = $totalCursantes;
				
				$aprobados = $rowCurso["aprobados"];
				$filaCurso["data"]["aprobados"] = $aprobados;
				
				$exonerados = $rowCurso["exonerados"];
				$filaCurso["data"]["exonerados"] = $exonerados;
				
				$aprobacion = $rowCurso["porcentaje_aprobacion"];
				$filaCurso["data"]["aprobacion"] = $aprobacion;
				
				$grafo["nodes"][0][$i] = $filaCurso;
				
				//echo 'filaCurso: ' . json_encode($filaCurso);
				
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
				$filaGrupo["data"]["id"] = "G" . $idGrupo;
				
				$nombre = $rowGrupo["nombre"];
				$filaGrupo["data"]["name"] = $nombre;
				
				$filaGrupo["data"]["tipo"] = "GRUPO";
				
				$min = $rowGrupo["min"];
				$filaGrupo["data"]["min"] = $min;
				
				$max = $rowGrupo["max"];
				$filaGrupo["data"]["max"] = $max;
				
				$grafo["nodes"][1][$i] = $filaGrupo;
				
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
				$aristaCG["data"]["source"] = "C" . $idCurso;
				
				$idGrupo = $rowCG["idGrupo"];
				$aristaCG["data"]["target"] = "G" . $idGrupo;
				
				$puntaje = $rowCG["puntaje"];
				$aristaCG["data"]["puntaje"] = $puntaje;
				
				$actividad = $rowCG["actividad"];
				$aristaCG["data"]["actividadPrevia"] = $actividad;
				
				$grafo["edges"][0][$i] = $aristaCG;
				
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
				$aristaGC["data"]["source"] = "G" . $idGrupo;
				
				$idCurso = $rowGC["idCurso"];
				$aristaGC["data"]["target"] = "C" . $idCurso;

				$aristaGC["data"]["actividad"] = "GRUPO";
				
				$actividad = $rowGC["actividad"];
				$aristaGC["data"]["actividadPrevia"] = $actividad;
				
				$grafo["edges"][1][$i] = $aristaGC;
				
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
				$aristaCC["data"]["source"] = "C" . $idCurso;
				
				$idPrevia = $rowCC["idPrevia"];
				$aristaCC["data"]["target"] = "C" . $idPrevia;
				
				$actividadPrevia = $rowCC["actividadPrevia"];
				$aristaCC["data"]["actividadPrevia"] = $actividadPrevia;
				
				$actividad = $rowCC["actividad"];
				$aristaCC["data"]["actividad"] = $actividad;
				
				$grafo["edges"][1][$i] = $aristaCC;
				
				echo "fila: " . json_encode($aristaCC);
				
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
?>