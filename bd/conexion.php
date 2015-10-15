<?php

/*
*
* Conexion con la base de datos
*
*/

$DBServer = 'localhost';
$DBUser   = 'root';
$DBPass   = '';
$DBName   = 'sistema_previas';

$conn = new mysqli($DBServer, $DBUser, $DBPass, $DBName);
 
// check connection
if ($conn->connect_error) {
  trigger_error('Database connection failed: '  . $conn->connect_error, E_USER_ERROR);
  die();
}




?>