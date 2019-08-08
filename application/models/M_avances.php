<?php
class M_avances extends CI_Model
{
    
    function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }

    //Muestra todos los avances
    public function mostrar_avances(){

        $this->db->select();
        $this->db->from('Avance');

        $query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;

    }
}