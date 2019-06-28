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
}