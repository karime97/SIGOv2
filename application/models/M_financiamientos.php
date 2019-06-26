<?php
class M_financiamientos extends CI_Model {


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

	
}
