<?php
class M_ubps extends CI_Model {


	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	public function mostrar_ubps(){
        $this->db->select();
	    $this->db->from('UBP');			

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
	}

	public function preparar_update($id){
        $this->db->select();
		$this->db->from('UBP u');
		$this->db->join('Dependencia d','u.iIdDependencia = d.iIdDependencia','JOIN');
		$this->db->join('TipoUBP t','t.iIdTipoUbp = u.iIdTipoUbp','JOIN');
		$this->db->join('ProgramaPresupuestario pp','pp.iIdProgramaPresupuestario = u.iIdProgramaPresupuestario','JOIN');
		$this->db->where('iIdUbp', $id);

		$query =  $this->db->get()->row();
        
        return $query;
	}

	//Mostrar Tipo de UBP
	public function mostrar_Tubps(){
        $this->db->select();
		$this->db->from('TipoUBP');	
		

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
	}
	
	//Mostrar Dependencia
	public function mostrar_dependencia(){
        $this->db->select();
		$this->db->from('Dependencia');	

		$query =  $this->db->get();
        $resultado = $query->result();
        return $resultado;
	}

	//Mostrar Programa Presupuestario
	public function mostrar_PP(){
        $this->db->select();
		$this->db->from('ProgramaPresupuestario');	

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
	}

	public function insertarUBP($data){
		$this->db->insert('UBP', $data);
		return $this->db->insert_id();
	}

	public function modificarUBP($id, $data){
		$this->db->where('iIdUbp', $id);	   

		return $this->db->update('UBP', $data);
	}
}