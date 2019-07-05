<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_usuarios extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        $this->load->model('M_usuarios','mu');
        $this->load->library('Class_options');
        //$this->load->model('M_seguridad','ms');
    }

    //Muestra la vista principal
    public function index()
    {
        $lib = new Class_options();

        $data['roles'] = $lib->options_tabla('roles');
        $data['consulta'] = $this->mu->mostrar_usuarios();    
    	$this->load->view('usuarios/principal',$data);
    }

     //Muestra la pagina para agregar usuarios
    public function create(){

        $lib = new Class_options();

        $data['dependencias'] = $lib->options_tabla('dependencias');
        $data['roles'] = $lib->options_tabla('roles');
        $data['formacion_academica'] = $lib->options_tabla('formacion_academica');
        $data['nivel_academico'] = $lib->options_tabla('maximo_nivel_academico');

        $this->load->view('usuarios/contenido_agregar',$data);
    }

    //Funcion para insertar
    public function insert(){

        if(isset($_POST['dependencia']) && isset($_POST['nombre']) && isset($_POST['correoinst'])&& 
        isset($_POST['nombreusuario']) && isset($_POST['rol']) && isset($_POST['apepat']) 
        && isset($_POST['correopersonal']) && isset($_POST['contrasenia']) && isset($_POST['formacionacademica']) 
        && isset($_POST['apemat']) && isset($_POST['telefono']) && isset($_POST['confirmarcontrasenia']) 
        && isset($_POST['maxnivelacademico']) && isset($_POST['cargo']) && isset($_POST['celular']) 
        && isset($_POST['fechanc'])){

            $data = array();

            $data['iIdDependencia'] = $this->input->post('dependencia');
            $data['vNombre'] = $this->input->post('nombre');
            $data['vCorreo'] = $this->input->post('correoinst');
            $data['vUsuario'] = $this->input->post('nombreusuario');
            $data['iIdRol'] = $this->input->post('rol');
            $data['vPrimerApellido'] = $this->input->post('apepat');
            $data['vCorreoPersonal'] = $this->input->post('correopersonal');
            $data['vPassword'] = sha1($this->input->post('contrasenia'));
            $data['iIdFormacionAcademica'] = $this->input->post('formacionacademica');
            $data['vSegundoApellido'] = $this->input->post('apemat');
            $data['vTelefono'] = $this->input->post('telefono');
            //$data['iAnio'] = $this->input->post('confirmarcontrasenia');
            $data['iIdMaxNivelAcademico'] = $this->input->post('maxnivelacademico');
            $data['vCargo'] = $this->input->post('cargo');
            $data['vCelular'] = $this->input->post('celular');
            $data['dFechaNacimiento'] = $this->input->post('fechanc');
            $data['dFechaRegistro'] = date("Y-m-d");
            $data['iActivo']= 1;

            $validarus = $this->validar_usuario($data['vUsuario']);

            if($validarus == TRUE){

                $this->mu->guardar_usuario($data);

                echo "correcto";

            }else{
                echo "validar_usuario";
            }           
            
        }else{
            //Mensaje en caso de que no reciba el POST
            echo "error";
        }
    }

    //Muestra la pantalla de edicion para el update
    public function edit(){

        if(isset($_POST['id'])){

            $id = $_POST['id'];
            
            $lib = new Class_options();

            $data['consulta'] = $this->mu->preparar_update($id);
            $data['dependencias'] = $lib->options_tabla('dependencias');
            $data['roles'] = $lib->options_tabla('roles');
            $data['formacion_academica'] = $lib->options_tabla('formacion_academica');
            $data['nivel_academico'] = $lib->options_tabla('maximo_nivel_academico');  

            $this->load->view('usuarios/contenido_modificar',$data);

        }else{
            echo "No recibe la variable";
        }       
    }

    public function editpassword(){

        if(isset($_POST['id'])){

            $id = $_POST['id'];

            $data['consulta'] = $this->mu->preparar_update($id); 

            $this->load->view('usuarios/modificar_password',$data);

        }else{
            echo "No recibe la variable";
        }  

    }

    //Funcion para modificar
    public function update(){

        if(isset($_POST['id']) && isset($_POST['dependencia']) && isset($_POST['nombre']) 
        && isset($_POST['nombreusuario']) && isset($_POST['rol']) && isset($_POST['apepat']) 
        && isset($_POST['correopersonal']) && isset($_POST['formacionacademica']) && isset($_POST['apemat']) 
        && isset($_POST['telefono']) && isset($_POST['maxnivelacademico']) && isset($_POST['cargo']) 
        && isset($_POST['celular']) && isset($_POST['fechanc']) && isset($_POST['correoinst'])){

            $data = array();

            $id = $this->input->post('id');
            $data['iIdDependencia'] = $this->input->post('dependencia');
            $data['vNombre'] = $this->input->post('nombre');
            $data['vCorreo'] = $this->input->post('correoinst');
            $data['vUsuario'] = $this->input->post('nombreusuario');
            $data['iIdRol'] = $this->input->post('rol');
            $data['vPrimerApellido'] = $this->input->post('apepat');
            $data['vCorreoPersonal'] = $this->input->post('correopersonal');
            //$data['vPassword'] = sha1($this->input->post('contrasenia'));
            $data['iIdFormacionAcademica'] = $this->input->post('formacionacademica');
            $data['vSegundoApellido'] = $this->input->post('apemat');
            $data['vTelefono'] = $this->input->post('telefono');
            //$data['iAnio'] = $this->input->post('confirmarcontrasenia');
            $data['iIdMaxNivelAcademico'] = $this->input->post('maxnivelacademico');
            $data['vCargo'] = $this->input->post('cargo');
            $data['vCelular'] = $this->input->post('celular');
            $data['dFechaNacimiento'] = $this->input->post('fechanc');
            $data['dFechaRegistro'] = date("Y-m-d");
            $data['iActivo']= 1;

            $resultado = $this->mu->modificar_usuario($id,$data);

            echo $resultado;

        }else{
            //Mensaje en caso de que no reciba el POST
            echo "Falla algo";
        }
    }

    //Funcion para modificar la contraseña
    public function updatepass(){

        if(isset($_POST['id']) && isset($_POST['excontrasenia']) && isset($_POST['newcontrasenia']) && isset($_POST['confcontrasenia'])){

            $id = $this->input->post('id');
            $pass_old = SHA1(trim($this->input->post('excontrasenia')));
            $pass_new = SHA1(trim($this->input->post('newcontrasenia')));
            $pass_conf = SHA1(trim($this->input->post('confcontrasenia')));

            if($this->mu->validar_password($pass_old,$id) == TRUE){

                if($pass_new == $pass_conf){

                    $data = array();

                    $data['vPassword'] = sha1($pass_new);

                    $this->mu->modificar_usuario($id,$data);

                    echo "correcto";

                }

            }else{
                echo "contraseña incorrecta";
            }

        }else{
            //Mensaje en caso de que no reciba el POST
            echo "Falla algo";
        }
    }

    //Funcion para eliminar
    public function delete(){

        if(isset($_POST['id'])){

            $id = $_POST['id'];

            $resultado = $this->mu->eliminar_usuario($id);

            echo $resultado;

        }else{
            echo "algo salio mal";
        }
    }

    //Funcion de busquedas
    public function search(){

        $rol = $usuario = null;
        if(isset($_POST['usuario']) && !empty($_POST['usuario'])){

            $usuario = $_POST['usuario'];
        }
        
        if(isset($_POST['rol']) && !empty($_POST['rol'])){

            $rol = $_POST['rol'];
        }
       
        $data['consulta'] = $this->mu->mostrar_usuarios($usuario, $rol);
        $this->load->view('usuarios/contenido_tabla',$data);
    }

    //Valida si el correo ingresado exite en la base de datos
    public function validar_usuario($us){

        $resultado = $this->mu->validar_usuario($us);

        return $resultado;

    }

}
?>