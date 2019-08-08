<?php
class M_compromisos extends CI_Model {

	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	function buscar_compromisos($where='')
	{

		$this->db->select('c.iIdCompromiso, c.vCompromiso, c.iNumero, c.dPorcentajeAvance, c.dUltimaAct, e.vEstatus, d.vDependencia');
		$this->db->from('Compromiso c');
		$this->db->join('Estatus e','e.iIdEstatus = c.iRevisado');
		$this->db->join('PED2019Tema t','t.iIdTema = c.iIdTema');
		$this->db->join('PED2019Eje ej','ej.iIdEje = t.iIdEje');
		$this->db->join('Dependencia d','d.iIdDependencia = c.iIdDependencia');
		$this->db->where('c.iActivo',1);
		$this->db->order_by('c.iNumero');
		if($where != '') $this->db->where($where);
		$query =  $this->db->get();
        // $resultado = $query->result();
        return $query;
	}
	function listarpp($ideje){
		$this->db->select('pp.iIdTema as id, pp.vTema as tema');
		$this->db->from('PED2019Tema pp');
		if($ideje>0){
			$this->db->where('pp.iIdEje',$ideje);
		}
		$this->db->order_by('pp.vTema');
		$query = $this->db->get();
			
			foreach ($query->result() as $row) {
				$datos[] = [
				'iIdTema' =>$row->id,
				'vTema' => $row->tema
				];
			}
			return $datos;
	}
	function insertarCompromiso($data){
		$this->db->insert('Compromiso', $data);
		$insert_id = $this->db->insert_id();
		return  $insert_id;
	}
	function agregar_CompromisoCorresponsable($data){
		$this->db->insert('CompromisoCorresponsable', $data);
	}
}
?>