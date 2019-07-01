<?php defined('BASEPATH') OR exit('No direct script access allowed');

class C_unidadesmedida extends CI_Controller {
	public function __construct(){
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_unidadmedida', 'mum');
    }

    public function index(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/inicio_ubp', $data);
    }

    public function agregar(){
        $this->load->view('UnidadesDeMedidas/agregar_um');      
    }

    public function regresar(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/vTabla', $data);
    }
}