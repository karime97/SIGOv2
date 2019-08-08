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
        $this->db->select('iIdDependencia AS id , vDependencia AS valor');
		$this->db->from('Dependencia');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar dependencias con eje
	public function dependencias_nombre_largo($where=''){

        $this->db->select('d.iIdDependencia AS id , d.vDependencia AS valor');
		$this->db->from('Dependencia  d');
		$this->db->join('DependenciaEje de','de.iIdDependencia = d.iIdDependencia','LEFT OUTER');
		$this->db->order_by('d.vDependencia', 'asc');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar estatus
	public function estatus($where=''){

		$this->db->select('e.iIdEstatus AS id , e.vEstatus AS valor');
		$this->db->from('Estatus e');
		$this->db->where('e.iActivo',1);
		$this->db->order_by('e.iIdEstatus', 'asc');

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
	public function financiamiento($where=''){

		$this->db->order_by('vFinanciamiento', 'asc');
        $this->db->select('iIdFinanciamiento AS id , vFinanciamiento AS valor');
		$this->db->from('Financiamiento');	

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar eje
	public function eje($where=''){

		$this->db->order_by('iIdEje', 'asc');
        $this->db->select('iIdEje AS id , vEje AS valor');
		$this->db->from('PED2019Eje');	

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar periodicidad
	public function periodicidad($where=''){

		$this->db->select('iIdPeriodicidad AS id, vPeriodicidad AS valor ');
		$this->db->from('Periodicidad');
		$this->db->where('iActivo',1);
		$this->db->order_by('vPeriodicidad');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar unidades de medida
	public function unidades_medida($where=''){

		$this->db->select('iIdUnidadMedida AS id, vUnidadMedida AS valor ');
		$this->db->from('UnidadMedida');
		$this->db->where('iActivo',1);
		$this->db->order_by('vUnidadMedida');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar sujeto afectado
	public function sujeto_afectado($where=''){

		$this->db->select('iIdSujetoAfectado AS id, vSujetoAfectado AS valor ');
		$this->db->from('SujetoAfectado');
		$this->db->where('iActivo',1);
		$this->db->order_by('vSujetoAfectado');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar compromisos
	public function compromisos($where=''){

		$this->db->select('iIdCompromiso AS id, vCompromiso AS valor ');
		$this->db->from('Compromiso');
		$this->db->where('iActivo',1);
		$this->db->order_by('vCompromiso');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Mostrar componentes
	public function componentes($where=''){

		$this->db->select('iIdComponente AS id, vComponente AS valor ');
		$this->db->from('Componente');
		$this->db->where('iActivo',1);
		$this->db->order_by('vComponente');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Muestra los componentes dependiendo el compromiso seleccionado
	public function componentes_compromiso($where=''){

		$this->db->select('c.iIdComponente AS id, c.vComponente AS valor ');
		$this->db->from('Componente c');
		$this->db->join('Compromiso cp','c.iIdCompromiso = cp.iIdCompromiso','INNER');
		$this->db->where('c.iActivo',1);
		$this->db->where('cp.iActivo',1);
		$this->db->order_by('c.vComponente');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	//Muestra los temas
	public function tema($where=''){

		$this->db->select('iIdTema AS id, vTema AS valor ');
		$this->db->from('PED2019Tema');
		// $this->db->where('iActivo',1);
		$this->db->order_by('vTema');

		if($where != '') $this->db->where($where);

		return $this->db->get();
	}

	
}

?>