<?php 

defined('BASEPATH') OR exit('No direct script access allowed');
                        
class M_reporteAct extends CI_Model {

    function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
    }
    
    public function ejes(){
        $this->db->select('"iIdEje", "vEje"');
        $this->db->from('"PED2019Eje"');
        $query = $this->db->get();

        foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
    }
    
    public function anio(){
        $this->db->distinct();
        $this->db->select('"iAnio"');
        $this->db->from('"DetalleActividad"');

        $query = $this->db->get();

        foreach ($query->result() as $row) {
        $datos[] = [
           'iAnio'                       => $row->iAnio
         ];
     }
     return $datos;
    }

    public function dependencias($id){
        $this->db->select('"Dependencia"."iIdDependencia","vDependencia"');
        $this->db->from('"Dependencia"');
        $this->db->join('"DependenciaEje"', '"Dependencia"."iIdDependencia" = "DependenciaEje"."iIdDependencia"');
        $this->db->where('"DependenciaEje"."iIdEje"', $id);
        
        $query = $this->db->get();

        $select= '';
        foreach ($query->result() as $row)
        {
            $select .= '<option value="'.$row->iIdDependencia.'">'.$row->vDependencia.'</option>';
        }
        return $select;
    }


    public function generar($eje,$dep,$anio){
        $this->db->select();
        $this->db->from('"reporte_actividades"');
        $this->db->where('"iIdEje" = '.$eje. ' and "iIdDependencia" = '.$dep. ' and "iAnio" = '.$anio. '');
        $query = $this->db->get();

        foreach ($query->result() as $row) {
        $datos[] = [
           'iIdActividad'             => $row->iIdActividad,
           'iActivo'                       => $row->iActivo,
           'vActividad'                 => $row->vActividad,
           'objetivoactividad'   => $row->objetivoactividad,
           'vPoblacionObjetivo' => $row->vPoblacionObjetivo,
           'vDescripcion'             => $row->vDescripcion,
           'dInicio'                       => $row->dInicio,
           'dFin'                             => $row->dFin,
           'vDependencia'             => $row->vDependencia,
           'claveff'                       => $row->claveff,
           'vFinanciamiento'       => $row->vFinanciamiento,
           'monto'                           => $row->monto,
           'vLineaAccion'             => $row->vLineaAccion,
           'vEstrategia'               => $row->vEstrategia,
           'valorobjetivo'           => $row->valorobjetivo,
           'vTema'                           => $row->vTema,
           'vEje'                             => $row->vEje,
           'claveubp'                     => $row->claveubp,
           'vUBP'                             => $row->vUBP,
           'iIdEntregable'           => $row->iIdEntregable,
           'vEntregable'               => $row->vEntregable,
           'nMeta'                           => $row->nMeta,
           'vUnidadMedida'           => $row->vUnidadMedida,
           'vSujetoAfectado'       => $row->vSujetoAfectado,
           'vPeriodicidad'           => $row->vPeriodicidad,
           'iMunicipalizacion'   => $row->iMunicipalizacion,
           'nAvance'                       => $row->nAvance,
           'nEjercido'                    => $row->nEjercido
         ];
     }
     return $datos;
    }
}
                        
/* End of file M_reporteAct.php */
    
                        