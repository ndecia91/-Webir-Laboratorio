<?php

/*
*
* Conexion con la base de datos
*
*/

function conectar(){
	
	$DBServer = 'localhost';
	$DBUser   = 'root';
	$DBPass   = '';
	$DBName   = 'sistema_previas';

	$conexion = new mysqli($DBServer, $DBUser, $DBPass, $DBName);
	 
	// check connection
	if ($conexion->connect_error) {
	  trigger_error('Falló la conexion con la base de datos '  . $conexion->connect_error, E_USER_ERROR);
	  return null;
	}
	return $conexion;
}





?>