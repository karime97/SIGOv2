<?php
class M_financiamientos extends CI_Model {


	private $table = 'Financiamiento';

	function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	//Muestra todas las fuentes de financiamiento
	public function mostrar_financiamientos()
	{              
        $this->db->select();
	    $this->db->from('Financiamiento f');			

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
	}

	//Guardar las fuentes de financiamiento en la DB
	public function guardar_financiamiento($data){

		return $this->db->insert($this->table, $data);
		//return $this->db->insert_id();
	}

	//Funcion para obtener el ultimo id de la tabla
	public function get_last_id(){
		$this->db->select_max('iIdFinanciamiento'); 
		$result= $this->db->get('Financiamiento')->row_array(); 
		return $result['iIdFinanciamiento']; 
	}

	
}
