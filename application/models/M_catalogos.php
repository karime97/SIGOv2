<?php
class M_catalogos extends CI_Model {


	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default',TRUE);
	}

	//Mostrar Dependencias
	public function dependencias($where=''){
		$this->db->order_by('vNombreCorto', 'asc');
        $this->db->select('iIdDependencia AS id , vNombreCorto AS valor');
		$this->db->from('Dependencia');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar Roles
	public function roles($where=''){
		$this->db->order_by('vRol', 'asc');
        $this->db->select('iIdRol AS id , vRol AS valor');
		$this->db->from('Rol');

		if($where != '') $this->db->where($where);

		return $this->db->get();

	}

	//Mostrar maximo nivel academico
	public function maximo_nivel_academico($where=''){

		$this->db->order_by('iIdMaxNivelAcademico', 'asc');
        $this->db->select('iIdMaxNivelAcademico AS id , vNivelAcademico AS valor');
		$this->db->from('MaxNivelAcademico');

		if($where != '') $this->db->where($where);

		return $this->db->get();
		
	}

	//Mostrar formacion academica
	public function formacion_academica($where=''){

		$this->db->order_by('vFormacionAcademica', 'asc');
        $this->db->select('iIdFormacionAcademica AS id , vFormacionAcademica AS valor');
		$this->db->from('FormacionAcademica');

		if($where != '') $this->db->where($where);

		return $this->db->get();
		
	}

	//Mostrar Tipo de UBP
	public function tipo_ubps($where=''){
		$this->db->order_by('vTipoUbp', 'asc');
        $this->db->select('iIdTipoUbp AS id , vTipoUbp AS valor');
		$this->db->from('TipoUBP');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar Programa Presupuestario
	public function programa_presupuestario($where=''){
		$this->db->order_by('vProgramaPresupuestario', 'asc');
        $this->db->select('iIdProgramaPresupuestario AS id , vProgramaPresupuestario AS valor');
		$this->db->from('ProgramaPresupuestario');	

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar UBP
	public function ubps($where=''){
		$this->db->order_by('vUBP', 'asc');
        $this->db->select('iIdUbp AS id , vUBP AS valor');
		$this->db->from('UBP');	

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar financiamiento
	public function financiamientos($where=''){
		$this->db->order_by('vFinanciamiento', 'asc');
        $this->db->select('iIdFinanciamiento AS id , vFinanciamiento AS valor');
		$this->db->from('Financiamiento');	

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function entidades($where='')
	{
		$this->db->select('id_entidad AS id, entidad AS valor ');
		$this->db->from('entidades');
		$this->db->where('activo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function municipios($where='')
	{
		$this->db->select('id_municipio AS id, municipio AS valor ');
		$this->db->from('municipios');
		$this->db->where('activo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function localidades($where='')
	{
		$this->db->select('id_localidad AS id, localidad AS valor ');
		$this->db->from('localidades');
		$this->db->where('activo',1);
		$this->db->order_by('localidad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function codigos_postales($where='')
	{
		$this->db->select('codigo_postal AS id, codigo_postal AS valor ');
		$this->db->from('asentamientos');
		$this->db->where('activo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function zonas($where='')
	{
		$this->db->select('id_zona AS id, zona AS valor ');
		$this->db->from('zonas');
		$this->db->where('activo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function tipos_propiedad($where='')
	{
		$this->db->select('id_tipo_propiedad AS id, tipo_propiedad AS valor ');
		$this->db->from('tipos_propiedad');
		$this->db->where('activo',1);
		$this->db->order_by('tipo_propiedad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function tipos_operacion($where='')
	{
		$this->db->select('id_tipo_operacion AS id, tipo_operacion AS valor ');
		$this->db->from('tipos_operacion');
		$this->db->where('activo',1);
		$this->db->order_by('tipo_operacion');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function asentamientos($where='')
	{
		$this->db->select('id_asentamiento AS id, asentamiento AS valor ');
		$this->db->from('asentamientos');
		$this->db->where('activo',1);
		$this->db->order_by('asentamiento');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function recamaras($where='')
	{
		$this->db->select('recamaras AS id, recamaras AS valor ');
		$this->db->from('propiedades');		
		$this->db->where('activo',1);
		$this->db->where('recamaras >',0);
		$this->db->group_by('recamaras');
		$this->db->order_by('recamaras','ASC');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function banios($where='')
	{
		$this->db->select('banios AS id, banios AS valor ');
		$this->db->from('propiedades');		
		$this->db->where('activo',1);
		$this->db->where('banios >',0);
		$this->db->group_by('banios');
		$this->db->order_by('banios','ASC');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function garage_autos($where='')
	{
		$this->db->select('garage_autos AS id, garage_autos AS valor ');
		$this->db->from('propiedades');		
		$this->db->where('activo',1);
		$this->db->where('garage_autos >',0);
		$this->db->group_by('garage_autos');
		$this->db->order_by('garage_autos','ASC');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function entidades_propiedades($where='')
	{
		$this->db->select('e.id_entidad AS id, e.entidad AS valor ');
		$this->db->from('propiedades p');
		$this->db->join('asentamientos a','a.id_asentamiento = p.id_asentamiento','INNER');
		$this->db->join('localidades l','l.id_localidad = a.id_localidad','INNER');
		$this->db->join('municipios m','m.id_municipio = l.id_municipio','INNER');
		$this->db->join('entidades e','e.id_entidad = m.id_entidad','INNER');
		$this->db->where('p.activo',1);
		$this->db->group_by('e.id_entidad');
		$this->db->order_by('e.entidad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function municipios_propiedades($where='')
	{
		$this->db->select('m.id_municipio AS id, m.municipio AS valor ');
		$this->db->from('propiedades p');
		$this->db->join('asentamientos a','a.id_asentamiento = p.id_asentamiento','INNER');
		$this->db->join('localidades l','l.id_localidad = a.id_localidad','INNER');
		$this->db->join('municipios m','m.id_municipio = l.id_municipio','INNER');
		$this->db->join('entidades e','e.id_entidad = m.id_entidad','INNER');
		$this->db->where('p.activo',1);
		$this->db->group_by('m.id_municipio');
		$this->db->order_by('m.municipio');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function localidades_propiedades($where='')
	{
		$this->db->select('l.id_localidad AS id, l.localidad AS valor ');
		$this->db->from('propiedades p');
		$this->db->join('asentamientos a','a.id_asentamiento = p.id_asentamiento','INNER');
		$this->db->join('localidades l','l.id_localidad = a.id_localidad','INNER');
		$this->db->join('municipios m','m.id_municipio = l.id_municipio','INNER');
		$this->db->join('entidades e','e.id_entidad = m.id_entidad','INNER');
		$this->db->where('p.activo',1);
		$this->db->group_by('l.id_localidad');
		$this->db->order_by('l.localidad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	public function periodicidad($where='')
	{
		$this->db->select('id_periodicidad AS id, periodicidad AS valor ');
		$this->db->from('periodicidad');
		$this->db->where('activo',1);
		$this->db->order_by('periodicidad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}
}

?>