<?php
/* 
*
* Ejemplo para obtener las previas del curso de logica 
*
*/

require_once 'goutte.phar';
use Goutte\Client;

$client = new Client();
 
// Pagina de previas
$crawler = $client->request('GET', 'http://www1.bedelias.edu.uy/ingenieria/muestra_prev.selcarr');

// Obtengo el boton del formulario
$form = $crawler->selectButton('Aceptar')->form();
 
// Envio el formulario con la carrera de Ing en computación seleccionada
$crawler = $client->submit($form, array('car' => '7200',));

// Obtengo el boton del formulario
$form = $crawler->selectButton('Aceptar')->form();
 
// Selecciono el curso de Lógica
$crawler = $client->submit($form, array('p_mat' => '1027',));

//Obtengo la tabla de previas
$tabla = $crawler->filter('table table tbody');

//PREVIAS DE CURSO
$previas_curso = array();

$tabla->filter('tr')->each(function ($node, $index) {
		
		global $client;
		
		if($index == 0){
			
		} else {
			
			//Obtengo los cursos hasta que aparezca la palabra examen en la 1era columna
			$tipo = $node->filter('td')->eq(0)->text();
			
			if($tipo == ' Curso ' or strlen($tipo) == 4){
				
				//Obtengo columna actividad previa
				$act_previa = $node->filter('td')->eq(3)->text();
				$cod = $node->filter('td')->eq(1)->text();
				echo($cod."<br>");
				if($act_previa == "Grupo"){
					//echo($act_previa);
					//Obtengo el link a grupo
					$link_grupo = $node->filter('td')->eq(2)->filter('a')->extract(array('href'));
					$grupo = $client->request('GET', $link_grupo[0]);
					
					//Obtengo la tabla del grupo
					//$tabla_grupo = $crawler->filter('table table tbody');
					//$tabla_grupo->filter('tr')->each(function($nodo_grupo, $index_grupo)){
						
					//}
					
				}
				
				//Si es Grupo voy al link y scrapp
				//Si es examen y no tiene * en la columna obs array_push $previas_curso
			}
			//echo($aa);
		}
		
	
});

?>