<?php
class M_dash extends CI_Model {

	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	public function dependencias($id){
		$datos = '';
		$datos = array();
		$this->db->select('Dependencia.iIdDependencia, Dependencia.vNombreCorto');
		$this->db->from('Dependencia');
		$this->db->join('DependenciaEje', 'Dependencia.iIdDependencia = DependenciaEje.iIdDependencia');
		$this->db->join('PED2019Eje', 'PED2019Eje.iIdEje = DependenciaEje.iIdEje');
		$this->db->where('PED2019Eje.iIdEje', $id);
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdDependencia'                       => $row->iIdDependencia,
           'vNombreCorto'                   => $row->vNombreCorto
         ];
     }
     return $datos;
	}
}