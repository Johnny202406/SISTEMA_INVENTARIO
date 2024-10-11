<?php
class Modelo{
    private $Modelo;
    private $db;    
    private $datos;    
    public function __construct(){
        $this->Modelo = array();
        $this->db = new PDO('mysql:host=localhost;dbname=sistema_inventario',"root","");
    }
    public function insertar($tabla, $data){
        $consulta="insert into ".$tabla." values(null,". $data .")";
        $resultado=$this->db->query($consulta);
        if ($resultado) {
            return true;
        }else {
            return false;
        }
     }

     public function mostrar($tabla, $condicion) {
        $consul = "SELECT * FROM " . $tabla . " WHERE " . $condicion . ";";
        $resu = $this->db->query($consul);
        
        // Obtener todos los resultados de una vez
        $this->datos = $resu->fetchAll(PDO::FETCH_BOTH);
        
        return $this->datos;
    }
    

    public function actualizar($tabla, $data, $condicion){       
        $consulta="update ".$tabla." set ". $data ." where ".$condicion;
        $resultado=$this->db->query($consulta);
        if ($resultado) {
            return true;
        }else {
            return false;
        }
    }
    public function eliminar($tabla, $condicion){
        $eli="delete from ".$tabla." where ".$condicion;
        $res=$this->db->query($eli);
        if ($res) {
            return true; 
        }else {
            return false;
        }
    }

    public function obtenerEncabezados($tabla) {
        $consul = "SELECT * FROM " . $tabla . " LIMIT 1"; // Limitamos a 1 fila
        $resu = $this->db->query($consul);
        $this->datos = $resu->fetchAll(PDO::FETCH_ASSOC);
        // Obtener los nombres de las columnas
        return array_keys($this->datos[0]); // Retorna las claves del primer resultado
    }

    public function mostrarTodos($tabla) {
        $consul = "SELECT * FROM " . $tabla . ";"; // Consulta sin condición
        $resu = $this->db->query($consul);
        
        // Obtener todos los resultados de una vez
        $this->datos = $resu->fetchAll(PDO::FETCH_ASSOC);
        
        return $this->datos; // Retorna los datos obtenidos
    }
    
    
}