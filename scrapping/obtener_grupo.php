<?php

/*
*
* Obtiene los cursos y los alamacena en la tabla cursos
*
*/

include_once ('../persistencia/conexion.php');
include_once('../persistencia/persistencia_grupos.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

function obtener_grupo($url){
	
	$client = new Client();
	
	$crawler = $client->request('GET', $url);
	$datos_grupo = obtener_datos_grupo($crawler);
	guardar_grupo($datos_grupo);
	
}

function obtener_datos_grupo($crawler){
	
	$datos_grupo = array();
	
	//Obtengo codigo, nombre, min y max
	$crawler->filter('.och')->each(function ($node, $index) use(&$datos_grupo, $crawler) {
		
		if($index == 1){
			$texto = $node->text();
			
			//Extraigo codigo, nombre, minimo, maximo
			preg_match('/\sGrupo:\s(?<idGrupo>(\w|\s)+)-(?<nombre>.+)\sPuntaje\smínimo:\s(?<min>\d+).+Puntaje\smáximo:\s(?<max>\d+)/', $texto, $matches);
			
			$datos_grupo = array(
				'idGrupo'	=> $matches['idGrupo'],
				'nombre'	=> $matches['nombre'],
				'min'		=> $matches['min'],
				'max'		=> $matches['max'],
				'cursos'		=> obtener_cursos_grupo($crawler)
			);
			
		}
	});
			
	return $datos_grupo;

}

function obtener_cursos_grupo($crawler){
	
	$cursos = array();
	$crawler->filter('table table tr')->each(function ($node, $index) use (&$cursos) {
		
		if($index > 0 ){
			//Obtengo los datos curso, nombre, actividad y puntaje
			$datos_curso = array();
			$node->filter('td')->each(function ($node, $index) use(&$datos_curso){
				
				switch ($index) {
					case 0:
						$datos_curso['idCurso'] = $node->text();
						break;
					case 2:
						$datos_curso['actividad'] = $node->text();
						break;
					case 3:
						$datos_curso['puntaje'] = $node->text();
						break;
				}
			});
			$cursos[$index] = $datos_curso; 
			return $datos_curso;
		}
		
	});
	array_pop($cursos);
	return $cursos;
}
?>