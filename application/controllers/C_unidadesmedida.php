<?php defined('BASEPATH') OR exit('No direct script access allowed');

class C_unidadesmedida extends CI_Controller {
	public function __construct(){
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_unidadesmedida', 'mum');
    }

    public function index(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/inicio_um', $data);
    }

    public function cargar(){
        $this->load->view('UnidadesDeMedidas/agregar_um');      
    }

    public function regresar(){
        $data['consulta'] = $this->mum->mostrar_um();
    	$this->load->view('UnidadesDeMedidas/vTabla', $data);
    }

    public function insertar(){
        
        if(isset($_POST['NombUm'])){
            $data = array(
                'vUnidadMedida'=>$this->input->post('NombUm')
            );
            
            $resultado = $this->mum->insertarUM($data);
            echo $resultado;

         
        }else{
            echo "Algo salió mal";
        }
    }

    public function edit(){
        if(isset($_POST['id'])){
            $id = $_POST['id'];
            
            $data2['consulta'] = $this->mum->preparar_update($id);
            $this->load->view('UnidadesDeMedidas/editar_um', $data2);
        }
    }

    public function actualizar(){
        if(isset($_POST['id']) && isset($_POST['NombUm'])){    
            
            $id = $_POST['id'];

            $data = array(
                'vUnidadMedida'=>$this->input->post('NombUm')
            );

            $resul = $this->mum->modificarUM($id, $data);
            echo $resul;
        }else {
            echo "No funcionó";
        }
    }

    public function eliminar(){
        $key = $_POST['key'];
        echo $this->mum->eliminarUM($key);
    }

    public function gettable(){
        $keyword = null;
        if(isset($_POST['keyword']) && !empty($_POST['keyword'])){
            $keyword = $_POST['keyword'];
        }
       
        $data['consulta'] = $this->mum->mostrar_um($keyword);
        $this->load->view('UnidadesDeMedidas/vTabla', $data);
    }
}