<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class C_compromisos extends CI_Controller
{
	public function __construct()
    {
    	parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->library('Class_seguridad');
    	$this->load->model('M_compromisos','comp');
    }
  
  	public function index()
  	{
  		$seg = new Class_seguridad();
  		$tipo_acceso = $seg->tipo_acceso(25,$_SESSION[PREFIJO.'_idusuario']);

  		if($tipo_acceso > 0)
  		{
  			$this->load->view('compromisos/index');
  		}
  		else 
  		{
  			echo '<p>Acceso denegado</p>';
  		}

  	}
}
?>
