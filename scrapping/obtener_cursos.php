<?php

/*
*
* Obtiene los cursos y los alamacena en la tabla cursos
*
*/

include ('../bd/conexion.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

function obtener_cursos($idCarrera){
	$client = new Client();
 
	//Formulario con las materias
	$crawler = $client->request('GET', "http://www1.bedelias.edu.uy/ingenieria/muestra_prev.obt_carrcic?car=$idCarrera");

	//Obtengo todas las opciones del campo select y almaceno en la bd codigo y nombre

	$opciones = $crawler->filter('option')->each(function ($node, $index) {
		global $datos_cursos;
		if($index > 0){
			$valores = explode(" - ",$node->html());
			$valor[0] = trim($valores[0]);
			$valor[1] = trim($valores[1]);
			
			$val_codificado = utf8_decode ( $valor[1] );
			
			//Almaceno el curso en la base de datos
			guardar_curso($valor[0], $val_codificado );
	
		}
		
	});

	echo "Cursos cargados exitosamente";
}

 
//obtener_cursos("7200");

//Funcion que guarda un curso. Si fallo devuelve true sino false
function guardar_curso ($idCurso, $nombreCurso){
	
	//Conecto con la BD
	$conexion = conectar();
	
	if($conexion != false){
		
		try{
			
			$conexion->begin_transaction();
			
			//Chequeo si existe el curso
			$sql = "SELECT 'idCurso' FROM cursos WHERE idCurso = $idCurso";
			$curso = $conexion->query($sql);
			if($curso != false and $curso->num_rows == 0 ){
				//Almaceno el curso
				$conexion->autocommit(FALSE);
				$sql = "INSERT INTO cursos (idCurso,nombre) VALUES ('$idCurso', '$nombreCurso')";
				$conexion->query($sql);
				$res = $conexion->commit();
			}
			
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

guardar_curso("12345", "Algebra");




?>