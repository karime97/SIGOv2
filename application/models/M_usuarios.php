<?php

class M_usuarios extends CI_Model {


	private $table = 'Usuario';
	private $idU = 'iIdUsuario';

	function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }

    //Muestra todos los usuarios
    public function mostrar_usuarios($usuario = null, $rol = null){

        $this->db->select();
        $this->db->from('Usuario u');
        $this->db->join('Dependencia d','u.iIdDependencia = d.iIdDependencia','INNER');
        $this->db->join('Rol r','u.iIdRol = r.iIdRol','INNER');
        //$this->db->join('FormacionAcademica fa','u.iIdFormacionAcademica = fa.iIdFormacionAcademica','INNER');
        //$this->db->join('MaxNivelAcademico na','u.iIdMaxNivelAcademico = na.iIdMaxNivelAcademico','INNER');
        $this->db->where('u.iActivo', 1);
        
        if (!empty($usuario) && $usuario != null){
			$this->db->where("(\"vNombre\" ilike '%$usuario%' or \"vPrimerApellido\" ilike '%$usuario%' or \"vSegundoApellido\" ilike '%$usuario%')");
		}
		if (!empty($rol) && $rol != null){
			$this->db->where('u.iIdRol', $rol);
		}

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;

    }
    
    //Guarda las fuentes de financiamiento en la DB
	public function guardar_usuario($data){

		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
    }
    
    //Muestra los usuarios con determinado id
	public function preparar_update($id){

		$this->db->select();
        $this->db->from('Usuario u');
        $this->db->join('Dependencia d','u.iIdDependencia = d.iIdDependencia','INNER');
        $this->db->join('Rol r','u.iIdRol = r.iIdRol','INNER');
        $this->db->join('FormacionAcademica fa','u.iIdFormacionAcademica = fa.iIdFormacionAcademica','INNER');
        $this->db->join('MaxNivelAcademico na','u.iIdMaxNivelAcademico = na.iIdMaxNivelAcademico','INNER');
		$this->db->where('u.iIdUsuario', $id);

		$query =  $this->db->get()->row();
        
        return $query;

    }
    
    //Modifica los usuarios en la DB
	public function modificar_usuario($id,$data){

		$this->db->where('iIdUsuario', $id);
		return $this->db->update('Usuario', $data);
		
	}

	//Cambia de estatus activo a inactivo(Metoo de eliminacion)
	public function eliminar_usuario($id){

		$data = array('iActivo' => 0);

		$this->db->where('iIdUsuario', $id);
		return $this->db->update('Usuario',$data);
    }
    
    //Valida si el usuario existe
    public function validar_usuario($us){

        $this->db->select();
		$this->db->from('Usuario');
        $this->db->where('iActivo', 1);
        $this->db->where('vUsuario', $us);
        
        $query =  $this->db->get();

        if($query->num_rows() > 0){

            return FALSE;

        }else{

            return TRUE;
        }
    }

    //Valida la contraseña del usuario 
    public function validar_password($pass,$id){

        $this->db->select();
		$this->db->from('Usuario');
        $this->db->where('iActivo', 1);
        $this->db->where('vPassword', $pass);
        $this->db->where('iIdUsuario', $id);
        
        $query =  $this->db->get();

        if($query->num_rows() > 0){

            return TRUE;

        }else{

            return FALSE;
        }
    }
}

?>