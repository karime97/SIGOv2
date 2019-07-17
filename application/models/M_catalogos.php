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
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar Roles
	public function roles($where=''){
		$this->db->order_by('vRol', 'asc');
        $this->db->select('iIdRol AS id , vRol AS valor');
		$this->db->from('Rol');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();

	}

	//Mostrar maximo nivel academico
	public function maximo_nivel_academico($where=''){

		$this->db->order_by('iIdMaxNivelAcademico', 'asc');
        $this->db->select('iIdMaxNivelAcademico AS id , vNivelAcademico AS valor');
		$this->db->from('MaxNivelAcademico');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
		
	}

	//Mostrar formacion academica
	public function formacion_academica($where=''){

		$this->db->order_by('vFormacionAcademica', 'asc');
        $this->db->select('iIdFormacionAcademica AS id , vFormacionAcademica AS valor');
		$this->db->from('FormacionAcademica');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
		
	}

	//Mostrar Tipo de UBP
	public function tipo_ubps($where=''){
		$this->db->order_by('vTipoUbp', 'asc');
        $this->db->select('iIdTipoUbp AS id , vTipoUbp AS valor');
		$this->db->from('TipoUBP');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar Programa Presupuestario
	public function programa_presupuestario($where=''){
		$this->db->order_by('vProgramaPresupuestario', 'asc');
        $this->db->select('iIdProgramaPresupuestario AS id , vProgramaPresupuestario AS valor');
		$this->db->from('ProgramaPresupuestario');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar UBP
	public function ubps($where=''){
		$this->db->order_by('vUBP', 'asc');
        $this->db->select('iIdUbp AS id , vUBP AS valor');
		$this->db->from('UBP');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar financiamiento
	public function financiamiento($where=''){
		$this->db->order_by('vFinanciamiento', 'asc');
        $this->db->select('iIdFinanciamiento AS id , vFinanciamiento AS valor');
		$this->db->from('Financiamiento');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar eje
	public function eje($where=''){
		$this->db->order_by('iIdEje', 'asc');
        $this->db->select('iIdEje AS id , vEje AS valor');
		$this->db->from('PED2019Eje');
		$this->db->where('iActivo',1);

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//

}