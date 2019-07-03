<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_dependencias extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_dependencias','md');
        //$this->load->library('Class_options');
        //$this->load->model('M_seguridad','ms');
    }

    //Muestra la vista principal
    public function index()
    {
        $data['consulta'] = $this->md->mostrar_dependencias();
    	$this->load->view('dependencias/principal',$data);
    }

    //Muestra la pagina para agregar fuentes de financiamiento
    public function create(){
        $this->load->view('dependencias/contenido_agregar');
    }

    //Muestra la pagina con la tabla de contenido
    public function return(){

        $data['consulta'] = $this->md->mostrar_dependencias();
        $this->load->view('dependencias/contenido_tabla',$data);
    }

    //Funcion para insertar
    public function insert(){

        if(isset($_POST['dependencia']) && isset($_POST['nombrecorto'])){

            $data = array();

            $data['vDependencia'] = $_POST['dependencia'];
            $data['vNombreCorto'] = $_POST['nombrecorto'];
            $data['iActivo']= 1;

            $resultado = $this->md->guardar_dependencia($data);

            echo $resultado;
            
        }else{
            //Mensaje en caso de que no reciba el POST
            echo "Falla algo";
        }
    }

    //Muestra la pantalla de edicion para el update
    public function edit(){

        if(isset($_POST['id'])){

            $id = $_POST['id'];

            $data['consulta'] = $this->md->preparar_update($id);      
            $this->load->view('dependencias/contenido_modificar',$data);

        }else{
            echo "No recibe la variable";
        }
        
    }

    //Funcion para modificar
    public function update(){

        if(isset($_POST['id']) && isset($_POST['dependencia']) && isset($_POST['nombrecorto'])){

            $data = array();

            $id = $_POST['id'];
             $data['vDependencia'] = $_POST['dependencia'];
            $data['vNombreCorto'] = $_POST['nombrecorto'];
            $data['iActivo']= 1;

            $resultado = $this->md->modificar_dependencia($id,$data);

            echo $resultado;

        }else{
            //Mensaje en caso de que no reciba el POST
            echo "Falla algo";
        }
    }

    //Funcion para eliminar
    public function delete(){

        if(isset($_POST['id'])){

            $id = $_POST['id'];

            $resultado = $this->md->eliminar_dependencia($id);

            echo $resultado;

        }else{
            echo "algo salio mal";
        }
    }
}
?>