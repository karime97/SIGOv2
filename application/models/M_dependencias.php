<?php
class M_dependencias extends CI_Model
{
    private $table = 'Dependencia';
	private $idD = 'iIdDependencia';

    function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }
    
    //Muestra todas las dependencias
    public function mostrar_dependencias(){

        $this->db->select();
        $this->db->from('Dependencia d');
        $this->db->where('iActivo', 1);				

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;

    }

    //Guarda las dependencias en la DB
	public function guardar_dependencia($data){

		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	//Muestra las dependencias con determinado id
	public function preparar_update($id){

		$this->db->select();
		$this->db->from('Dependencia d');
		$this->db->where($this->idD, $id);

		$query =  $this->db->get()->row();
        
        return $query;

    }
    
    //Modifica las dependencias en la DB
	public function modificar_dependencia($id,$data){

		$this->db->where('iIdDependencia', $id);
		return $this->db->update('Dependencia', $data);
		
	}

	//Cambia de estatus activo a inactivo(Metoo de eliminacion)
	public function eliminar_dependencia($id){

		$data = array('iActivo' => 0);

		$this->db->where('iIdDependencia', $id);
		return $this->db->update('Dependencia',$data);
	}
}

?>