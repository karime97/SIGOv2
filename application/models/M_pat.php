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
		$this->db->from('DetalleActividad da');
		$this->db->join('Actividad a','da.iIdActividad = a.iIdActividad','JOIN');

		if (!empty($keyword) && $keyword != null){
			$this->db->where("(\"vActividad\" ilike '%$keyword%')");
		}
		if (!empty($year) && $year != null){
			$this->db->where('iAnio', $year);
		}

		$query =  $this->db->get();
		//$_SESSION['sql'] = $this->db->last_query();

		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar Ejes */
	public function mostrarEje(){
		$this->db->order_by('vEje', 'asc');
        $this->db->select();
		$this->db->from('PED2019Eje');

		$query = $this->db->get();
		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar Politica Publica */
	public function mostrarPpublica($eje = null){
		$this->db->order_by('vTema', 'asc');
        $this->db->select();
		$this->db->from('PED2019Tema');

		if($eje !=null){
			$this->db->where('iIdEje', $eje);
		}

		$query = $this->db->get();
		return $query->result();
		//return $resultado;
	}

	/* Guardar datos */

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

	/* Modificar datos */

	public function preparar_update($id){
        $this->db->select();
		$this->db->from('DetalleActividad da');
		$this->db->join('Actividad a','da.iIdActividad = a.iIdActividad','JOIN');
		$this->db->where('iIdDetalleActividad', $id);

		$query =  $this->db->get()->row();
        
        return $query;
	}

	public function modificarDetaAct($id, $data){
		$this->db->where('iIdDetalleActividad', $id);	   

		return $this->db->update('DetalleActividad', $data);
	}
}