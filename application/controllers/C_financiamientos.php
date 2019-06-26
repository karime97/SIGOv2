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

    public function index()
    {
        $data['consulta'] = $this->mf->mostrar_financiamientos();      
        $this->load->view('financiamientos/principal',$data);
    }
}
?>