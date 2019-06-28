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

    public function modificar($id){
        $data1['tUBP'] = $this->mu->mostrar_Tubps();
        $data1['Dep'] = $this->mu->mostrar_dependencia();
        $data1['PP'] = $this->mu->mostrar_PP();
        //$this->load->view('UBPs/editar_ubp', $data1);
    }

    public function edit(){
        if(isset($_POST['id'])){
            $id = $_POST['id'];

            $data2['consulta'] = $this->mu->preparar_update($id);
            $data2['tUBP'] = $this->mu->mostrar_Tubps();
            $data2['Dep'] = $this->mu->mostrar_dependencia();
            $data2['PP'] = $this->mu->mostrar_PP();
            $this->load->view('UBPs/editar_ubp', $data2);
        }
    }

    public function regresar(){
        $data['consulta'] = $this->mu->mostrar_ubps();
    	$this->load->view('UBPs/vTabla', $data);
    }

    public function insertar(){
        
        if(isset($_POST['Cubp']) && isset($_POST['NombUbp']) && isset($_POST['annio']) && isset($_POST['TipoUBP']) && isset($_POST['Depen']) && isset($_POST['ProgP'])){
            $data = array(
                'vClave'=>$this->input->post('Cubp'),
                'vUBP'=>$this->input->post('NombUbp'),
                'iAnio'=>$this->input->post('annio'),
                'iIdTipoUbp'=>$this->input->post('TipoUBP'),
                'iIdDependencia'=>$this->input->post('Depen'),
                'iIdProgramaPresupuestario'=>$this->input->post('ProgP')
            );
            
            $resultado = $this->mu->insertarUBP($data);
            echo $resultado;

         
        }else{
            echo "Algo salió mal";
        }
    }

    public function actualizar(){
        if(isset($_POST['id']) && isset($_POST['Cubp']) && isset($_POST['NombUbp']) && isset($_POST['annio']) && isset($_POST['TipoUBP']) && isset($_POST['Depen']) && isset($_POST['ProgP'])){    
            
            $id = $_POST['id'];

            $data = array(
                'vClave'=>$this->input->post('Cubp'),
                'vUBP'=>$this->input->post('NombUbp'),
                'iAnio'=>$this->input->post('annio'),
                'iIdTipoUbp'=>$this->input->post('TipoUBP'),
                'iIdDependencia'=>$this->input->post('Depen'),
                'iIdProgramaPresupuestario'=>$this->input->post('ProgP')
            );

            $resul = $this->mu->modificarUBP($id, $data);
            echo $resul;
        }else {
            echo "No funcionó";
        }
    }
}