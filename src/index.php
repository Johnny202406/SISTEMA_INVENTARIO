<?php
require_once("config.php");
require_once("controlador/index.php");
if(isset($_REQUEST['peticion'])):    
    if(method_exists("modeloController",$_REQUEST['peticion'])):
        modeloController::{$_REQUEST['peticion']}();
    endif;
else:
    modeloController::index();
endif;

?>
