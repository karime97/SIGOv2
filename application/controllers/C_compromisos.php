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
            $datos['tabla_compromisos']=$this->tabla_compromisos(''); 
            $this->load->view('compromisos/index',$datos);
        
    
  		}
  		else 
  		{
  			echo '<p>Acceso denegado</p>';
  		}

      }
      public function listartablacompromiso(){

          if(isset($_POST['palabra'])){
            $datos['tabla_compromisos']=$this->tabla_compromisos($_POST);
          }else{
            $datos['tabla_compromisos']=$this->tabla_compromisos('');
          }
        $this->load->view('compromisos/tabla',$datos);
      }
    public function tabla_compromisos($where)
    {
        $compromisos = $this->comp->buscar_compromisos($where);
        //  return $compromisos->result();
        
         $html = '';

        if($compromisos->num_rows() > 0)
        {
            $html='
            <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">';

                $html.= '<table class="table table-striped table-bordered display" style="width:100%" id="grid">
                  <thead>
                        <tr>
                            <th>Estatus</th>
                            <th>#</th>
                            <th>Compromiso</th>
                            <th>Responsable</th>
                            <th>% Avance</th>
                            <th>Última <br> actualización</th>
                            <th width="200px;">Opciones</th>
                        </tr>
            </thead>
            <tbody>';

            $compromisos = $compromisos->result();
            foreach ($compromisos as $c)
            {
                $html.= '<tr>
                            <td>'.$c->vEstatus.'</td>
                            <td>'.$c->iNumero.'</td>
                            <td>'.$c->vCompromiso.'</td>
                            <td>'.$c->vDependencia.'</td>
                            <td>'.$c->dPorcentajeAvance.'</td>
                            <td>'.$c->dUltimaAct.'</td>
                            <td width="200px;"></td>
                        </tr>';
            }
            // '.$opciones.'

            $html.= ' </tbody></table>
            </div>
            </div>
        </div>
    </div>';
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
        $iIdDependencia=$this->input->post("iIdDependencia");
        $vFeNotarial=$this->input->post("vFeNotarial");
        $vNombreCorto=$this->input->post("vNombreCorto");
        $fecha = date("Y-m-d H:i:s");
        $vDescripcion=$this->input->post("vDescripcion");
        $iUltUsuarioAct= $_SESSION[PREFIJO.'_idusuario'];
        $iIdTema=$this->input->post("iIdTema");
        $vObservaciones=$this->input->post("vObservaciones");
        $data=array(
            "vCompromiso"=>$vCompromiso,
            "iNumero" =>$iNumero,
            "iRevisado" =>$iRevisado,
            "dPorcentajeAvance" =>0,
            "iIdDependencia" =>$iIdDependencia,
            "vFeNotarial" =>"*",
            "vNombreCorto" =>$vNombreCorto,
            "dUltimaAct" =>$fecha,
            "vDescripcion" =>$vDescripcion,
            "iUltUsuarioAct" =>NULL,
            "iUltUsuarioRev" =>NULL,
            "iIdTema" =>$iIdTema,
            "vAntes" =>"*",
            "vDespues" =>"*",
            "iActivo"=>1,
            "vObservaciones"=>base64_encode($vObservaciones)
        );
        $idCompromiso=$this->comp->insertarCompromiso($data);
        $this->agregar_CompromisoCorresponsable($idCompromiso);
    }
    public function agregar_CompromisoCorresponsable($id)
	{
        $iIdDependenciaCble = $this->input->post('iIdDependenciaCble');
        // linea para convertir el string separado por comas en array
        $dependenciascble=explode (",",  $iIdDependenciaCble);  

		for ($i = 0; $i < count($dependenciascble); $i++) {
			$datos=array(
			'iIdCompromiso' =>$id,
			'iIdDependencia' =>$dependenciascble[$i]
			);
			$this->comp->agregar_CompromisoCorresponsable($datos);
		
		}
		echo "correcto";	
	}
    public function listarpp(){
        $ideje=$this->input->post("iIdEje");
         $data= $this->comp->listarpp($ideje);
         echo json_encode($data);
    }
}
?>