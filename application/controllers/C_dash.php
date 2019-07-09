<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_dash extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_dash');
        //$this->load->model('M_seguridad','ms');
    }

    public function index()
    {
        $this->load->view('dash/dashboard');
    }

    public function despliegue(){
        if($_REQUEST['id']){
            $id = $_REQUEST['id'];
            $datos['dependencias'] = $this->M_dash->dependencias($id);
            $this->load->view('dash/desp', $datos);
        }
    }
}
