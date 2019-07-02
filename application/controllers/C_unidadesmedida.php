<?php defined('BASEPATH') OR exit('No direct script access allowed');

class C_unidadesmedida extends CI_Controller {
	public function __construct(){
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_unidadesmedida', 'mum');
    }

    public function index(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/inicio_um', $data);
    }

    public function cargar(){
        $this->load->view('UnidadesDeMedidas/agregar_um');      
    }

    public function regresar(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/vTabla', $data);
    }

    public function insertar(){
        
        if(isset($_POST['NombUm'])){
            $data = array(
                'vUnidadMedida'=>$this->input->post('NombUm')
            );
            
            $resultado = $this->mum->insertarUM($data);
            echo $resultado;

         
        }else{
            echo "Algo salió mal";
        }
    }
}