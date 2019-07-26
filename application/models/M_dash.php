<?php
class M_dash extends CI_Model {

	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}

	public function dependencias($id){
		$datos = '';
		$datos = array();
		$this->db->select('Dependencia.iIdDependencia, Dependencia.vNombreCorto');
		$this->db->from('Dependencia');
		$this->db->join('DependenciaEje', 'Dependencia.iIdDependencia = DependenciaEje.iIdDependencia');
		$this->db->join('PED2019Eje', 'PED2019Eje.iIdEje = DependenciaEje.iIdEje');
		$this->db->where('PED2019Eje.iIdEje', $id);
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdDependencia'                       => $row->iIdDependencia,
           'vNombreCorto'                   => $row->vNombreCorto
         ];
     }
     return $datos;
	}

	public function ejes1(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 1');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes2(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 2');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes3(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 3');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes4(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 4');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes5(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 5');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes6(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 6');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes7(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 7');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes8(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 8');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}
	public function ejes9(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 9');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}

	public function ejes(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje, vIcono');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje >= 1 and iIdEje <= 9');
	
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
		   'vEje'                   => $row->vEje,
		   'vIcono'  => $row->vIcono
         ];
     }
     return $datos;
	}

	public function temas($id){
		$datos = '';
		$datos = array();
		$this->db->select('iIdTema, vTema, PED2019Tema.vIcono');
		$this->db->from('PED2019Tema');
		$this->db->join('PED2019Eje', 'PED2019Tema.iIdEje = PED2019Eje.iIdEje');
		$this->db->where('PED2019Eje.iIdEje', $id);
	
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdTema'                       => $row->iIdTema,
		   'vTema'                   => $row->vTema,
		   'vIcono' => $row->vIcono
         ];
     }
     return $datos;
	}

	public function totaltemas($id){
		
		$this->db->select('COALESCE(round("sum"("nAvance") / "count"("nAvance"),2) ,0) as prom');
		$this->db->from('"DetalleActividad"');
		$this->db->join('"Actividad"', '"Actividad"."iIdActividad" = "DetalleActividad"."iIdActividad"');
		$this->db->join('"ActividadLineaAccion"', '"ActividadLineaAccion"."iIdActividad" =  "Actividad"."iIdActividad"');
		$this->db->join('"PED2019LineaAccion"', '"PED2019LineaAccion"."iIdLineaAccion" = "ActividadLineaAccion"."iIdLineaAccion"');
		$this->db->join('"PED2019Estrategia"', '"PED2019Estrategia"."iIdEstrategia" = "PED2019LineaAccion"."iIdEstrategia"');
		$this->db->join('"PED2019Objetivo"', '"PED2019Objetivo"."iIdObjetivo" = "PED2019Estrategia"."iIdObjetivo"');
		$this->db->join('"PED2019Tema"', '"PED2019Tema"."iIdTema" = "PED2019Objetivo"."iIdTema"');
		$this->db->where('"PED2019Tema"."iIdTema"',$id);
	
		return $this->db->get()->row()->prom;

    /* foreach ($query->result() as $row) {
		$datos = $row->prom;
     }
     return $datos;*/
	}

	public function actividades($id,$anio){
		$datos = '';
		$datos = array();
		$this->db->select('Actividad.iIdActividad , Actividad.vActividad, DetalleActividad.nAvance');
		$this->db->from('Actividad');
		$this->db->join('DetalleActividad', 'DetalleActividad.iIdActividad = Actividad.iIdActividad');
		$this->db->join('Dependencia', 'Dependencia.iIdDependencia = Actividad.iIdDependencia');
		$this->db->join('DependenciaEje', 'Dependencia.iIdDependencia = DependenciaEje.iIdDependencia');
		$this->db->join('PED2019Eje', 'PED2019Eje.iIdEje = DependenciaEje.iIdEje');
		$this->db->where('PED2019Eje.iIdEje = '.$id.' and DetalleActividad.iAnio = '.$anio.' and DetalleActividad.iActivo = 1');
		$this->db->order_by('"Actividad"."iIdActividad"', 'ASC');
		$query = $this->db->get();

		foreach ($query->result() as $row) {
			$datos[] = [
				'iIdActividad'                       => $row->iIdActividad,
				'vActividad'                   => $row->vActividad,
				'nAvance' => $row->nAvance
			];
		}
		return $datos;
	}

	public function actividades2($id,$anio){
		$datos = '';
		$datos = array();
		$this->db->select('Actividad.iIdActividad , Actividad.vActividad, DetalleActividad.nAvance');
		$this->db->from('Actividad');
		$this->db->join('DetalleActividad', 'DetalleActividad.iIdActividad = Actividad.iIdActividad');
		$this->db->join('Dependencia', 'Dependencia.iIdDependencia = Actividad.iIdDependencia');
		$this->db->where('Dependencia.iIdDependencia = '.$id.' and DetalleActividad.iAnio = '.$anio.' and DetalleActividad.iActivo = 1');
		$this->db->order_by('"Actividad"."iIdActividad"', 'ASC');
		$query = $this->db->get();

		foreach ($query->result() as $row) {
			$datos[] = [
				'iIdActividad'                       => $row->iIdActividad,
				'vActividad'                   => $row->vActividad,
				'nAvance' => $row->nAvance
			];
		}
		return $datos;
	}

	public function avacetotaleje($id, $an){
		$this->db->select('COALESCE(round("sum"("nAvance") / "count"("nAvance"),2) ,0) as prom');
		$this->db->from('"DetalleActividad"');
		$this->db->join('"Actividad"', '"Actividad"."iIdActividad" = "DetalleActividad"."iIdActividad"');
		$this->db->join('"ActividadLineaAccion"', '"ActividadLineaAccion"."iIdActividad" =  "Actividad"."iIdActividad"');
		$this->db->join('"PED2019LineaAccion"', '"PED2019LineaAccion"."iIdLineaAccion" = "ActividadLineaAccion"."iIdLineaAccion"');
		$this->db->join('"PED2019Estrategia"', '"PED2019Estrategia"."iIdEstrategia" = "PED2019LineaAccion"."iIdEstrategia"');
		$this->db->join('"PED2019Objetivo"', '"PED2019Objetivo"."iIdObjetivo" = "PED2019Estrategia"."iIdObjetivo"');
		$this->db->join('"PED2019Tema"', '"PED2019Tema"."iIdTema" = "PED2019Objetivo"."iIdTema"');
		$this->db->join('"PED2019Eje"', '"PED2019Eje"."iIdEje" = "PED2019Tema"."iIdEje"');
		$this->db->where('"PED2019Eje"."iIdEje" = '.$id. ' and "iAnio" ='.$an.'');
	
		return $this->db->get()->row()->prom;

	}

	public function avacetotalejes($an){
		$this->db->select('COALESCE(round("sum"("nAvance") / "count"("nAvance"),2) ,0) as prom');
		$this->db->from('"DetalleActividad"');
		$this->db->join('"Actividad"', '"Actividad"."iIdActividad" = "DetalleActividad"."iIdActividad"');
		$this->db->join('"ActividadLineaAccion"', '"ActividadLineaAccion"."iIdActividad" =  "Actividad"."iIdActividad"');
		$this->db->join('"PED2019LineaAccion"', '"PED2019LineaAccion"."iIdLineaAccion" = "ActividadLineaAccion"."iIdLineaAccion"');
		$this->db->join('"PED2019Estrategia"', '"PED2019Estrategia"."iIdEstrategia" = "PED2019LineaAccion"."iIdEstrategia"');
		$this->db->join('"PED2019Objetivo"', '"PED2019Objetivo"."iIdObjetivo" = "PED2019Estrategia"."iIdObjetivo"');
		$this->db->join('"PED2019Tema"', '"PED2019Tema"."iIdTema" = "PED2019Objetivo"."iIdTema"');
		$this->db->join('"PED2019Eje"', '"PED2019Eje"."iIdEje" = "PED2019Tema"."iIdEje"');
		$this->db->where('"iAnio"',$an);
		return $this->db->get()->row()->prom;
	}
}