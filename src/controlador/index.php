<?php
require_once("modelo/index.php");
class modeloController{
    private $model;
    public function __construct(){
        $this->model = new Modelo();
    }
    // mostrar
    static function index(){
        require_once("vista/login.php");
    }
    //nuevo
    static function nuevo(){        
        require_once("vista/nuevo.php");
    }
    //guardar
    static function guardar(){
        $nombre= $_REQUEST['nombre'];
        $precio= $_REQUEST['precio'];
        $data = "'".$nombre."',".$precio;
        $producto = new Modelo();
        $dato = $producto->insertar("productos",$data);
        header("location:".urlsite);
    }



    //editar
    static function editar(){    
        $id = $_REQUEST['id'];
        $producto = new Modelo();
        $dato = $producto->mostrar("productos","id=".$id);        
        require_once("vista/editar.php");
    }
    //actualizar
    static function actualizar(){
        $id = $_REQUEST['id'];
        $nombre= $_REQUEST['nombre'];
        $precio= $_REQUEST['precio'];
        $data = "nombre='".$nombre."',precio=".$precio;
        $producto = new Modelo();
        $dato = $producto->actualizar("productos",$data,"id=".$id);
        header("location:".urlsite);
    }


    //eliminar
    static function eliminar(){    
        $id = $_REQUEST['id'];
        $producto = new Modelo();
        $dato = $producto->eliminar("productos","id=".$id);
        header("location:".urlsite);
    }

    static function login() {
        $username=$_REQUEST['username'];
        $password=$_REQUEST['password'];
        $objeto = new Modelo();
        $datos=$objeto->mostrar("usuarios","username='$username' AND contraseña='$password'");
        // var_dump($dato);
        $n=count($datos);

        if ($n==1) {
            $datos=$datos[0];
            require_once("vista/dashboard.php");
            

            
        } else {
            $mensaje="MAL";
            require_once("vista/login.php");

            
        }

    }

    static function tabla($tabla){
        $objeto = new Modelo();
        $encabezados= $objeto->obtenerEncabezados($tabla);
        $filas= $objeto->mostrarTodos($tabla);

        return [$encabezados, $filas];
    }

    

}