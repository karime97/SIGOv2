<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_reporte extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_dash');
        //$this->load->model('M_seguridad','ms');
    }

    public function index(){
        $this->load->view('reporte/actividad');
    }
}