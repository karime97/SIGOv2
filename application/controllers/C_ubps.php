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

    public function insertarUBP(){
		$data = array(
			'vClave'=>$this->input->post('claveUBP'),
			'vUBP'=>$this->input->post('nombUBP'),
			'iAnio'=>$this->input->post('anio'),
			'iIdTipoUbp'=>$this->input->post('nombUBP'),
			'iIdDependencia'=>$this->input->post('nombUBP'),
			'iIdProgramaPresupuestario'=>$this->input->post('nombUBP')
		);

		$this->db->insert('UBP', $data);
	}
}