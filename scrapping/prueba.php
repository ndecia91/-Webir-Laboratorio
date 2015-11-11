<?php

/*
*
* Obtiene los cursos y los alamacena en la tabla cursos
*
*/

include ('../bd/conexion.php');
require_once 'lib/goutte.phar';
use Goutte\Client;




		$bd = conectar();
		if($bd != null){
			$bd->autocommit(false);
			
			$bd->begin_transaction();
			
			$consultas = true;
			
			$bd->query("INSERT INTO grupos (idGrupo,nombre,min,max) VALUES ('999', 'prueba', 1, 3)") ? null : $consultas=false;
	
			if($consultas){
				$bd->commit();
				echo("<p>Grupo $datos_grupo[0] almacenado con exito</p>");
			} else {
				$bd->rollback();
				echo("<p>Rollback: Error al almacenar el grupo $datos_grupo[0] - $datos_grupo[1]</p>");
			}
		}

		//Cierro conexion
		$bd->close();
	






?>