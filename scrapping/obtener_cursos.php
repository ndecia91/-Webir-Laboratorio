<?php

/*
*
* Obtiene los cursos y los alamacena en la tabla cursos
*
*/

include ('../bd/conexion.php');
require_once 'goutte.phar';
use Goutte\Client;

$client = new Client();
 
//Formulario con las materias
$crawler = $client->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.obt_carrcic?car=7200');


//Obtengo todas las opciones del campo select y almaceno en la bd codigo y nombre

$opciones = $crawler->filter('option')->each(function ($node, $index) {
	global $datos_cursos;
	global $conn;
	if($index > 0){
		$valores = explode(" - ",$node->html());
		$valor[0] = trim($valores[0]);
		$valor[1] = trim($valores[1]);
		
		$val_codificado = utf8_decode ( $valor[1] );
	
		$sql = "INSERT INTO cursos (idCurso,nombre) VALUES ('$valor[0]', '$val_codificado')";
		
		$rs=$conn->query($sql);
	
		if($rs === false) {
		  trigger_error('Error en SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
		  die();
		} else {
		  $rows_returned = $rs->num_rows;
		}

	}
	
});

echo "Cursos cargados exitosamente";
 







?>