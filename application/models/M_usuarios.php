<?php

class M_usuarios extends CI_Model {


	private $table = 'Usuario';
	private $idF = 'iIdUsuario';

	function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }

    //Muestra todos los usuarios
    public function mostrar_usuarios(){

        $this->db->select();
        $this->db->from('Usuario u');
        $this->db->join('Dependencia d','u.iIdDependencia = d.iIdDependencia','INNER');
        $this->db->join('Rol r','u.iIdRol = r.iIdRol','INNER');
        //$this->db->join('FormacionAcademica fa','u.iIdFormacionAcademica = fa.iIdFormacionAcademica','INNER');
        //$this->db->join('MaxNivelAcademico na','u.iIdMaxNivelAcademico = na.iIdMaxNivelAcademico','INNER');
		$this->db->where('u.iActivo', 1);			

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;

    }

    //Muestra las dependencias
	public function mostrar_dependencia(){
		$this->db->order_by('vNombreCorto', 'asc');
        $this->db->select();
		$this->db->from('Dependencia');

		$query =  $this->db->get();
        $resultado = $query->result();
        return $resultado;
	}
}

?>