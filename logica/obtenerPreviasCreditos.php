<?php
function obtenerPreviasCreditos ($idCarrera){
	
	//Obtener info de la base y armar el array
	
	$previas_creditos = array(
		'C2034' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'C1510' => array(
					'area' => 'CARRERA',
					'creditos' => 80,
		),
		'C1730' => array(
					'area' => 'CARRERA',
					'creditos' => 330,
		),
		'C2036' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'C1519' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
		'C1944' => array(
					'area' => 'CARRERA',
					'creditos' => 250,
		),
		'C1213' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
		'C1507' => array(
					'area' => 'CARRERA',
					'creditos' => 100,
		),
	);	
	
	$previasCreditosJson = json_encode($previas_creditos);
	
	echo $previasCreditosJson;
	
	
}

obtenerPreviasCreditos($_POST['idCarrera']);
 
?>