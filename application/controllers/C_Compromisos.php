<?php defined('BASEPATH') or exit('No direct script access allowed');

class C_Compromisos extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_pat', 'pat');
    }

    public function index()
    {
        $data['consulta'] = $this->pat->mostrar_act();
        $this->load->view('PAT/inicio_PAT', $data);
    }

    public function cargar()
    {
        $this->load->view('PAT/agregar_actividad');
    }

    public function gettable()
    {
        $year = $keyword = null;
        if (isset($_POST['keyword']) && !empty($_POST['keyword'])) {
            $keyword = $_POST['keyword'];
        }

        if (isset($_POST['year']) && !empty($_POST['year'])) {
            $year = $_POST['year'];
        }

        $data['consulta'] = $this->pat->mostrar_act($keyword, $year);
        $this->load->view('PAT/vTablaAct', $data);
    }

    public function edit()
    {
        $this->load->view('PAT/editar_actividad');
    }

    public function insertarAct()
    {
        if (isset($_POST['NombAct'])) {
            $data = array(
                'vActividad' => $this->input->post('NombAct')
            );

            $idAct = $this->pat->agregarAct($data);
            //$data1['iIdActividad'] = $this->pat->agregarAct($data);
            //$this->pat->agregarDetAct($data1);

            if ($idAct > 0) {
                $data1 = array(
                    'iIdActividad' => $this->input->post('idAct'),
                    'iAnio' => $this->input->post('annio')
                );
                echo $insert = $this->pat->agregarDetAct($data1);
            }
        }
    }

    
}
