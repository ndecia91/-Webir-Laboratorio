<?php
/*$grafo = array(
	"nodos_iniciales" => array( "1020", "1052", "1030"),
	"cursos" => array( 
		"1020" => array(
			"nombre"=> "Calculo 1",
			"semestre"=> "1",
			"creditos"=> "16",
			"validez"=> "20",
			"aprobacion"=> "30,5"
		),
		"1052" => array(
			"nombre"=> "Calculo 1 (Anual)",
			"semestre"=> "1",
			"creditos"=> "16",
			"validez"=> "20",
			"aprobacion"=> "40,5"
		),
		"1030" => array(
			"nombre"=> "GAL 1",
			"semestre"=> "1",
			"creditos"=> "9",
			"validez"=> "20",
			"aprobacion"=> "40,5"
		),
		"1022" => array(
			"nombre"=> "Calculo 2",
			"semestre"=> "2",
			"creditos"=> "16",
			"validez"=> "20",
			"aprobacion"=> "44,5"
		),
		"1025" => array(
			"nombre"=> "PyE",
			"semestre"=> "3",
			"creditos"=> "10",
			"validez"=> "20",
			"aprobacion"=> "50,2"
		),
	),
	"grupos" => array(
		"C1020" => array(
			"nombre"=> "Calculo 1",
			"min"=> "1",
			"maximo"=> "1"
		),
		"1002" => array(
			"nombre"=> "Algebra y geometría",
			"min"=> "1",
			"maximo"=> "1"
		),
		"1001" => array(
			"nombre"=> "Calculo y Análisis",
			"min"=> "4",
			"maximo"=> "6"
		)
	),
	"aristas" => array(
		"1020" => array(
			"destino"=> "C1020",
			"puntaje"=> "1",
			"actividad"=> "curso"
		),
		"1052" => array(
			"destino"=> "C1020",
			"puntaje"=> "1",
			"actividad"=> "curso"
		),
		"1030" => array(
			"destino"=> "1002",
			"puntaje"=> "1",
			"actividad"=> "examen"
		),
		"1002" => array(
			"destino"=> "1025",
			"actividad"=> "grupo"
		),
		"1020" => array(
			"destino"=> "1001",
			"puntaje"=> "3",
			"actividad"=> "examen"
		),
		"C1020" => array(
			"destino"=> "1020",
			"actividad"=> "grupo"
		),
		"1022" => array(
			"destino"=> "1001",
			"puntaje"=> "1",
			"actividad"=> "curso"
		),
		"1001" => array(
			"destino"=> "1025",
			"actividad"=> "grupo"
		),
	)
);*/

$grafo = array(
	"nodes" => array(
		0 => array(
			"data" => array(
				"id" 		=> "C1020", 
				"name"		=> "Calculo 1",
				"tipo"		=> "curso",
				"semestre"	=> "1",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		1 => array(
			"data" => array(
				"id" 	=> "C1052", 
				"name"		=> "Calculo 1 (Anual)",
				"tipo"		=> "curso",
				"semestre"	=> "1",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		2 => array(
			"data" => array(
				"id" 	=> "C1022", 
				"name"		=> "GAL 1",
				"tipo"		=> "curso",
				"semestre"	=> "1",
				"creditos"	=> "9",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		3 => array(
			"data" => array(
				"id" 	=> "C1022", 
				"name"		=> "Calculo 2",
				"tipo"		=> "curso",
				"semestre"	=> "2",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		4 => array(
			"data" => array(
				"id" 	=> "C1025", 
				"name"		=> "PyE",
				"tipo"		=> "curso",
				"semestre"	=> "2",
				"creditos"	=> "10",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		5 => array(
			"data" => array(
				"id" 	=> "GC1200", 
				"name"		=> "Calculo 1",
				"tipo"		=> "grupo",
				"min"		=> "1",
				"maximo"	=> "1"
			),
		),
		6 => array(
			"data" => array(
				"id" 	=> "G1002", 
				"name"		=> "Algebra y geometría",
				"tipo"		=> "grupo",
				"min"		=> "1",
				"maximo"	=> "1"
			),
		),
		7 => array(
			"data" => array(
				"id" 	=> "G1001", 
				"name"		=> "Calculo y Análisis",
				"tipo"		=> "grupo",
				"min"		=> "4",
				"maximo"	=> "6"
			),
		),
	),
	
	"edges"	=> array(
		0 => array(
			"data" => array(
				"source" 	=> "C1020", 
				"target"	=> "GC1020",
				"puntaje"=> "1",
				"actividad"=> "curso"
			),
		),
		1 => array(
			"data" => array(
				"source" 	=> "C1052", 
				"target"	=> "GC1020",
				"puntaje"=> "1",
				"actividad"=> "curso"
			),
		),
	)
);

/*
$json = '{
    "nodes": [
      { "data": { "id": "j", "name": "Jerry" } },
      { "data": { "id": "e", "name": "Elaine" } },
      { "data": { "id": "k", "name": "Kramer" } },
      { "data": { "id": "g", "name": "George" } }
    ],
    "edges": [
      { "data": { "source": "j", "target": "e" } },
      { "data": { "source": "j", "target": "k" } },
      { "data": { "source": "j", "target": "g" } },
      { "data": { "source": "e", "target": "j" } },
      { "data": { "source": "e", "target": "k" } },
      { "data": { "source": "k", "target": "j" } },
      { "data": { "source": "k", "target": "e" } },
      { "data": { "source": "k", "target": "g" } },
      { "data": { "source": "g", "target": "j" } }
    ]
  }';*/
// $jsn = json_decode($grafo);
 //var_dump($jsn);
$grafo_json = json_encode($grafo);
var_dump ($grafo_json);
?>