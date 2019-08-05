<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_entregables extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_entregables','me');
        $this->load->library('Class_options');
    }

    //Muestra la vista principal
    public function index(){

        if(isset($_POST['id'])){

            $data['id_detact'] = $this->input->post('id');
            $data['tabla'] = $this->vista_tabla_entregables($data['id_detact']);
            $this->load->view('entregables/principal',$data);
        }
    }

    //Muestra la vista para agregar
    public function create(){
        
        $lib = new Class_options();

        $data['id_detact'] = $this->input->post('id');
        $data['unidadmedida'] = $lib->options_tabla('unidades_medida');
        $data['periodicidad'] = $lib->options_tabla('periodicidad');
        $data['sujeto_afectado'] = $lib->options_tabla('sujeto_afectado');
        //$data['componente'] = $lib->options_tabla('componentes');
        $data['compromiso'] = $lib->options_tabla('compromisos');

        $this->load->view('entregables/contenido_agregar',$data);
    }

    //Funcion para insertar
    public function insert(){

        if(isset($_POST['entregable']) && isset($_POST['unidadmedida']) && isset($_POST['sujetoafectado']) 
        && isset($_POST['periodicidad']) && isset($_POST['meta']) && isset($_POST['id_detalleactividad'])){

            $resultado = $this->get_dependencia($_SESSION[PREFIJO.'_idusuario']);

            $data['vEntregable'] = $this->input->post('entregable');
            $data['iIdUnidadMedida'] = $this->input->post('unidadmedida');
            $data['iIdPeriodicidad'] = $this->input->post('periodicidad');

            if(isset($_POST['municipalizable'])){
                $municipalizacion = $this->input->post('municipalizable');
            }else{
                $municipalizacion = 0;
            }

            if(isset($_POST['beneficios'])){
                $beneficios = $this->input->post('beneficios');
            }else{
                $beneficios = 0;
            }

            $data['iMunicipalizacion'] = $municipalizacion;
            $data['iMismosBeneficiarios'] = $beneficios;
            $data['iIdDependencia'] = $resultado->iIdDependencia;
            $data['iIdSujetoAfectado'] = $this->input->post('sujetoafectado');
            $data['iActivo']= 1;

            $table = 'Entregable';

            $identregable = $this->me->guardado_general($table,$data);

            if($identregable > 0){

                $table2 = 'DetalleEntregable';

                $data2['iIdEntregable'] = $identregable;
                $data2['iIdDetalleActividad'] = $this->input->post('id_detalleactividad');
                $data2['nMeta'] = $this->input->post('meta');

                $cantidadEntregables = $this->validar_entregables($this->input->post('id_detalleactividad'));

                if($cantidadEntregables != null){

                    $id_detalleentregable = $cantidadEntregables->iIdDetalleEntregable;

                    $pond_alta = $cantidadEntregables->iPonderacion;
                    $nueva_ponderacion = $pond_alta - 1;

                    //$data2_1 = array();

                    $data2_1['iPonderacion'] = $nueva_ponderacion;

                    if($this->me->modificar_detalleentregable($id_detalleentregable,$data2_1)){
                        $ponderacion = 1;
                    }

                }else{

                    $ponderacion = 100;

                }

                $data2['iPonderacion'] = $ponderacion;
                $data2['iActivo'] = 1;

                $id_detentregable = $this->me->guardado_general($table2,$data2);

                if($id_detentregable > 0){

                    if(isset($_POST['compromiso']) && $_POST['compromiso'] != 0 && isset($_POST['componente']) && $_POST['componente'] != 0){

                        $table3 = 'EntregableComponente';

                        $data3['iIdEntregable'] = $identregable;
                        $data3['iIdComponente'] = $this->input->post('componente');

                        $this->me->guardar_entregablecomponente($table3,$data3);
                    }

                    echo $id_detentregable;

                }else{                   
                    echo 'error';
                }
            }
        }else{
            echo "error post";
        }
    }

    //obtiene la dependencia actual
    public function get_dependencia($id){

        return $this->me->obtener_iddependencia($id);
    }

    //Muestra la pantalla de editar
    public function edit(){

        $lib = new Class_options();

        $data = array();

        $data['id_ent'] = $this->input->post('id');
        $data['id_detact'] = $this->input->post('id2');

        $data['consulta'] = $this->me->mostrar_entregable_actual($data['id_ent']);
        $componente = $this->me->mostrar_componentescompromiso($data['id_ent']);

        if($componente != NULL){
            $data['componente'] = $lib->options_tabla('componentes_compromiso',$componente->iIdComponente,'cp.iIdCompromiso = '.$componente->iIdCompromiso.'');
            $data['compromiso'] = $lib->options_tabla('compromisos',$componente->iIdCompromiso);
        }else{
            $data['componente'] = '<option value="0">Seleccionar...</option>';
            $data['compromiso'] = $lib->options_tabla('compromisos');
        }
        
        $data['unidadmedida'] = $lib->options_tabla('unidades_medida',$data['consulta']->iIdUnidadMedida);
        $data['periodicidad'] = $lib->options_tabla('periodicidad',$data['consulta']->iIdPeriodicidad);
        $data['sujeto_afectado'] = $lib->options_tabla('sujeto_afectado',$data['consulta']->iIdSujetoAfectado);      

        $this->load->view('entregables/contenido_modificar',$data);
    }

    //Funcion para editar
    public function update(){

        if(isset($_POST['entregable']) && isset($_POST['unidadmedida']) && isset($_POST['sujetoafectado']) 
        && isset($_POST['periodicidad']) && isset($_POST['meta']) && isset($_POST['id_entregable']) && isset($_POST['id_detalleactividad'])){

            $resultado = $this->get_dependencia($_SESSION[PREFIJO.'_idusuario']);
            $id_ent = $this->input->post('id_entregable');

            $data['vEntregable'] = $this->input->post('entregable');
            $data['iIdUnidadMedida'] = $this->input->post('unidadmedida');
            $data['iIdPeriodicidad'] = $this->input->post('periodicidad');

            if(isset($_POST['municipalizable'])){
                $municipalizacion = $this->input->post('municipalizable');
            }else{
                $municipalizacion = 0;
            }

            if(isset($_POST['beneficios'])){
                $beneficios = $this->input->post('beneficios');
            }else{
                $beneficios = 0;
            }

            $data['iMunicipalizacion'] = $municipalizacion;
            $data['iMismosBeneficiarios'] = $beneficios;
            $data['iIdDependencia'] = $resultado->iIdDependencia;
            $data['iIdSujetoAfectado'] = $this->input->post('sujetoafectado');
            $data['iActivo']= 1;
            
            $where = "iIdEntregable =".$id_ent;
            $table = 'Entregable';

            if($this->me->modificacion_general($where,$table,$data)){

                $where2 = "iIdEntregable =".$id_ent;
                $table2 = 'DetalleEntregable';
                
                $data2['nMeta'] = $this->input->post('meta');

                if($this->me->modificacion_general($where2,$table2,$data2)){

                    $detalleentregable = $this->me->obtener_id_detallentregable($id_ent);
                    echo  $detalleentregable->iIdDetalleEntregable;
                }
            }

            if($this->me->eliminar_compromiso($id_ent)){

                if(isset($_POST['compromiso']) && $_POST['compromiso'] != 0 && isset($_POST['componente']) && $_POST['componente'] != 0){

                    $table3 = 'EntregableComponente';

                    $data3['iIdEntregable'] = $id_ent;
                    $data3['iIdComponente'] = $this->input->post('componente');

                    $this->me->guardar_entregablecomponente($table3,$data3);
                }
            }

        }else{
            echo 'error';
        }

    }

    //Muestra los componentes en base a un compromiso
    public function showcomponentes($id){

        $lib = new Class_options();

        if($id == 0){
            $componentes= '<option value="0">Seleccionar...</option>';
        }else{
            $componentes.= $lib->options_tabla('componentes_compromiso',$id,'cp.iIdCompromiso = '.$id.'');
        }
        
        echo $componentes;
    }

    //Valida los entregables
    public function validar_entregables($id_detalleactividad){

        return $this->me->mostrar_detalleentregable($id_detalleactividad);
    }

    //Muestra la pantalla de ponderacion
    public function showponderacion(){

        if(isset($_POST['id']) && isset($_POST['id2'])){

            $id_detent = $this->input->post('id');
            $id_detact = $this->input->post('id2');

            $data['contenido'] = $this->crear_vista($id_detent,$id_detact);

            $this->load->view('entregables/contenido_ponderacion',$data);
        }else{

            $id_detact = $this->input->post('id2');

            $data['contenido'] = $this->crear_vista(null,$id_detact);

            $this->load->view('entregables/contenido_ponderacion',$data);
        }
    }

    //Crea la vista principal de las ponderaciones
    public function crear_vista($id_detent,$id_detact){

        $ponderacion_actual = $this->me->mostrar_ponderacion_actual($id_detent);

        $str = '<div class="col-12">
                    <div class="card">
                        <div class="card-body">
                         <form class="needs-validation was-validated" onsubmit="guardarPonderacion(this,event);">';

                         if($id_detent != NULL){

                            $str.='<div class="row">
                                <div class="col-md-12">
                                    <h5 class="card-title">Ponderación del entregable actual</h5>
                                </div>
                                <table class="table table-bordered table-striped ">
                                    <thead>
                                        <tr>
                                            <th>Entregable</th>
                                            <th>Unidad de medida</th>
                                            <th>Ponderación</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>'.$ponderacion_actual->vEntregable.'</td>
                                            <td>'.$ponderacion_actual->vUnidadMedida.'</td>
                                            <td><input class="text-center ponderacion" type="text" name="val['.$ponderacion_actual->iIdDetalleEntregable.']" id="" value="'.$ponderacion_actual->iPonderacion.'" onkeyup="sumar();"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <br>
                            <div class="dropdown-divider"></div>
                            <br>';

                            $ponderaciones = $this->me->mostrar_ponderaciones($id_detact,$ponderacion_actual->iIdDetalleEntregable);
                            $titulo = 'Otras ponderaciones';
                        }else{
                            $ponderaciones = $this->me->mostrar_ponderaciones($id_detact);

                            $titulo = 'Ponderaciones';

                            $str.='<div class="row">
                                <div class="col-md-10 mb-3">                                    
                                </div>
                                <div class="col-md-2 mb-3">
                                    <button class="btn btn-light" type="button" onclick="regresarmodulo()"><i class="mdi mdi-arrow-left">Regresar</i></button>                                  
                                </div>
                                </div>';
                        }                       

                        $str.='<div class="row">
                                <div class="col-md-12">
                                    <h5 class="card-title">'.$titulo.'</h5>
                                </div>
                                <table class="table table-bordered table-striped ">
                                    <thead>
                                        <tr>
                                            <th>Entregable</th>
                                            <th>Unidad de medida</th>
                                            <th>Ponderación</th>
                                        </tr>
                                    </thead>
                                    <tbody>';
                            foreach($ponderaciones as $value){
                                $str.= '<tr>
                                            <td>'.$value->vEntregable.'</td>
                                            <td>'.$value->vUnidadMedida.'</td>
                                            <td><input class="text-center ponderacion" type="text" name="val['.$value->iIdDetalleEntregable.']" id="" value="'.$value->iPonderacion.'" onkeyup="sumar();"></td>
                                        </tr>';
                            }
                             $str.='</tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                </div>
                                <div class="col-md-4">
                                    <input type="hidden" name="totalponderacion" id="totalponderacion" value="">
                                    <label>Total de ponderaciones: </label> <label id="total"></label>
                                </div>
                                <div class="col-md-2">
                                
                                </div>
                            </div>
                            <br>
                            <center>
                                <button class="btn waves-effect waves-light btn-success" type="submit">Guardar</button>
                            </center>
                        </form>
                        </div>
                    </div>
                </div>';

        return $str;
    }

    //Guarda las ponderaciones de los entregables
    public function restart_ponderacion(){

        $var = $_POST['val'];
        $ponderacion = $this->input->post('totalponderacion');

        if($ponderacion >100){

            echo 'mayor';
        }
        if($ponderacion < 100){

            echo 'menor';
        }
        if($ponderacion == 100){

            foreach($var as $valor => $value){

                $id_detent = $valor;
                $data['iPonderacion'] = $value;

                $this->me->modificar_detalleentregable($id_detent,$data);
            }
            echo 'correcto';
        }
    }

    //Muestra la vista de municipalizacion
    public function create_municipalizacion(){

        $data['contenido'] = $this->vista_municipalizacion();
        $this->load->view('entregables/contenido_municipalizacion',$data);

    }

    //Crea la vista principal de municipalizacion
    public function vista_municipalizacion(){

        $str = '<div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4 class="card-title">Municipalización</h4>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-light" type="submit" onclick="regresarmodulo()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                                </div>
                            </div>
                            <br>
                            <br>
                            <form class="needs-validation was-validated" onsubmit="guardarMunicipalizacion(this,event);">
                                <div class="row">
                                    <div class="col-md-12">';

                                $entregable = $this->me->mostrar_entregable_actual($_POST['id']);
                                
                                $str.='<h5 class="card-title">Entregable: '.$entregable->vEntregable.'</h5>
                                    </div>
                                    <table class="table table-bordered table-striped ">
                                        <thead>
                                            <tr>
                                                <th>Municipio</th>
                                                <th>Meta anual del municipio</th>
                                                <th>Unidad de medida</th>
                                            </tr>
                                        </thead>
                                        <tbody>';

                                        $municipios = $this->me->mostrar_municipios();

                                        foreach($municipios as $value){

                                            $metas = $this->me->mostrar_metas_municipios($value->iIdMunicipio,$entregable->iIdDetalleEntregable);

                                            if($metas != NULL){
                                                $meta = $metas->nMeta;
                                            }else{
                                                $meta = NULL;
                                            }
                                            
                                         $str.='<tr>
                                                <td>'.$value->vMunicipio.'</td>
                                                <td><input class="text-center ponderacion" type="text" name="val['.$value->iIdMunicipio.']" id="" value="'.$meta.'" onkeyup="sumar();"></td>
                                                <td>'.$entregable->vUnidadMedida.'</td>
                                            </tr>';
                                        }
                             $str.='</tbody>
                                    </table>
                                </div>                               
                                <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4 text-center">
                                    <input type="hidden" name="metaanual" id="metaanual" value="'.$entregable->nMeta.'">
                                    <label>Meta anual: </label> <label>'.$entregable->nMeta.'</label>
                                </div>
                                <div class="col-md-4 text-center">
                                    <input type="hidden" name="totalmeta" id="totalmeta" value="">
                                    <label>Suma de metas: </label> <label id="total"></label>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                            <br>
                                <center>
                                    <input type="hidden" name="id_detent" id="id_detent" value="'.$entregable->iIdDetalleEntregable.'">
                                    <button class="btn waves-effect waves-light btn-success" type="submit">Guardar</button>
                                </center>
                            </form>
                        </div>
                    </div>
                </div>';

        return $str;
    }

    //Metodo para insertar los entregables en base a un municipio
    public function insert_municipalizacion(){

        if(isset($_POST['metaanual']) && isset($_POST['totalmeta']) && isset($_POST['id_detent'])){

            $metaanual = $this->input->post('metaanual');
            $sumameta = $this->input->post('totalmeta');
            
            if($sumameta == $metaanual){

                $var = $_POST['val'];
                $id_detent = $this->input->post('id_detent');
                
                if($this->me->validar_entregablemunicipio($id_detent)){

                    $this->me->eliminar_entregablemunicipio($id_detent);

                }
                
                foreach($var as $valor => $value){

                    if($value != NULL){

                        $table='DetalleEntregableMetaMunicipio';

                        $data['iIdDetalleEntregable'] = $id_detent;
                        $data['iIdMunicipio'] = $valor;
                        $data['nMeta'] = $value;

                        $this->me->guardar_entregablemunicipio($table,$data);  

                    }                   
                }
                echo 'correcto';
            }
            if($sumameta > $metaanual){
                echo 'mayor';
            }
            if($sumameta < $metaanual){
                echo 'menor';
            }           
        }else{
            echo 'error';
        }
    }

    //Funcion para crear la vista de la tabla de entregables
    public function vista_tabla_entregables($id_detact){

        $str='<div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                                    <thead>
                                        <tr>
                                            <th>Entregable</th>
                                            <th>Unidad de medida</th>
                                            <th>Periodicidad</th>
                                            <th>¿Mismos beneficios en cada periodo?</th>
                                            <th>Municipalizable</th>
                                            <th>Sujeto afectado</th>
                                            <th>¿Presenta alineación a compromiso?</th>
                                            <th width="160px"> </th>
                                        </tr>
                                    </thead>
                                    <tbody>';
                                    $consulta = $this->me->mostrar_entregables($id_detact);
                                
                                        foreach($consulta as $value){
                                            $contenido = "'¿Esta usted seguro?',EliminarEntregable,'$value->iIdEntregable'";
                                $str.=  '<tr>
                                            <td>'.$value->vEntregable.'</td>
                                            <td>'.$value->vUnidadMedida.'</td>
                                            <td>'.$value->vPeriodicidad.'</td>';

                                            if($value->iMismosBeneficiarios == 1){
                                                $beneficiario = 'Si';
                                            }else{
                                                $beneficiario = 'No';
                                            }
                                            if($value->iMunicipalizacion == 1){
                                                $municipalizacion = 'Si';
                                            }else{
                                                $municipalizacion = 'No';
                                            }

                                    $compromisos =$this->me->mostrar_entregablecomponente($value->iIdEntregable);

                                            if($compromisos != NULL){
                                                $compromiso = 'Si';
                                            }else{
                                                $compromiso = 'No';
                                            }
                                    
                                    $str.= '<td>'.$beneficiario.'</td>
                                            <td>'.$municipalizacion.'</td>
                                            <td>'.$value->vSujetoAfectado.'</td>
                                            <td>'.$compromiso.'</td>
                                            <td>
                                                <button type="button" class="btn btn-circle waves-effect waves-light btn-warning" onclick="modificar_entregable('.$value->iIdEntregable.')"><i class="mdi mdi-border-color"></i></button>
                                                <button type="button" class="btn btn-circle waves-effect waves-light btn-danger"><i class="mdi mdi-close" onclick="confirmar('.$contenido.')"></i></button>';  
                                                
                                            if($value->iMunicipalizacion == 1){
                                                $str.= '<button type="button" class="btn btn-circle waves-effect waves-light btn-success" data-toggle="tooltip" data-placement="top" title="Municipalización" onclick="municipalizacion('.$value->iIdEntregable.')"><i class="mdi mdi-garage"></i></button>';
                                            }

                                        $str.='<button type="button" class="btn btn-circle waves-effect waves-light btn-info"><i        class="mdi mdi-trending-up" onclick=""></i></button>';

                                      $str.='</td>
                                        </tr>';
                                        }
                                $str.='</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>';

            return $str;
    }

    //Funcion para eliminar
    public function delete(){

        if(isset($_POST['id'])){

            $id_ent = $this->input->post('id');

            $where = "iIdEntregable =".$id_ent;
            $table = 'Entregable';
            $table2 = 'DetalleEntregable';
            $data['iActivo'] = 0;

            if($this->me->eliminacion_generica($where,$table,$data)){

                $resultado = $this->me->eliminacion_generica($where,$table2,$data);
                echo $resultado;
            }

        }else{
            echo "error";
        }
    }
}

?>