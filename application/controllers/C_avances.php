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
        $id_detent = $this->input->post('id');

        $data['consulta'] = $this->ma->mostrar_actividadentregable($id_detent);
    	$this->load->view('avances/principal',$data);
    }

    //Funcion para insertar
    public function insert(){

        if(isset($_POST['mes_corte']) && isset($_POST['avance']) && isset($_POST['monto']) && isset($_POST['beneficiario']) && isset($_POST['observaciones'])){

            $data['nAvance'] = $this->input->post('avance');
            $data['nAvance'] = $this->input->post('avance');

        }else{
            echo 'error';
        }
    }

    //Muestra la tabla de trimestres
    public function tabla_trimestres(){

        $html = '';

        return $html;
    }

}

?>