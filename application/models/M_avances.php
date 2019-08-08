<?php
class M_avances extends CI_Model
{
    
    function __construct()
	{
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }

    //Muestra la infromacion de la Actividad y el Entregable
    public function mostrar_actividadentregable($id_detent){

        $this->db->select('e.vEntregable,a.vActividad');
        $this->db->from('Entregable e');
        $this->db->join('DetalleEntregable de','e.iIdEntregable = de.iIdEntregable','JOIN');
        $this->db->join('DetalleActividad da','de.iIdDetalleActividad = da.iIdDetalleActividad','JOIN');
        $this->db->join('Actividad a','da.iIdActividad = a.iIdActividad','JOIN');
         $this->db->where('e.iActivo',1);
        $this->db->where('de.iIdDetalleEntregable',$id_detent);

        $query =  $this->db->get()->row();
        
        return $query;

    }
}