<?php
class M_pat extends CI_Model
{

	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default', TRUE);
	}

	/* MOSTRAR DATOS */

	public function mostrar_act($keyword = null, $year = null)
	{
		$this->db->select();
		$this->db->from('Actividad');
		$this->db->where('iActivo', 1);

		/* if (!empty($keyword) && $keyword != null){
			$this->db->where("(\"vActividad\" ilike '%$keyword%')");
		}
		if (!empty($year) && $year != null){
			$this->db->where('iAnio', $year);
		} */

		$query =  $this->db->get();
		//$_SESSION['sql'] = $this->db->last_query();

		$resultado = $query->result();
		return $resultado;
	}

	public function agregarAct($data)
	{
		$this->db->insert('Actividad', $data);
		return $this->db->insert_id();
		
	}

	public function agregarDetAct($data)
	{
		$this->db->insert('DetalleActividad', $data);
		return $this->db->insert_id();
	}
}