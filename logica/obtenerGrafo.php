<?php
$grafo = array(
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
);
$grafo_json = json_encode($grafo);
echo ($grafo_json);
?>