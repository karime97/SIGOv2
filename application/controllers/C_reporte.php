<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_reporte extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->library('excel');
        $this->load->helper('url');
        $this->load->model('M_reporteAct');
        //$this->load->model('M_seguridad','ms');
    }

    public function index(){
        $datos['ejes'] = $this->M_reporteAct->ejes();
        $this->load->view('reporte/actividad', $datos);
    }

    public function dependencias(){
        if($_REQUEST['id']){
            $id = $_REQUEST['id'];
            $respuesta = $this->M_reporteAct->dependencias($id);
            echo $respuesta;          
        }
    }

    public function reporte(){
       if($_REQUEST['id']){
        $reporte = new PHPExcel();
		$reader = PHPExcel_IOFactory::createReader('Excel5');
		$reporte = $reader->load('public/reportes/actividades.xls');

        $reporte->setActiveSheetIndex('0');
        
        $reporte->getActiveSheet()->SetCellValue('A2', 'Nuevos Dulces');
        $reporte->getActiveSheet()->SetCellValue('B2', 'asdasasdasdas');
        
        $ruta = 'public/reportes/Rep_actividades.xls';
		$imprimir = PHPExcel_IOFactory::createWriter($reporte, 'Excel2007');
		$imprimir->save($ruta);
		echo 'ok';
       }
    }

    public function generarrepo(){

        if($_REQUEST['eje']){

            if($_REQUEST['dep']){

                if($_REQUEST['anio']){

                    $eje = $_REQUEST['eje'];
                    $dep=$_REQUEST['dep'];
                    $anio=$_REQUEST['anio'];

                    $respuesta=$this->M_reporteAct->generar($eje,$dep,$anio);



                    $reporte = new PHPExcel();
                    $reader = PHPExcel_IOFactory::createReader('Excel5');
                    $reporte = $reader->load('public/reportes/actividades.xls');
                    $reporte->setActiveSheetIndex('0');


                    $i = 2;
                    foreach($respuesta as $rep){

                        $reporte->getActiveSheet()->SetCellValue('A'.$i,$rep['iIdActividad']);
                        $reporte->getActiveSheet()->SetCellValue('B'.$i,$rep['iActivo']);
                        $reporte->getActiveSheet()->SetCellValue('C'.$i,$rep['vActividad']);
                        $reporte->getActiveSheet()->SetCellValue('D'.$i,$rep['objetivoactividad']);
                        $reporte->getActiveSheet()->SetCellValue('E'.$i,$rep['vPoblacionObjetivo']);
                        $reporte->getActiveSheet()->SetCellValue('F'.$i,$rep['vDescripcion']);
                        $reporte->getActiveSheet()->SetCellValue('H'.$i,$rep['dInicio']);
                        $reporte->getActiveSheet()->SetCellValue('I'.$i,$rep['dFin']);
                        $reporte->getActiveSheet()->SetCellValue('J'.$i,$rep['vDependencia']);
                        $reporte->getActiveSheet()->SetCellValue('K'.$i,$rep['claveff']);
                        $reporte->getActiveSheet()->SetCellValue('L'.$i,$rep['vFinanciamiento']);
                        $reporte->getActiveSheet()->SetCellValue('M'.$i,$rep['monto']);
                        $reporte->getActiveSheet()->SetCellValue('N'.$i,$rep['vLineaAccion']);
                        $reporte->getActiveSheet()->SetCellValue('O'.$i,$rep['vEstrategia']);
                        $reporte->getActiveSheet()->SetCellValue('P'.$i,$rep['valorobjetivo']);
                        $reporte->getActiveSheet()->SetCellValue('Q'.$i,$rep['vTema']);
                        $reporte->getActiveSheet()->SetCellValue('R'.$i,$rep['vEje']);
                        $reporte->getActiveSheet()->SetCellValue('S'.$i,$rep['claveubp']);
                        $reporte->getActiveSheet()->SetCellValue('T'.$i,$rep['vUBP']);
                        $reporte->getActiveSheet()->SetCellValue('U'.$i,$rep['iIdEntregable']);
                        $reporte->getActiveSheet()->SetCellValue('V'.$i,$rep['vEntregable']);
                        $reporte->getActiveSheet()->SetCellValue('W'.$i,$rep['nMeta']);
                        $reporte->getActiveSheet()->SetCellValue('X'.$i,$rep['vUnidadMedida']);
                        $reporte->getActiveSheet()->SetCellValue('Y'.$i,$rep['vSujetoAfectado']);
                        $reporte->getActiveSheet()->SetCellValue('Z'.$i,$rep['vPeriodicidad']);
                        $reporte->getActiveSheet()->SetCellValue('AA'.$i,$rep['iMunicipalizacion']);
                        $reporte->getActiveSheet()->SetCellValue('AB'.$i,$rep['nAvance']);
                        $reporte->getActiveSheet()->SetCellValue('AC'.$i,$rep['nEjercido']);
                        
                        $i++;

                    }
                    $ruta = 'public/reportes/actividadesBD.xls';
		            $imprimir = PHPExcel_IOFactory::createWriter($reporte, 'Excel2007');
		            $imprimir->save($ruta);
                    print_r(respuesta);
                    
                }

            }

        }

    }

}