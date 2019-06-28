<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_ubps extends CI_Controller {
	public function __construct(){
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_ubps', 'mu');
    }

    public function index(){
        $data['consulta'] = $this->mu->mostrar_ubps();
    	$this->load->view('UBPs/inicio_ubp', $data);
    }

    public function agregar(){
        $data1['tUBP'] = $this->mu->mostrar_Tubps();
        $data1['Dep'] = $this->mu->mostrar_dependencia();
        $data1['PP'] = $this->mu->mostrar_PP();
        $this->load->view('UBPs/agregar_ubp', $data1);
        //echo '<pre>';
        //print_r($data1['tUBP']);
        //echo '</pre>';        
    }

    public function regresar(){
        $data['consulta'] = $this->mu->mostrar_ubps();
    	$this->load->view('UBPs/vTabla', $data);
    }

    public function insertar(){
        if(isset($_POST['NombUbp']) && isset($_POST['NombUbp']) && isset($_POST['annio']) && isset($_POST['TipoUBP']) && isset($_POST['Depen']) && isset($_POST['ProgP'])){
            $data = array(
                'vClave'=>$this->input->post('NombUbp'),
                'vUBP'=>$this->input->post('NombUbp'),
                'ianio'=>$this->input->post('annio'),
                'iIdTipoUbp'=>$this->input->post('TipoUBP'),
                'iIdDependencia'=>$this->input->post('Depen'),
                'iIdProgramaPresupuestario'=>$this->input->post('ProgP')
            );
            $resultado = $this->M_ubps->insertarUBP($data);

            echo $resultado;
        }        
    }
}