<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_dash extends CI_Controller {

    public function __construct()
    {
        parent::__construct();                
        $this->load->helper('url');
        $this->load->model('M_dash');
        $this->load->library('session');
        //$this->load->model('M_seguridad','ms');
    }

    

    public function index()
    {   
        $this->load->view('dash/dashboard');
    }

    public function datosdash(){
        if($_REQUEST['an']){
            $an = $_REQUEST['an'];
            $datos['ejes1'] = $this->M_dash->ejes1();
            $datos['aveje1'] = $this->M_dash->avacetotaleje(1,$an);
            $datos['ejes2'] = $this->M_dash->ejes2();
            $datos['aveje2'] = $this->M_dash->avacetotaleje(2,$an);
            $datos['ejes3'] = $this->M_dash->ejes3();
            $datos['aveje3'] = $this->M_dash->avacetotaleje(3,$an);
            $datos['ejes4'] = $this->M_dash->ejes4();
            $datos['aveje4'] = $this->M_dash->avacetotaleje(4,$an);
            $datos['ejes5'] = $this->M_dash->ejes5();
            $datos['aveje5'] = $this->M_dash->avacetotaleje(5,$an);
            $datos['ejes6'] = $this->M_dash->ejes6();
            $datos['aveje6'] = $this->M_dash->avacetotaleje(6,$an);
            $datos['ejes7'] = $this->M_dash->ejes7();
            $datos['aveje7'] = $this->M_dash->avacetotaleje(7,$an);
            $datos['ejes8'] = $this->M_dash->ejes8();
            $datos['aveje8'] = $this->M_dash->avacetotaleje(8,$an);
            $datos['ejes9'] = $this->M_dash->ejes9();
            $datos['aveje9'] = $this->M_dash->avacetotaleje(9,$an);
            $datos['ejes'] = $this->M_dash->ejes();
            $datos['avejes'] = $this->M_dash->avacetotalejes($an);

            $data = $this->M_dash->ejes();
                    $valores = array();
                    $rec = '';
                foreach($data as $dat){

                    $rec = $this->M_dash->avacetotaleje($dat['iIdEje'], $an);
                    array_push($valores, $rec);
                }
                $datos['avance'] = $valores;
            $this->load->view('dash/dashdatos', $datos);
        }
    }

    public function despliegue(){
        if($_REQUEST['id']){
            if($_REQUEST['an']){
                $id = $_REQUEST['id'];
                $an = $_REQUEST['an'];
                $this->session->set_userdata('anio', $an);
                $datos['dependencias'] = $this->M_dash->dependencias($id);
                $datos['av'] = $this->M_dash->avacetotaleje($id, $an);
                $datos['temas'] = $this->M_dash->temas($id);
                $datos['actividades'] = $this->M_dash->actividades($id,$an);
                $data = $this->M_dash->temas($id);
                    $valores = array();
                    $rec = '';
                foreach($data as $dat){

                    $rec = $this->M_dash->totaltemas($dat['iIdTema']);
                    array_push($valores, $rec);
                }
                $datos['avance'] = $valores;
                
                //print_r($datos['avance']);
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
