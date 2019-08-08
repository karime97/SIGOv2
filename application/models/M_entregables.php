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
	public function mostrar_entregables($id)
	{              
        $this->db->select();
        $this->db->from('Entregable e');
        $this->db->join('UnidadMedida um','e.iIdUnidadMedida = um.iIdUnidadMedida','JOIN');
        $this->db->join('Periodicidad p','e.iIdPeriodicidad = p.iIdPeriodicidad','JOIN');
        $this->db->join('SujetoAfectado sa','e.iIdSujetoAfectado = sa.iIdSujetoAfectado','JOIN');
        $this->db->join('DetalleEntregable de','e.iIdEntregable = de.iIdEntregable','JOIN');
        $this->db->join('DetalleActividad da','de.iIdDetalleActividad = da.iIdDetalleActividad','JOIN');
        $this->db->where('e.iActivo', 1);
        $this->db->where('da.iIdDetalleActividad', $id);		

		$query =  $this->db->get();
        
        $resultado = $query->result();
        return $resultado;
    }
    
    //Obtiene el id de la dependencia a la que pertenece el usuario actual
    public function obtener_iddependencia($idusuario){

        $this->db->select('u.iIdDependencia');
        $this->db->from('Dependencia d');
        $this->db->join('Usuario u','d.iIdDependencia = u.iIdDependencia','JOIN');
        $this->db->where('u.iIdUsuario',$idusuario);

        $query =  $this->db->get()->row();
        
        return $query;
    }

    //Guarda el entregable y el detalle entregable en la DB
    public function guardado_general($table,$data){

        $this->db->insert($table, $data);
		return $this->db->insert_id();
    }

    //Guarda el entregable con municipio en la DB
    public function guardar_entregablemunicipio($table,$data){

        return $this->db->insert($table, $data);
    }

    //Guarda el Entregable alinado a un Componente en la DB
    public function guardar_entregablecomponente($table,$data){

        return $this->db->insert($table, $data);
    }

    //Muestra la ponderacion mas alta del DetalleEntregable
    public function mostrar_detalleentregable($id_detalleactividad){

        $this->db->select();
        $this->db->from('DetalleEntregable de');
        $this->db->join('DetalleActividad da','de.iIdDetalleActividad = da.iIdDetalleActividad','JOIN');
        $this->db->where('de.iActivo', 1);
        $this->db->where('de.iIdDetalleActividad', $id_detalleactividad);
        $this->db->order_by('iPonderacion', 'DESC');
        $this->db->limit(1);			

		$query =  $this->db->get()->row();
        
        return $query;

    }

    //funcion de modificacion generica
    public function modificacion_general($where,$table,$data){

        $this->db->where($where);
		return $this->db->update($table, $data);
    }

    //Modifica la informacion de la tabla entregable y DetalleEntregable
    public function modificar_detalleentregable($id,$data){

        $this->db->where('iIdDetalleEntregable', $id);
		return $this->db->update('DetalleEntregable', $data);
    }

    //Obtiene el id de la tabla DetalleEntregable
    public function obtener_id_detallentregable($id_ent){

        $this->db->select();
        $this->db->from('DetalleEntregable de');
        $this->db->where('de.iIdEntregable', $id_ent);

        $query =  $this->db->get()->row();
        
        return $query;

    }

    //Muestra la ponderacion del entregable actual
    public function mostrar_ponderacion_actual($id_detent){

        $this->db->select();
        $this->db->from('DetalleEntregable de');
        $this->db->join('Entregable e','de.iIdEntregable = e.iIdEntregable','JOIN');
        $this->db->join('UnidadMedida um','e.iIdUnidadMedida = um.iIdUnidadMedida','JOIN');
        $this->db->where('de.iActivo', 1);
        $this->db->where('de.iIdDetalleEntregable', $id_detent);
        $this->db->limit(1);			

		$query =  $this->db->get()->row();
        
        return $query;

    }

    //Muestra la ponderacion de los entregables
    public function mostrar_ponderaciones($id_detact,$identregableactual=''){

        $this->db->select();
        $this->db->from('DetalleEntregable de');
        $this->db->join('Entregable e','de.iIdEntregable = e.iIdEntregable','JOIN');
        $this->db->join('UnidadMedida um','e.iIdUnidadMedida = um.iIdUnidadMedida','JOIN');
        $this->db->where('de.iActivo', 1);
        $this->db->where('de.iIdDetalleActividad', $id_detact);

        if($identregableactual != ''){
            $this->db->where('de.iIdDetalleEntregable !=', $identregableactual);
        }
        
        $query =  $this->db->get();

        $resultado = $query->result();
        return $resultado;
    }

    //Calcula el total de las ponderaciones
    public function total_ponderaciones($id_detact){

        $this->db->select_sum('iPonderacion');
        $this->db->from('DetalleEntregable de');
        $this->db->where('de.iIdDetalleActividad',$id_detact);
    }

    //Muestra los municipios
    public function mostrar_municipios(){

        $this->db->select();
        $this->db->from('Municipio m');
        
        $query =  $this->db->get();

        $resultado = $query->result();
        return $resultado;
    }

    //Muestra el entregable actual
    public function mostrar_entregable_actual($id_entregable){

        $this->db->select();
        $this->db->from('Entregable e');
        $this->db->join('DetalleEntregable de','e.iIdEntregable = de.iIdEntregable','JOIN');
        $this->db->join('UnidadMedida um','e.iIdUnidadMedida = um.iIdUnidadMedida','JOIN');
        $this->db->where('e.iIdEntregable',$id_entregable);       

        $query =  $this->db->get()->row();
        
        return $query;

    }

    //Muestra las metas de los entregables por municipios
    public function mostrar_metas_municipios($id_mun,$id_detent){

        $this->db->select('dem.*');
        $this->db->from('DetalleEntregableMetaMunicipio dem');
        $this->db->join('Municipio m','dem.iIdMunicipio = m.iIdMunicipio','JOIN');
        $this->db->join('DetalleEntregable de','de.iIdDetalleEntregable = dem.iIdDetalleEntregable','JOIN');
        $this->db->where('dem.iIdMunicipio',$id_mun);
        $this->db->where('dem.iIdDetalleEntregable',$id_detent);    

        $query =  $this->db->get()->row();
        
        return $query;

    }

    //Muestra los entregables alineados a un componente de compromiso
    public function mostrar_entregablecomponente($id_ent){

        $this->db->select();
        $this->db->from('EntregableComponente ec');
        $this->db->where('ec.iIdEntregable',$id_ent);

        $query =  $this->db->get()->row();
        
        return $query;
    }

    //Mostrar compromisos y componentes
    public function mostrar_componentescompromiso($id_ent){
        
        $this->db->select('ec.iIdEntregable,c2.vCompromiso,c2.iIdCompromiso,c.vComponente,c.iIdComponente');
        $this->db->from('Componente c');
        $this->db->join('EntregableComponente ec','c.iIdComponente = ec.iIdComponente','JOIN');
        $this->db->join('Compromiso c2','c.iIdCompromiso = c2.iIdCompromiso','JOIN');
        $this->db->where('ec.iIdEntregable',$id_ent);

        $query =  $this->db->get()->row();
        
        return $query;
    }

    //Muestra los entregables alineados a un componente de compromiso
    public function validar_entregablemunicipio($id_detent){

        $this->db->select();
        $this->db->from('DetalleEntregableMetaMunicipio dem');
        $this->db->where('dem.iIdDetalleEntregable',$id_detent);

        $query =  $this->db->get();

        $resultado = $query->result();
        return $resultado;
    }

    //Elimina los entregables por municipio de determinado entregable
    public function eliminar_entregablemunicipio($id){
       
        $this->db->where('iIdDetalleEntregable' ,  $id );
        if($this->db->delete('DetalleEntregableMetaMunicipio')){
            return TRUE;
        }else{
            return FALSE;
        }
        
    }

    //Elimina la informacion de la tabla EntregableComponente
    public function eliminar_compromiso($id_ent){

        $this->db->where('iIdEntregable' ,  $id_ent );
        if($this->db->delete('EntregableComponente')){
            return TRUE;
        }else{
            return FALSE;
        }
    }

    //Cambia de estatus activo a inactivo(Metoo de eliminacion)
	public function eliminacion_generica($where,$table,$data){

        $this->db->where($where);
		return $this->db->update($table,$data);
    }
}

?>