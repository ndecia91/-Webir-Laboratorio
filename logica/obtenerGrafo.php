<?php

$grafo = array(
	"nodes" => array(
		0 => array(
			"data" => array(
				"id" 		=> "C1020", 
				"name"		=> "Cálculo 1",
				"tipo"		=> "CURSO",
				"semestre"	=> "1",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		1 => array(
			"data" => array(
				"id" 	=> "C1052", 
				"name"		=> "Cálculo 1 (Anual)",
				"tipo"		=> "CURSO",
				"semestre"	=> "1",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "40,5"
			),
		),
		2 => array(
			"data" => array(
				"id" 	=> "C1030", 
				"name"		=> "Geometría y Algebra Lineal 1",
				"tipo"		=> "CURSO",
				"semestre"	=> "1",
				"creditos"	=> "9",
				"validez"	=> "20",
				"aprobacion"=> "50,5"
			),
		),
		3 => array(
			"data" => array(
				"id" 	=> "C1022", 
				"name"		=> "Cálculo 2",
				"tipo"		=> "CURSO",
				"semestre"	=> "2",
				"creditos"	=> "16",
				"validez"	=> "20",
				"aprobacion"=> "30,5"
			),
		),
		4 => array(
			"data" => array(
				"id" 	=> "C1025", 
				"name"		=> "Probabilidad y Estadística",
				"tipo"		=> "CURSO",
				"semestre"	=> "3",
				"creditos"	=> "10",
				"validez"	=> "20",
				"aprobacion"=> "40,4"
			),
		),
		5 => array(
			"data" => array(
				"id" 	=> "GC1020", 
				"name"		=> "Cálculo 1",
				"tipo"		=> "GRUPO",
				"min"		=> "1",
				"maximo"	=> "1"
			),
		),
		6 => array(
			"data" => array(
				"id" 	=> "G1002", 
				"name"		=> "Algebra y geometría",
				"tipo"		=> "GRUPO",
				"min"		=> "1",
				"maximo"	=> "1"
			),
		),
		7 => array(
			"data" => array(
				"id" 	=> "G1001", 
				"name"		=> "Calculos y Análisis",
				"tipo"		=> "GRUPO",
				"min"		=> "4",
				"maximo"	=> "6"
			),
		),
		8 => array(
			"data" => array(
				"id" 	=> "C1153", 
				"name"		=> "Física 3",
				"tipo"		=> "CURSO",
				"semestre"	=> "3",
				"creditos"	=> "10",
				"validez"	=> "20",
				"aprobacion"=> "60,4"
			),
		),
		9 => array(
			"data" => array(
				"id" 	=> "GFIS", 
				"name"		=> "FIS-FISICAS",
				"tipo"		=> "GRUPO",
				"min"		=> "2",
				"maximo"	=> "4"
			),
		),
		10 => array(
			"data" => array(
				"id" 	=> "C1151", 
				"name"		=> "Física 1",
				"tipo"		=> "CURSO",
				"semestre"	=> "1",
				"creditos"	=> "10",
				"validez"	=> "20",
				"aprobacion"=> "62,4"
			),
		),
		11 => array(
			"data" => array(
				"id" 	=> "C1152", 
				"name"		=> "Física 2",
				"tipo"		=> "CURSO",
				"semestre"	=> "2",
				"creditos"	=> "10",
				"validez"	=> "20",
				"aprobacion"=> "54,8"
			),
		),
	),
	
	"edges"	=> array(
		0 => array(
			"data" => array(
				"source" 	=> "C1020", 
				"target"	=> "GC1020",
				"puntaje"	=> "1",
				"actividad"	=> "CURSO"
			),
		),
		1 => array(
			"data" => array(
				"source" 	=> "C1052", 
				"target"	=> "GC1020",
				"puntaje"	=> "1",
				"actividad"	=> "CURSO"
			),
		),
		2 => array(
			"data" => array(
				"source" 	=> "C1030", 
				"target"	=> "G1002",
				"puntaje"	=> "1",
				"actividad"	=> "EXAMEN"
			),
		),
		3 => array(
			"data" => array(
				"source" 	=> "G1002", 
				"target"	=> "C1025",
				"actividad"	=> "GRUPO"
			),
		),
		4 => array(
			"data" => array(
				"source" 	=> "GC1020", 
				"target"	=> "C1022",
				"actividad"	=> "GRUPO"
			),
		),
		5 => array(
			"data" => array(
				"source" 	=> "C1022", 
				"target"	=> "G1001",
				"actividad"	=> "CURSO"
			),
		),
		6 => array(
			"data" => array(
				"source" 	=> "G1001", 
				"target"	=> "C1025",
				"actividad"	=> "GRUPO"
			),
		),
		7 => array(
			"data" => array(
				"source" 	=> "C1020", 
				"target"	=> "G1001",
				"puntaje"	=> "3",
				"actividad"	=> "CURSO"
			),
		),
		8 => array(
			"data" => array(
				"source" 	=> "GC1020", 
				"target"	=> "C1153",
				"actividad"	=> "GRUPO"
			),
		),
		9 => array(
			"data" => array(
				"source" 	=> "C1151", 
				"target"	=> "GFIS",
				"puntaje"	=> "1",
				"actividad"	=> "CURSO"
			),
		),
		10 => array(
			"data" => array(
				"source" 	=> "C1151", 
				"target"	=> "GFIS",
				"puntaje"	=> "2",
				"actividad"	=> "EXAMEN"
			),
		),
		11 => array(
			"data" => array(
				"source" 	=> "C1152", 
				"target"	=> "GFIS",
				"puntaje"	=> "1",
				"actividad"	=> "CURSO"
			),
		),
		12 => array(
			"data" => array(
				"source" 	=> "GFIS", 
				"target"	=> "C1153",
				"actividad"	=> "GRUPO"
			),
		),
		
		
		
	)
);

 $grafo_json = json_encode($grafo);
 echo $grafo_json;

?>