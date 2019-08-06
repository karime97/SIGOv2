<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class C_compromisos extends CI_Controller
{
	public function __construct()
    {
    	parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->helper('funciones');
        $this->load->library('Class_seguridad');
        $this->load->library('Class_options');
        $this->load->model('M_compromisos','comp');
        $this->load->model('M_catalogos', 'catlogs');
    }
  
  	public function index()
  	{
  		$seg = new Class_seguridad();
  		$tipo_acceso = $seg->tipo_acceso(25,$_SESSION[PREFIJO.'_idusuario']);

  		if($tipo_acceso > 0)
  		{
            $options = new Class_options();

            $datos['options_ejes']  = $options->options_tabla('eje');
            $where_dependencias['iIdEje'] = 0;
            $datos['options_dependencias']  = $options->options_tabla('dependencias_nombre_largo',0,$where_dependencias);
            $where_estatus['vEntidadMide'] = 'Avance compromiso';
            $datos['options_estatus']  = $options->options_tabla('estatus',0,$where_estatus);

              $this->load->view('compromisos/index',$datos);
            //   var_dump($this->listar_ejes());
        
    
  		}
  		else 
  		{
  			echo '<p>Acceso denegado</p>';
  		}

  	}
    public function tabla_compromisos($where)
    {
        $compromisos = $this->comp->buscar_compromisos($where);
        $html = '';

        if($compromisos->num_rows() > 0)
        {
            $html = '<table class="table">
                        <tr>
                            <th>Estatus</th>
                            <th>#</th>
                            <th>Compromiso</th>
                            <th>Responsable</th>
                            <th>% Avance</th>
                            <th>Última <br> actualización</th>
                            <th width="200px;">Opciones</th>
                        </tr>';

            $compromisos = $compromisos->result();
            foreach ($compromisos as $c)
            {
                $html.= '<tr>
                            <td>'.$c->vEstatus.'</td>
                            <td>'.$c->iNumero.'</td>
                            <td>'.$c->vCompromiso.'</td>
                            <td>'.$c->vDependencia.'</td>
                            <td>'.$c->nPorcentajeAvance.'</td>
                            <td>'.$c->dUltimaAct.'</td>
                            <td width="200px;">'.$opciones.'</td>
                        </tr>';
            }

            $html.= '</table>';
        }

        return $html;

    }

    public function buscar_compromisos()
    {
        if($_POST)
        {   
            $where = '';
            if($this->input->post('eje') > 0) $where['ej.iIdEje'] = $this->input->post('eje');
            if($this->input->post('dependencia') > 0) $where['c.iIdDependencia'] = $this->input->post('dependencia');
            if($this->input->post('estatus') > 0) $where['c.iEstatus'] = $this->input->post('estatus');
            //if($this->input->post('fecha') != '')
            //if($this->input->post('palabra') != '')
        }
    }

    public function cargar_options()
    {
        $valor = $this->input->post('valor');
        $listado = $this->input->post('listado');

        if($listado = 'responsables')
        {
            $options = new Class_options();

            $where_dependencias['iIdEje'] = $valor;
            echo  $options->options_tabla('dependencias_nombre_largo',0,$where_dependencias);
        }
    }
    public function create(){
        $options = new Class_options();

            $datos['options_ejes']  = $options->options_tabla('eje');
            $datos['politica_publica']  = $options->options_tabla('tema');
            $datos['dependencias']  = $options->options_tabla('dependencias');
            $datos['estatus']  = $options->options_tabla('estatus');
        $this->load->view('compromisos/contenido_agregar',$datos);
    }
    public function insertarCompromiso(){
        $vCompromiso=$this->input->post("vCompromiso");
        $iNumero=$this->input->post("iNumero");
        $iRevisado=$this->input->post("iRevisado");
        $dPorcentajeAvance=$this->input->post("dPorcentajeAvance");
        $iIdDependencia=$this->input->post("iIdDependencia");
        $vFeNotarial=$this->input->post("vFeNotarial");
        $iRevisado=$this->input->post("iRevisado");

        $data=array(
            'vCompromiso'=>$vCompromiso,
            'iNumero'=>$iNumero,
            'iRevisado'=>$iRevisado,
            'dPorcentajeAvance'=>$dPorcentajeAvance,
            'iIdDependencia' =>,
            'vFeNotarial'=>,
            'iRevisado'=>

        );

        
    }
}
?>
