<?php

include ('../persistencia/conexion.php');


function obtenerPreviasCreditos ($idCarrera){

	$previas_creditos = array();
	
	try {
	
		//Abro conexion
		$bd = conectar();
		//$fila = array();
		
		if($bd != null){
			$bd->autocommit(false);
			
			$bd->begin_transaction();
			
			$filas= $bd->query("SELECT * FROM previas_creditos WHERE idCarrera = '$idCarrera'");
				
			if($filas != false and $filas->num_rows != 0 ){
				while($fila = $filas->fetch_assoc()) {
										
					$idCurso = 'C' . $fila["idCurso"];
					$area = $fila["area"];
					$creditos = $fila["creditos"];
					
					$previas_creditos[$idCurso]["area"]= $area;
					$previas_creditos[$idCurso]["creditos"]= intval($creditos);
						
				}
			}
			
			echo json_encode($previas_creditos);
			
			//var_dump($previas_creditos);
			
			//Cierro conexion
			$bd->close();
		}
	} catch (Exception $e) {
		echo 'Excepcion capturada: ',  $e->getMessage(), "\n";
	}

}//end obtenerPreviasCreditos
 
obtenerPreviasCreditos('7200');
 
?>