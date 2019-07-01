<?php
class M_dependencias extends CI_Model
{
    private $table = 'Dependencia';
	private $idF = 'iIdDependencia';

    function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }
    
    public function mostrar_dependencias(){

        $this->db->select();
	    $this->db->from('Dependencia d');			

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;

    }
}

?>