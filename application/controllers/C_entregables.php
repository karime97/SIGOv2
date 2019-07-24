<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_entregables extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_entregables','me');
    }

    //Muestra la vista principal
    public function index()
    {
        $data['consulta'] = $this->me->mostrar_entregables();
    	$this->load->view('entregables/principal',$data);
    }
}