<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_financiamientos extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_financiamientos','mf');
        //$this->load->library('Class_options');
        //$this->load->model('M_seguridad','ms');
    }

    //Muestra la vista principal
    public function index()
    {
        $data['consulta'] = $this->mf->mostrar_financiamientos();      
        $this->load->view('financiamientos/principal',$data);
    }

    //Muestra la pagina para agregar fuentes de financiamiento
    public function create(){

        $this->load->view('financiamientos/contenido_agregar');
    }

    //Muestra la pagina con la tabla de contenido
    public function return(){

        $data['consulta'] = $this->mf->mostrar_financiamientos();
        $this->load->view('financiamientos/contenido_tabla',$data);
    }

    public function insert(){

        if(isset($_POST['clave']) && isset($_POST['anio']) && isset($_POST['financiamiento'])){

            $data = array();

            $data['iIdFinanciamiento'] = $this->mf->get_last_id() + 1;
            $data['vClave'] = $_POST['clave'];
            $data['vFinanciamiento'] = $_POST['financiamiento'];
            $data['iAnio'] = $_POST['anio'];
            $data['iActivo']= 1;

            $resultado = $this->mf->guardar_financiamiento($data);

            echo $resultado;
            
        }else{
            //Mensaje en caso de que no reciba el POST
            echo "Falla algo";
        }
    }
}
?>