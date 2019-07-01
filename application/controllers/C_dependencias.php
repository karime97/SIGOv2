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

    public function index()
    {
        $data['consulta'] = $this->md->mostrar_dependencias();
    	$this->load->view('dependencias/principal',$data);
    }

    public function create(){
        $this->load->view('dependencias/contenido_agregar');
    }
}
?>