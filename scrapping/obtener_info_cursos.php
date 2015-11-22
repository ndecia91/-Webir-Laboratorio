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
	
	//Obtengo porcentajes de aprobacion
	$crawler = $client->request('GET', "http://www1.bedelias.edu.uy/ingenieria/actas_curso.sel_per_car");

	//Obtengo los meses y obtengo los datos para cada periodo
	$crawler->filter('select[name="p_permes"] option')->each(function ($node, $index) use ($crawler, $client, $idCarrera) {
		$form = $crawler->selectButton('Aceptar')->form();
		$actas_mes = $client->submit($form, array('p_permes' => $node->text(), "p_curri" => "C", "p_carrcic" => $idCarrera));
		
		//Por cada curso del periodo obtengo los datos
		$actas_mes->filter('select[name="p_matnommat"] option')->each(function ($node, $index) use($actas_mes, $client){
			
			$form = $actas_mes->selectButton('Aceptar')->form();
			$datos_curso = explode(" - ",$node->html());
			$id_curso = trim($datos_curso[0]);
			$acta_curso = $client->submit($form, array('p_matnommat' => $id_curso));
			$datos = obtener_datos_aprobacion($acta_curso);
			
			try {
				//guardar_datos_aprobacion($id_curso, $datos);
			}catch (Exception $e){
				echo $e->getMessage();
			}	
				
		});
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

function obtener_datos_aprobacion($acta_curso) {
	
	$acta_curso = $acta_curso->filter('.unoa')->each(function($acta, $index){
		
		if($index == 0)
			return;
		
		//Obtengo promedio
		if($index == 1){
			$notas = $acta->filter('tr td:nth-child(3)')->each(function($nota, $index){
				if($index == 0)
					return;
				return (preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $nota->text()));
			});
			
			//Obtengo la suma total de notas y luego calculo el promedio
			$suma_total = 0;
	
			foreach($notas as $nota){
				if($suma_total != -1 and $nota != null){
					
					if($nota == ' S/N '){
						$suma_total = -1;
					}else{
						$suma_total = $suma_total + (int)$nota;
					}
				}
			}
			
			$cantidad_notas = count($notas)-1;
			
			if($suma_total != -1){
				$promedio_notas = number_format($suma_total/$cantidad_notas, 1, '.', '');
			}else{
				$promedio_notas = 'S/N';
			}
			
			return $promedio_notas;
		}
		
		//Obtengo total y cantidad de aprobados
		if($index == 2){
		
			$datos_aprobacion = $acta->filter('td:nth-child(2)')->each(function($totales, $indice){
				
				if($indice == 0){
					$total = preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $totales->text()); 
					return $total;
				}
				
				if($indice == 1){
					$total = preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $totales->text());
					return $total;					
				}
				
			});
			
			return $datos_aprobacion;
		}
		
		//Detalle de aprobacion
		if($index == 3){
			
			$datos_aprobacion = $acta->filter('td')->each(function($totales, $indice){
				
				if($indice == 2){
					$total = preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $totales->text()); 
					return $total;
				}
				
				if($indice == 4){
					$total = preg_replace('/[^\x00-\x7f£¢£€¥]+/u', '', $totales->text()); 
					return $total;
				}
				
			});
			
			return $datos_aprobacion;
		}
	});
	
	//Armo array con los datos y retorno
	$datos_cursos = array(
		"nota_promedio"		=> trim($acta_curso[1]),
		"total_cursantes"	=> trim($acta_curso[2][0]),
		"exonerados"			=> trim($acta_curso[2][1]),
	);
	
	if(isset($acta_curso[3])){
		$datos_cursos["aprobados"] = $datos_cursos["exonerados"];
		$datos_cursos["exonerados"] =  trim($acta_curso[3][4]);
	}

	return $datos_cursos;
}

?>