<?php

class M_entregables extends CI_Model{

    private $table = 'Entregable';
	private $idF = 'iIdEntregable';

    function __construct()
    {
        parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }

    //Muestra todos los entregables
	public function mostrar_entregables()
	{              
        $this->db->select();
		$this->db->from('Entregable e');
		$this->db->where('iActivo', 1);			

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
	}
}

?>