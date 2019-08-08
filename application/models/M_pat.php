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
		$this->db->join('Actividad a', 'da.iIdActividad = a.iIdActividad', 'JOIN');		
		$this->db->where('da.iActivo', 1);

		if (!empty($keyword) && $keyword != null) {
			$this->db->where("(\"vActividad\" ilike '%$keyword%')");
		}
		if (!empty($year) && $year != null) {
			$this->db->where('iAnio', $year);
		}

		$query =  $this->db->get();
		//$_SESSION['sql'] = $this->db->last_query();

		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar Ejes */
	public function mostrarEje()
	{
		$this->db->order_by('vEje', 'asc');
		$this->db->select();
		$this->db->from('PED2019Eje');

		$query = $this->db->get();
		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar Politica Publica */
	public function mostrarPpublica($eje = null)
	{
		$this->db->order_by('vTema', 'asc');
		$this->db->select();
		$this->db->from('PED2019Tema');

		if ($eje != null) {
			$this->db->where('iIdEje', $eje);
		}

		$query = $this->db->get();
		return $query->result();
		//return $resultado;
	}

	/* Mostrar Objetivo */
	public function mostrarObjetivo($popu = null)
	{
		$this->db->order_by('vObjetivo', 'asc');
		$this->db->select();
		$this->db->from('PED2019Objetivo');

		if ($popu != null) {
			$this->db->where('iIdTema', $popu);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar Estrategia */
	public function mostrarEstrategia($obj = null)
	{
		$this->db->order_by('vEstrategia', 'asc');
		$this->db->select();
		$this->db->from('PED2019Estrategia');

		if ($obj != null) {
			$this->db->where('iIdObjetivo', $obj);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar linea de Accion */
	public function mostrarLineaAccion($est = null)
	{
		$this->db->order_by('vLineaAccion', 'asc');
		$this->db->select();
		$this->db->from('PED2019LineaAccion');

		if ($est != null) {
			$this->db->where('iIdEstrategia', $est);
		}

		$query = $this->db->get();
		return $query->result();
	}

	/* Mostrar Financiamiento */
	public function mostrarFinanciamiento()
	{
		$this->db->order_by('vFinanciamiento', 'asc');
		$this->db->select();
		$this->db->from('Financiamiento');

		$query = $this->db->get();
		$resultado = $query->result();
		return $resultado;
	}

	/* Mostrar UBP */
	public function mostrarUbp()
	{
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
		return $this->db->insert();
	}

	public function agregarActFinanciamiento($fin)
	{
		$this->db->insert('DetalleActividadFinanciamiento', $fin);
		return $this->db->insert();
	}

	public function agregarActUBP($UBP)
	{
		$this->db->insert('DetalleActividadUBP', $UBP);
		return $this->db->insert();
	}

	/* Modificar datos */

	public function preparar_update($id)
	{
		$this->db->select();
		$this->db->from('DetalleActividad da');
		$this->db->join('Actividad a', 'da.iIdActividad = a.iIdActividad', 'JOIN');
		$this->db->where('iIdDetalleActividad', $id);

		$query =  $this->db->get()->row();

		return $query;
	}

	public function preparar_carrito($id)
	{
		$this->db->select();
		$this->db->from('ActividadLineaAccion al');
		$this->db->join('PED2019LineaAccion la', 'al.iIdLineaAccion = la.iIdLineaAccion', 'JOIN');
		$this->db->where('iIdActividad', $id);

		$query =  $this->db->get()->row();

		return $query;
	}

	public function getCarritoSelec($id)
	{
		$datosDA = $this->DAA($id);

		$this->db->select('la.*,al.*,e.*,o.*,t.*,ej.*,1 as "iActivo"');
		$this->db->from('ActividadLineaAccion al');
		$this->db->join('DetalleActividad da', 'al.iIdActividad = da.iIdActividad', 'JOIN');
		$this->db->join('PED2019LineaAccion la', 'al.iIdLineaAccion = la.iIdLineaAccion', 'JOIN');
		$this->db->join('PED2019Estrategia e', 'la.iIdEstrategia = e.iIdEstrategia', 'JOIN');
		$this->db->join('PED2019Objetivo o', 'e.iIdObjetivo = o.iIdObjetivo', 'JOIN');
		$this->db->join('PED2019Tema t', 'o.iIdTema = t.iIdTema', 'JOIN');
		$this->db->join('PED2019Eje ej', 't.iIdEje = ej.iIdEje', 'JOIN');
		$this->db->where('da.iIdActividad', $datosDA->iIdActividad);
		$query = $this->db->get();
		return $query->result();
	}

	public function getCarritoFinan($id)
	{
		$this->db->select('da.*,daf.*,1 as "iActivo"');
		$this->db->from('DetalleActividadFinanciamiento daf');
		$this->db->join('Financiamiento da', 'daf.iIdFinanciamiento = da.iIdFinanciamiento', 'JOIN');
		$this->db->where('daf.iIdDetalleActividad', $id);
		$query = $this->db->get();
		return $query->result();
	}

	public function getCarritoUbpP($id)
	{
		$this->db->select('da.*,dau.*,u.*,pp.*,1 as "iActivo"');
		$this->db->from('DetalleActividadUBP dau');
		$this->db->join('DetalleActividad da', 'dau.iIdDetalleActividad = da.iIdDetalleActividad', 'JOIN');
		$this->db->join('UBP u', 'dau.iIdUbp = u.iIdUbp', 'JOIN');
		$this->db->join('ProgramaPresupuestario pp', 'u.iIdProgramaPresupuestario = pp.iIdProgramaPresupuestario', 'JOIN');
		$this->db->where('dau.iIdDetalleActividad', $id);
		$query = $this->db->get();
		return $query->result();
	}

	public function modificarDetaAct($data1, $id)
	{
		$this->db->where('iIdDetalleActividad', $id);

		return $this->db->update('DetalleActividad', $data1);
	}

	public function modificarAct($data, $idActividad)
	{
		$this->db->where('iIdActividad', $idActividad);

		$query  = $this->db->update('Actividad', $data);
		$_SESSION['sql'] = $this->db->last_query();

		return $query;
	}

	/* Eliminar datos */

	public function eliminarActLineaAcc($idActividad)
	{
		$this->db->where('iIdActividad', $idActividad);
		if ($this->db->delete('ActividadLineaAccion')) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function eliminarActFinanciamiento($id)
	{
		$this->db->where('iIdDetalleActividad', $id);
		if ($this->db->delete('DetalleActividadFinanciamiento')) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	public function eliminarActUBP($id)
	{
		$this->db->where('iIdDetalleActividad', $id);
		if ($this->db->delete('DetalleActividadUBP')) {
			return TRUE;
		} else {
			return FALSE;
		}
	}	

    public function eliminarDetaActividad($id){
		$this->db->where('iIdDetalleActividad', $id);
		$data = array('iActivo' => 0);
		$this->db->update('DetalleActividad', $data);
		return $this->db->affected_rows();
	}

	/* Consulta linea de accion (join) */
	public function getRecord($id)
	{
		$this->db->select();
		$this->db->from('PED2019LineaAccion la');
		$this->db->where('iIdLineaAccion', $id);
		$this->db->join('PED2019Estrategia e', 'la.iIdEstrategia = e.iIdEstrategia', 'JOIN');
		$this->db->join('PED2019Objetivo o', 'e.iIdObjetivo = o.iIdObjetivo', 'JOIN');
		$this->db->join('PED2019Tema t', 'o.iIdTema = t.iIdTema', 'JOIN');
		$this->db->join('PED2019Eje ej', 't.iIdEje = ej.iIdEje', 'JOIN');
		$query = $this->db->get();
		return $query->result();
	}

	public function DAA($id){
		$this->db->select();
		$this->db->from('DetalleActividad da');
		$this->db->where('iIdDetalleActividad', $id);
		$query = $this->db->get()->row();
		return $query;
	}

	
	/* Consulta financiamiento */
	public function getFinanciamiento($id)
	{
		$this->db->select();
		$this->db->from('Financiamiento');
		$this->db->where('iIdFinanciamiento', $id);
		$query = $this->db->get();
		return $query->result();
	}

	/* Consulta UBP (join) */
	public function getUbpsPP($id)
	{
		$this->db->select();
		$this->db->from('UBP u');
		$this->db->where('iIdUbp', $id);
		$this->db->join('ProgramaPresupuestario p', 'u.iIdProgramaPresupuestario = p.iIdProgramaPresupuestario', 'JOIN');
		$query = $this->db->get();
		return $query->result();
	}
}
