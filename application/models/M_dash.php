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
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 1');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes2(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 2');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes3(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 3');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes4(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 4');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes5(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 5');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes6(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 6');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes7(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 7');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes8(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 8');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}
	public function ejes9(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje = 9');
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}

	public function ejes(){
		$datos = '';
		$datos = array();
		$this->db->select('iIdEje, vEje');
		$this->db->from('PED2019Eje');
		$this->db->where('iIdEje >= 1 and iIdEje <= 9');
	
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdEje'                       => $row->iIdEje,
           'vEje'                   => $row->vEje
         ];
     }
     return $datos;
	}

	public function temas($id){
		$datos = '';
		$datos = array();
		$this->db->select('iIdTema, vTema');
		$this->db->from('PED2019Tema');
		$this->db->join('PED2019Eje', 'PED2019Tema.iIdEje = PED2019Eje.iIdEje');
		$this->db->where('PED2019Eje.iIdEje', $id);
	
		$query = $this->db->get();

     foreach ($query->result() as $row) {
        $datos[] = [
           'iIdTema'                       => $row->iIdTema,
           'vTema'                   => $row->vTema
         ];
     }
     return $datos;
	}
}