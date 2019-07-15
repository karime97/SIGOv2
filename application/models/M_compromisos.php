<?php
class M_compromisos extends CI_Model {

	function __construct(){
		parent::__construct();
        $this->db = $this->load->database('default',TRUE);
	}
}
?>