<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_usuarios extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_usuarios','mu');
        $this->load->library('Class_options');
        //$this->load->model('M_seguridad','ms');
    }

    //Muestra la vista principal
    public function index()
    {
        $data['consulta'] = $this->mu->mostrar_usuarios();    
    	$this->load->view('usuarios/principal',$data);
    }

     //Muestra la pagina para agregar usuarios
    public function create(){

        $lib = new Class_options();

        $data['dependencias'] = $lib->options_tabla('dependencias');
        $data['roles'] = $lib->options_tabla('roles');
        $data['formacion_academica'] = $lib->options_tabla('formacion_academica');
        $data['nivel_academico'] = $lib->options_tabla('maximo_nivel_academico');

        $this->load->view('usuarios/contenido_agregar',$data);
    }


}
?>