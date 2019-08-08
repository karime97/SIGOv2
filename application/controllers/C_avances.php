<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_avances extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_avances','ma');
        //$this->load->library('Class_options');
        //$this->load->model('M_seguridad','ms');
    }

    //Muestra la vista principal
    public function index()
    {
        $data['consulta'] = $this->ma->mostrar_avances();
    	$this->load->view('avances/principal',$data);
    }
}

?>