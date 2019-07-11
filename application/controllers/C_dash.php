<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_dash extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(!isset($_SESSION)) 
        { 
            session_start(); 
        }
        $this->load->helper('url');
        $this->load->model('M_dash');
        $this->load->library('session');
        //$this->load->model('M_seguridad','ms');
    }

    

    public function index()
    {   
        $datos['ejes1'] = $this->M_dash->ejes1();
        $datos['ejes2'] = $this->M_dash->ejes2();
        $datos['ejes3'] = $this->M_dash->ejes3();
        $datos['ejes4'] = $this->M_dash->ejes4();
        $datos['ejes5'] = $this->M_dash->ejes5();
        $datos['ejes6'] = $this->M_dash->ejes6();
        $datos['ejes7'] = $this->M_dash->ejes7();
        $datos['ejes8'] = $this->M_dash->ejes8();
        $datos['ejes9'] = $this->M_dash->ejes9();
        $datos['ejes'] = $this->M_dash->ejes();
        $this->load->view('dash/dashboard', $datos);
    }

    public function despliegue(){
        if($_REQUEST['id']){
            if($_REQUEST['an']){
                $id = $_REQUEST['id'];
                $an = $_REQUEST['an'];
                $this->session->set_userdata('anio', $an);
                $datos['dependencias'] = $this->M_dash->dependencias($id);
                $datos['temas'] = $this->M_dash->temas($id);
                $datos['actividades'] = $this->M_dash->actividades($id,$an);
                $this->load->view('dash/desp', $datos);
            }
        }
    }
    
    public function desplieguetabla(){
        if($_REQUEST['id']){
            $an = $this->session->userdata('anio');
            $id = $_REQUEST['id'];
            $datos['actividades2'] = $this->M_dash->actividades2($id, $an);
            $this->load->view('dash/tablaactividades', $datos);
        }
    }
}
