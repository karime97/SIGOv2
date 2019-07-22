<?php
defined('BASEPATH') or exit('No direct script access allowed');


class C_pat extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_pat', 'pat');
    }

    public function index()
    {
        $data['actividad'] = $this->pat->mostrar_act();
        $this->load->view('PAT/inicio_PAT', $data);
    }

    public function cargar()
    {
        $this->load->view('PAT/agregar_actividad');
    }

    public function gettable()
    {
        $year = $keyword = null;
        if (isset($_POST['keyword']) && !empty($_POST['keyword'])) {
            $keyword = $_POST['keyword'];
        }

        if (isset($_POST['year']) && !empty($_POST['year'])) {
            $year = $_POST['year'];
        }

        $data['actividad'] = $this->pat->mostrar_act($keyword, $year);
        $this->load->view('PAT/vTablaAct', $data);
    }

    public function editEje()
    {
        $data2['eje'] = $this->pat->mostrarEje();

        $this->load->view('PAT/editar_actividad', $data2);
    }

    public function edit()
    {
        $_SESSION['carritoSelec'] = null;
        $_SESSION['carritoFinan'] = null;
        $_SESSION['carritoUbpP'] = null;
        $data3['eje'] = $this->pat->mostrarEje();
        if (isset($_POST['id'])) {
            $id = $_POST['id'];

            $data3['finan'] = $this->pat->mostrarFinanciamiento();
            $data3['ubp'] = $this->pat->mostrarUbp();
            $data3['consulta'] = $this->pat->preparar_update($id);
            $this->load->view('PAT/editar_actividad', $data3);
        }
    }

    public function actualizarActividad(){
        if(isset($_POST['id']) && isset($_POST['NombAct'])) {
            
            $id = $_POST['id'];

            $data = array(
                'vActividad' => $this->input->post('NombAct')
            );

            $resul = $this->pat->modificarAct($id, $data);
            echo $resul;
        }else {
            echo "No funcionó";
        }
    }

    public function actualizarDeatalleActividad(){
        if(isset($_POST['id']) && isset($_POST['NombAct']) && isset($_POST['annio'])) {
            
            $id = $_POST['id'];

            $data = array(
                'iIdActividad' => $this->input->post('NombAct'),
                'iAnio' => $this->input->post('annio')
            );

            $resul = $this->pat->modificarDetaAct($id, $data);
            echo $resul;
        }else {
            echo "No funcionó";
        }
    }

    ////////////////

    public function dPoliPub($eje)
    {
        //$eje = 0;

        /*if (!empty($_POST['eje']) && $_POST['eje'] != '0') {
            $eje = $_POST['eje'];
        }
        echo $eje;*/
        $PolPub = $this->pat->mostrarPpublica($eje);
        $opc = '<option value="0">Seleccione...</option>';
        foreach ($PolPub as $value) {
            $opc .= "<option value='$value->iIdTema'>$value->vTema</option>";
        }
        echo $opc;
    }

    public function dObjetivo($popu)
    {
        $Obj = $this->pat->mostrarObjetivo($popu);
        $opc = '<option value="0">Seleccione...</option>';
        foreach ($Obj as $value) {
            $opc .= "<option value='$value->iIdObjetivo'>$value->vObjetivo</option>";
        }
        echo $opc;
    }

    public function dEstrategia($obj)
    {
        $est = $this->pat->mostrarEstrategia($obj);
        $opc = '<option value="0">Seleccione...</option>';
        foreach ($est as $value) {
            $opc .= "<option value='$value->iIdEstrategia'>$value->vEstrategia</option>";
        }
        echo $opc;
    }

    public function dLineaAccion($est)
    {
        $la = $this->pat->mostrarLineaAccion($est);
        $opc = '<option value="0">Seleccione...</option>';
        foreach ($la as $value) {
            $opc .= "<option value='$value->iIdLineaAccion'>$value->vLineaAccion</option>";
        }
        echo $opc;
    }

    public function insertarAct()
    {
        //$sesion = $_SESSION[PREFIJO.'_iddependencia'];
        if (isset($_POST['NombAct'])) {
            $data = array(
                'vActividad' => $this->input->post('NombAct'),
                'iIdDependencia' => (int) $_SESSION[PREFIJO . '_iddependencia']
            );

            $idAct = $this->pat->agregarAct($data);
            //$data1['iIdActividad'] = $this->pat->agregarAct($data);
            //$this->pat->agregarDetAct($data1);

            if ($idAct > 0) {
                $data1 = array(
                    'iIdActividad' => $idAct,
                    'iAnio' => $this->input->post('annio')
                );
                $insert = $this->pat->agregarDetAct($data1);

                echo $insert;
            }
        }
    }

    /* Guardar edición */

    public function guardarAct()
    {
        if (isset($_POST['NombAct']) && isset($_POST['objGeneral']) && isset($_POST['descripcion'])) {

            $id = $_POST['id'];
            
            $data = array(
                'vActividad' => $this->input->post('NombAct'),
                'vObjetivo' => $this->input->post('objGeneral'),
                'vDescripcion' => $this->input->post('descripcion'),
                'iIdDependencia' => (int) $_SESSION[PREFIJO . '_iddependencia']
            );

            $idAct = $this->pat->modificarAct($data);

            if ($idAct > 0) {
                $data1 = array(
                    'iIdActividad' => $idAct,
                    'iAnio' => $this->input->post('annio'),
                    'dInicio' => $this->input->post('fINICIO'),
                    'dFin' => $this->input->post('fFIN')
                );
                $idDetAct = $this->pat->modificarDetaAct($data1);
            }

            if ($idAct > 0) {
                $data1 = array(
                    'iIdActividad' => $idAct,
                    'iIdLineaAccion' => $this->input->post('linAcc')
                );

                $actLA = $_SESSION['carritoSelec'];

                foreach($actLA as $la ){
                    $LinAcc['iIdActividad'] = $idAct;
                    $LinAcc['iIdLineaAccion'] = $this->input->post('linAcc');

                    $insert = $this->pat->agregarActLineaAcc($LinAcc);
                }

                echo $insert;
            }

            if ($idDetAct > 0) {
                $data1 = array(
                    'iIdDetalleActividad' => $idDetAct,
                    'iIdFinanciamiento' => $this->input->post('fuenteF'),
                    'monto' => $this->input->post('montoF')
                );

                $actFin = $_SESSION['carritoFinan'];

                foreach($actFin as $Af ){
                    $fin['iIdDetalleActividad'] = $idDetAct;
                    $fin['iIdFinanciamiento'] = $this->input->post('fuenteF');
                    $fin['monto'] = $this->input->post('montoF');

                    $insert2 = $this->pat->agregarActFinanciamiento($fin);
                }

                echo $insert2;
            }

            if ($idDetAct > 0) {
                $data1 = array(
                    'iIdDetalleActividad' => $idDetAct,
                    'iIdUbp' => $this->input->post('NumUBP')
                );

                $ActUbp = $_SESSION['carritoUbpP'];

                foreach($ActUbp as $Au ){
                    $UBP['iIdDetalleActividad'] = $idDetAct;
                    $UBP['iIdUbp'] = $this->input->post('NumUBP');
                    
                    $insert3 = $this->pat->agregarActUBP($UBP);
                }

                echo $insert3;
            }
        }
    }

    /* Carrito de selectores */

    public function carritoSelectores()
    {
        $data = array();
        $result = 0;
        $existe = false;
        $key = $_POST['linAcc'];
        if (!is_null($_SESSION['carritoSelec'])) {
            $data = $_SESSION['carritoSelec'];
        }
        if (isset($_POST['linAcc'])) {
            foreach ($data as $r) {
                if ($r->iIdLineaAccion == $key) {
                    $existe = true;
                    if ($r->iActivo == 1) {
                        $result = 0;
                        break;
                    } else {
                        $r->iActivo = 1;
                        $result = 1;
                        break;
                    }
                }
            }
            if ($existe === false) {
                $instrumento = $this->pat->getRecord($key);
                if (isset($instrumento[0])) {
                    $instrumento = $instrumento[0];
                    $instrumento->iActivo = 1;
                    $data[] = $instrumento;
                    $result = 1;
                }
            }
        }
        echo json_encode($result);
        $_SESSION['carritoSelec'] = $data;
        //print_r($data);
    }

    public function removecarritoSelectores()
    {
        $data = array();
        $result = 0;
        $key = $_POST['linAcc'];
        if (isset($_SESSION['carritoSelec']) && !empty($_SESSION['carritoSelec'])) {
            $data = $_SESSION['carritoSelec'];
            foreach ($data as $r) {
                if ($r->iIdLineaAccion == $key) {
                    $r->iActivo = 0;
                    $result = 1;
                    break;
                }
            }
        }
        echo json_encode($result);
    }

    public function generar_tabla()
    {
        $data = array();
        if (!is_null($_SESSION['carritoSelec'])) {
            $data = $_SESSION['carritoSelec'];
        }
        $row = '';

        foreach ($data as $r) {
            if ($r->iActivo === 1) {
                $row .= '<tr>
                <td>' . $r->vEje . '</td>
                <td>' . $r->vTema . '</td>
                <td>' . $r->vObjetivo . '</td>
                <td>' . $r->vEstrategia . '</td>
                <td>' . $r->vLineaAccion . '</td>
                <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick="eliminarCarrito(' . $r->iIdLineaAccion . ')"><i class="mdi mdi-close"></i></button></td>
            </tr>';
            }
        }
        $tb = '<table class="table table-striped table-bordered display" style="width:100%" id="grid3">
        <thead>
            <tr>
                <th>Eje</th>
                <th>Politica pública</th>
                <th>Objetivo</th>
                <th>Estrategia</th>
                <th>Linea de accion</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            ' . $row . '
        </tbody>
    </table>
    <script>
    $(document).ready(function() {
        $("#grid3").DataTable();
    });
    </script>
    ';
        echo $tb;
    }

    /* Carrito de financiamiento */

    public function carritoFinanciamiento()
    {
        $data = array();
        $result = 0;
        $existe = false;
        $key = $_POST['fuenteF'];
        if (!is_null($_SESSION['carritoFinan'])) {
            $data = $_SESSION['carritoFinan'];
        }
        if (isset($_POST['fuenteF'])) {
            foreach ($data as $r) {
                if ($r->iIdFinanciamiento == $key) {
                    $existe = true;
                    if ($r->iActivo == 1) {
                        $result = 0;
                        break;
                    } else {
                        $r->iActivo = 1;
                        $result = 1;
                        break;
                    }
                }
            }
            if ($existe === false) {
                $instrumento = $this->pat->getFinanciamiento($key);
                if (isset($instrumento[0])) {
                    $instrumento = $instrumento[0];
                    if (isset($_POST['montoF'])) {
                        $instrumento->montoFinan = $_POST['montoF'];
                    } else {
                        $instrumento->montoFinan = null;
                    }
                    $instrumento->iActivo = 1;
                    $data[] = $instrumento;
                    $result = 1;
                }
            }
        }
        echo json_encode($result);
        $_SESSION['carritoFinan'] = $data;
        //print_r($data);
    }

    public function removecarritoFinanciamiento()
    {
        $data = array();
        $result = 0;
        $key = $_POST['fuenteF'];
        if (isset($_SESSION['carritoFinan']) && !empty($_SESSION['carritoFinan'])) {
            $data = $_SESSION['carritoFinan'];
            foreach ($data as $r) {
                if ($r->iIdFinanciamiento == $key) {
                    $r->iActivo = 0;
                    $result = 1;
                    break;
                }
            }
        }
        echo json_encode($result);
    }

    public function sumaMonto()
    {
        $suma = 0;
        $suma2 = 0;
        $data = array();
        if (!is_null($_SESSION['carritoFinan'])) {
            $data = $_SESSION['carritoFinan'];
        }
        foreach ($data as $r) {
            $suma = $r->montoFinan;
            $suma += $suma2;
            var_dump($suma2);
        }
    }

    public function tablaFinanciamiento()
    {
        $data = array();
        if (!is_null($_SESSION['carritoFinan'])) {
            $data = $_SESSION['carritoFinan'];
        }
        $row = '';

        foreach ($data as $r) {
            if ($r->iActivo === 1) {
                $row .= '
                <tr>
                <td>' . $r->vFinanciamiento . '</td>
                <td> $' . $r->montoFinan . '</td>
                <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick="eliminarCarritoF(' . $r->iIdFinanciamiento . ')"><i class="mdi mdi-close"></i></button></td>
                </tr>';
            }
        }
        $tb = '<table class="table table-striped table-bordered display" style="width:100%" id="grid">
        <thead>
            <tr>
                <th>Nombre de la fuente de financiamiento</th>
                <th>Monto</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
        ' . $row . '
        </tbody>
    </table>
    <script>
    $(document).ready(function() {
        $("#grid").DataTable();
    });
    </script>
    ';
        echo $tb;
    }

    /* Carrito de UBP y PP */

    public function carritoUbpsPp()
    {
        $data = array();
        $result = 0;
        $existe = false;
        $key = $_POST['NumUBP'];
        if (!is_null($_SESSION['carritoUbpP'])) {
            $data = $_SESSION['carritoUbpP'];
        }
        if (isset($_POST['NumUBP'])) {
            foreach ($data as $r) {
                if ($r->iIdUbp == $key) {
                    $existe = true;

                    if ($r->iActivo == 1) {
                        $result = 0;
                        break;
                    } else {
                        $r->iActivo = 1;
                        $result = 1;
                        break;
                    }
                }
            }
            if ($existe === false) {
                $instrumento = $this->pat->getUbpsPP($key);
                if (isset($instrumento[0])) {
                    $instrumento = $instrumento[0];
                    $instrumento->iActivo = 1;
                    $data[] = $instrumento;
                    $result = 1;
                }
            }
        }
        echo json_encode($result);
        $_SESSION['carritoUbpP'] = $data;
        //print_r($data);
    }

    public function removecarritoUbpsPp()
    {
        $data = array();
        $result = 0;
        $key = $_POST['NumUBP'];
        if (isset($_SESSION['carritoUbpP']) && !empty($_SESSION['carritoUbpP'])) {
            $data = $_SESSION['carritoUbpP'];
            foreach ($data as $r) {
                if ($r->iIdUbp == $key) {
                    $r->iActivo = 0;
                    $result = 1;
                    break;
                }
            }
        }
        echo json_encode($result);
    }

    public function tablaUbpsPp()
    {
        $data = array();
        if (!is_null($_SESSION['carritoUbpP'])) {
            $data = $_SESSION['carritoUbpP'];
        }
        $row = '';

        foreach ($data as $r) {
            if ($r->iActivo === 1) {
                $row .= '
                <tr>
                    <td>' . $r->vClave . '</td>
                    <td>' . $r->vUBP . '</td>
                    <td>' . $r->iIdProgramaPresupuestario . '</td>
                    <td>' . $r->vProgramaPresupuestario . '</td>
                    <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick="eliminarCarritoUP(' . $r->iIdUbp . ')"><i class="mdi mdi-close"></i></button></td>
                </tr>';
            }
        }
        $tb = '<table class="table table-striped table-bordered display" style="width:100%" id="grid2">
        <thead>
            <tr>
            <th>Número UBP</th>
            <th>Nombre UBP</th>
            <th>Número PP</th>
            <th>Nombre PP</th>
            <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
        ' . $row . '
        </tbody>
    </table>
    <script>
    $(document).ready(function() {
        $("#grid2").DataTable();
    });
    </script>
    ';
        echo $tb;
    }
}
