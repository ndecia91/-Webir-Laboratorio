<?php

/*
*
* Obtiene la informacion de los cursos y los alamacena en la tabla cursos
*
*/

include_once('../persistencia/conexion.php');
include_once('../persistencia/persistencia_cursos.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

/*
* Obtiene la informacion de los cursos haciendo scraping sobre la pagina de bedelias
* y los almacena en la base de datos.
* Se lanza una excepcion ante cualquier error.
*/
function obtener_info_cursos($idCarrera){
	$client = new Client();
 
	//Obtengo creditos y validez del curso
	$crawler = $client->request('GET', "http://www1.bedelias.edu.uy/ingenieria/muestra_mats.impr?car=$idCarrera");

	//Obtengo las tablas por área, y almaceno los cursos de cada una
	$crawler->filter('.unoa')->each(function ($node, $index) use($idCarrera) {

		if($index == 0)
			return;
		
		//De la tabla obtengo la informacion de los cursos
		$datos_cursos = leer_tabla($node);
		
		//Almaceno creditos y validez
		foreach ($datos_cursos as $datos_curso){
			try {
				guardar_creditos_validez($datos_curso[0], $datos_curso[1], $datos_curso[2]);
			}catch (Exception $e){
				echo $e->getMessage();
			}	
		}
	});

}

 
obtener_info_cursos("7200");

function leer_tabla ($tabla){
	
	$datos_cursos = $tabla->filter('tr')->each(function($node, $index){
		
		if($index == 0)
			return;
		
		//Leer fila
		$datos_curso = obtener_creditos_validez($node);
		
		return $datos_curso;
		
	});
	
	array_shift($datos_cursos);
	
	return $datos_cursos;

}

function obtener_creditos_validez($fila){
	
	//Obtengo los datos
	$datos = $fila->filter('td')->each(function($node, $index){
		
		$datos_curso = array();
		
		//Obtengo el codigo del curso
		if($index == 0){
			$idCurso =  $node->text();
			return  preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $idCurso);
		}
		//Obtengo créditos
		if($index == 2){
			return $node->text();
		}
		
		//Obtengo validez
		if($index == 7){
			return $node->text();
		}
		
	});
	
	//Codigo del curso
	$datos_curso[0] = $datos[0];
	
	//Creditos
	$datos_curso[1] = $datos[2];
	
	//Validez
	$datos_curso[2] = $datos[7];
	
	return $datos_curso;
}

?>