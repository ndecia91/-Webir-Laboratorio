<?php
function obtenerPreviasCreditos ($idCarrera){
	
	//Obtener info de la base y armar el array
	
	$previas_creditos = array(
		'2034' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'1510' => array(
					'area' => 'CARRERA',
					'creditos' => 80,
		),
		'1730' => array(
					'area' => 'CARRERA',
					'creditos' => 330,
		),
		'2036' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'1519' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
		'1944' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'1213' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
		'1507' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
	);	
	
	$previasCreditosJson = json_encode($previas_creditos);
	
	echo $previasCreditosJson;
	
	
}

 
?>