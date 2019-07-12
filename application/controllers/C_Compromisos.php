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
        $data['actividad'] = $this->pat->mostrar_act();
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

        $data['actividad'] = $this->pat->mostrar_act($keyword, $year);
        $this->load->view('PAT/vTablaAct', $data);
    }

    public function edit()
    {
        $data2['eje'] = $this->pat->mostrarEje();        
        $this->load->view('PAT/editar_actividad', $data2);
    }

    public function dPoliPub(){
        $eje = 0;

        if (!empty($_POST['eje']) && $_POST['eje'] != '0') {
            $eje = $_POST['eje'];
        }
        echo $eje;
        $PolPub = $this->pat->mostrarPpublica($eje);
        $opc = '<option value="0">Seleccione...</option>';        
        foreach ($PolPub as $value) {
            $opc .= "<option value='$value->iIdTema'>$value->vTema</option>";
        }
        echo $opc;
    }

    public function insertarAct()
    {
        //$sesion = $_SESSION[PREFIJO.'_iddependencia'];
        if (isset($_POST['NombAct'])) {
            $data = array(
                'vActividad' => $this->input->post('NombAct'),
                'iIdDependencia' => (int) $_SESSION[PREFIJO . '_iddependencia']
            );

            $idAct = $this->pat->agregarAct($data);
            //$data1['iIdActividad'] = $this->pat->agregarAct($data);
            //$this->pat->agregarDetAct($data1);

            if ($idAct > 0) {
                $data1 = array(
                    'iIdActividad' => $idAct,
                    'iAnio' => $this->input->post('annio')
                );
                $insert = $this->pat->agregarDetAct($data1);

                echo $insert;
            }
        }
    }

    public function actualizarAct()
    {
        
    }
}
