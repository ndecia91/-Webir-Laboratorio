<?php



include_once('../persistencia/conexion.php');
include_once('../persistencia/persistencia_cursos.php');
require_once 'lib/goutte.phar';
use Goutte\Client;

/*
* Obtiene los cursos haciendo scraping sobre la pagina de bedelias
* y los almacena en la base de datos.
* Se lanza una excepcion ante cualquier error.
*/
function obtener_cursos($idCarrera){
	$client = new Client();
	
	$URL_CURSOS = "http://www1.bedelias.edu.uy/ingenieria/muestra_prev.obt_carrcic?car=$idCarrera";
 
	//Formulario con las materias
	$crawler = $client->request('GET', "$URL_CURSOS");

	//Obtengo todas las opciones del campo select y almaceno en la bd codigo y nombre

	$opciones = $crawler->filter('option')->each(function ($node, $index) use($idCarrera) {
		
		if($index == 0)
			return;
		
		$datos_curso = explode(" - ",$node->html());
		$id_curso = trim($datos_curso[0]);
		$nombre_curso = trim($datos_curso[1]);
			
		$nombre_curso_utf8 = utf8_decode ( $nombre_curso );
			
		//Almaceno el curso en la base de datos
		try {
			guardar_curso($idCarrera, $id_curso, $nombre_curso_utf8 );
		}catch (Exception $e){
			echo $e->getMessage();
		}
	});

}

?>