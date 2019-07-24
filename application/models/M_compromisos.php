<?php
class M_compromisos extends CI_Model {

	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	function buscar_compromisos($where='')
	{

		$this->db->select('c.iIdCompromiso, c.vCompromiso, c.iNumero, c.nPorcentajeAvance, c.dUltimaAct, e.vEstatus, d.vDependencia');
		$this->db->from('Compromiso c');
		$this->db->join('Estatus e','e.iIdEstatus = c.iEstatus');
		$this->db->join('PED2019Tema t','t.iIdTema = c.iIdTema');
		$this->db->join('PED2019Eje ej','ej.iIdEje = t.iIdEje');
		$this->db->join('Dependencia d','c.iIdDependencia = c.iIdDependencia');
		$this->db->where('c.iActivo',1);
		$this->db->order_by('c.iNumero');

		if($where != '') $this->db->where($where);
	}
}
?>