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

	/* Mostrar Objetivo */
	public function mostrarObjetivo($popu = null){
		$this->db->order_by('vObjetivo', 'asc');
        $this->db->select();
		$this->db->from('PED2019Objetivo');

		if($popu != null){
			$this->db->where('iIdTema', $popu);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar Estrategia */
	public function mostrarEstrategia($obj = null){
		$this->db->order_by('vEstrategia', 'asc');
        $this->db->select();
		$this->db->from('PED2019Estrategia');

		if($obj != null){
			$this->db->where('iIdObjetivo', $obj);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar linea de Accion */
	public function mostrarLineaAccion($est = null){
		$this->db->order_by('vLineaAccion', 'asc');
        $this->db->select();
		$this->db->from('PED2019LineaAccion');

		if($est != null){
			$this->db->where('iIdEstrategia', $est);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar Financiamiento */
	public function mostrarFinanciamiento(){
		$this->db->order_by('vFinanciamiento', 'asc');
        $this->db->select();
		$this->db->from('Financiamiento');

		$query = $this->db->get();
		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar UBP */
	public function mostrarUbp(){
		$this->db->distinct();
		$this->db->order_by('vUBP', 'asc');
        $this->db->select();
		$this->db->from('UBP');

		$query = $this->db->get();
		$resultado = $query->result();
		return $resultado;
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

	public function agregarActLineaAcc($LinAcc)
	{
		$this->db->insert('ActividadLineaAccion', $LinAcc);
		return $this->db->insert_id();
	}

	public function agregarActFinanciamiento($fin)
	{
		$this->db->insert('DetalleActividadFinanciamiento', $fin);
		return $this->db->insert_id();
	}

	public function agregarActUBP($UBP)
	{
		$this->db->insert('DetalleActividadUBP', $UBP);
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

	public function modificarDetaAct($data1, $id){
		$this->db->where('iIdDetalleActividad', $id);

		return $this->db->update('DetalleActividad', $data1);
	}

	public function modificarAct($data, $idActividad){
		$this->db->where('iIdActividad', $idActividad);

		$query  = $this->db->update('Actividad', $data);
		$_SESSION['sql'] = $this->db->last_query();

		return $query;
	}

	/* Consulta linea de accion (join) */
	public function getRecord($id){
        $this->db->select();
        $this->db->from('PED2019LineaAccion la');
		$this->db->where('iIdLineaAccion', $id);
		$this->db->join('PED2019Estrategia e','la.iIdEstrategia = e.iIdEstrategia','JOIN');
		$this->db->join('PED2019Objetivo o','e.iIdObjetivo = o.iIdObjetivo','JOIN');
		$this->db->join('PED2019Tema t','o.iIdTema = t.iIdTema','JOIN');
		$this->db->join('PED2019Eje ej','t.iIdEje = ej.iIdEje','JOIN');
        $query = $this->db->get();
        return $query->result();
	}
	
	/* Consulta financiamiento */
	public function getFinanciamiento($id){
        $this->db->select();
        $this->db->from('Financiamiento');
		$this->db->where('iIdFinanciamiento', $id);
        $query = $this->db->get();
        return $query->result();
	}
	
	/* Consulta UBP (join) */
	public function getUbpsPP($id){
        $this->db->select();
        $this->db->from('UBP u');
		$this->db->where('iIdUbp', $id);
		$this->db->join('ProgramaPresupuestario p','u.iIdProgramaPresupuestario = p.iIdProgramaPresupuestario','JOIN');
        $query = $this->db->get();
        return $query->result();
	}
}