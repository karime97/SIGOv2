<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_seguridad extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->helper('url');
        //$this->load->library('Class_options');
        $this->load->model('M_seguridad','ms');
    }

    public function index()
    {
    	if(!isset($_SESSION[PREFIJO.'_idusuario']) || empty($_SESSION[PREFIJO.'_idusuario']))
    	{
    		$this->load->view('seguridad/login');
    	}
    	else
    	{
    		$this->mostrar_inicio();
    	}
    	
    }

    function iniciar_sesion()
    {
    	if( isset($_POST['vUsuario']) && isset($_POST['vPassword']) && !empty($_POST['vUsuario']) && !empty($_POST['vPassword']) )
    	{
    		$where['vPassword'] = SHA1(trim($this->input->post('vPassword')));
    		$where['vUsuario'] = trim($this->input->post('vUsuario'));
            if(true)    //  En caso de requerir un captcha o proceso de verificación
            {
                $ms = new M_seguridad();
                $qu = $ms->consulta_existe_usuario($where);
                
                if($qu != false)
                {
                    if($qu->num_rows() > 0)
                    {
                        $du = $qu->row();
                        
                        $_SESSION[PREFIJO.'_idusuario'] = $du->iIdUsuario;
						$_SESSION[PREFIJO.'_idrol'] = $du->iIdRol;
						$_SESSION[PREFIJO.'_rol'] = $du->vRol;
                        $_SESSION[PREFIJO.'_nombre'] = $du->vNombre.' '.$du->vPrimerApellido.' '.$du->vSegundoApellido ;
                        $_SESSION[PREFIJO.'_usuario'] = $du->vUsuario;
                        
                        echo 'correcto';
                    } else echo 'Datos incorrectos';
                } else echo  'Error de conexión';
            } else echo 'Código de verificación incorrecto';
        } else echo 'Acceso denegado';
    }

	function mostrar_inicio()
	{
		$this->load->library('Class_seguridad');
		$seg = new Class_seguridad();

		$inicio = $seg->generar_menu($_SESSION[PREFIJO.'_idusuario']);
		$datos['menu_navegacion'] = $inicio['menu'];
		$this->load->view('inicio',$datos);
	}

	function cerrar_sesion()
	{
		unset($_SESSION[PREFIJO.'_idusuario']);
        unset($_SESSION[PREFIJO.'_idrol']);
        unset($_SESSION[PREFIJO.'_nombre']);
        unset($_SESSION[PREFIJO.'_usuario']);
	} 

	

    public function guardar_usuario()
    {
    	if(isset($_POST) && !empty($_POST))
    	{
    		//	Datos del usuario
    		$dia = $this->input->post('dia');
    		$mes = $this->input->post('mes');
    		$anio = $this->input->post('anio');
    		$fecha_nacimiento = $anio.'-'.$mes.'-'.$dia;
    		$id = 0;
    		$d_usuario = array(
    			'vNombre' => trim($this->input->post('nombre')),
    			'vApellidoPaterno' => trim($this->input->post('apellido_paterno')),
    			'vApellidoMaterno' => trim($this->input->post('apellido_materno')),
    			'dFechaNacimiento' => $fecha_nacimiento,
    			'iGenero' => $this->input->post('genero'),
    			'iIdGradoEstudio' => $this->input->post('id_grado_estudio'),
    			'iIdOcupacion' => $this->input->post('id_ocupacion'),
    			'vCorreo' => $this->input->post('correo'),
    			'iRegistroCon' => 1,
    			'iIdAsentamiento' => $this->input->post('id_asentamiento')
    		);

    		if(isset($_POST['iIdUsuario']) && !empty($_POST['iIdUsuario']))
    		{
    			//	Modificación
    			$iIdUsuario = $this->input->post('iIdUsuario');
    			$d_usuario['iIdRol'] = $this->input->post('id_rol');
    			$con = $this->ms->iniciar_transaccion();
    			$where['iIdUsuario'] = $iIdUsuario;

    			if(!$this->ms->verificar_existe_correo_usuario($d_usuario['vCorreo'],$iIdUsuario))
    			{
	    			$id = $this->ms->actualiza_registro('Usuario',$where,$d_usuario,$con);
	    			$d_usuario['iIdUsuario'] = $iIdUsuario;
	    			//	Datos para la bitácora
		    		$d_log = array( 'vLog' => 'Modificación de usuario', 
		    						'iIdUsuario' => $_SESSION[PREFIJO.'_idusuario'], 
		    						'dFecha' => date('Y-m-d h:i:s'));
		    		$iIdLog = $this->ms->inserta_registro('Log',$d_log,$con);
		    		$d_detalle_log = array(	'iIdLog' => $iIdLog, 
		    								'jDatos' => json_encode($d_usuario),
		    								'vTabla' => 'Usuario',
		    								'vAccion' => 'M'
		    							);
		    		$iIdetallelog = $this->ms->inserta_registro('DetalleLog',$d_detalle_log,$con);
		    		//.-	Datos para la bitácora


	    			if($this->ms->terminar_transaccion($con)) echo 0;
	    			else echo 'Ha ocurrido un error';
	    		}else echo "El correo ya ha sido registrado";

    		}
    		else
    		{

    			if(!$this->ms->verificar_existe_correo_usuario($d_usuario['vCorreo']))
    			{
	    			//	Registro de usuario
	    			$token = $this->generar_token();
	    			$d_usuario['iRegistroCon'] = 1;
	    			$d_usuario['iIdRol'] = (isset($_POST['vista_admin'])) ? $this->input->post('id_rol'):1;
	    			$d_usuario['dFechaRegistro'] = date('Y-m-d H:i:s');	    			
	    			$d_usuario['vContrasenia'] = SHA1($this->input->post('contrasenia'));
	    			$d_usuario['iEstatus'] = 1;	//	Pendiente de confirmación
	    			$d_usuario['vToken'] = $token;

	    			//	Sólo cuando el administrador da de alta al usuario
	    			if(isset($_SESSION[PREFIJO.'_id_rol']))
		    		{
		    			if($_SESSION[PREFIJO.'_id_rol'] == 1)
		    			{
		    				$d_usuario['iRegistroCon'] = 1;
		    			}
		    		}
		    		else
		    		{
		    			//	Registro del ciudadano
		    			$d_usuario['iIdRol'] = 2;	// Rol de ciudadano
		    		}

		    		$con = $this->ms->iniciar_transaccion();

		    		$d_usuario['iIdUsuario'] = $idusuario = $this->ms->inserta_registro('Usuario',$d_usuario,$con);
		    		//	Datos para la bitácora
		    		$d_log = array( 'vLog' => 'Alta de usuario', 
		    						'iIdUsuario' => $_SESSION[PREFIJO.'_idusuario'], 
		    						'dFecha' => date('Y-m-d h:i:s'));
		    		$iIdLog = $this->ms->inserta_registro('Log',$d_log,$con);
		    		
		    		$d_detalle_log = array(	'iIdLog' => $iIdLog, 
		    								'jDatos' => json_encode($d_usuario),
		    								'vTabla' => 'Usuario',
		    								'vAccion' => 'A'
		    							);
		    		$iIdetallelog = $this->ms->inserta_registro('DetalleLog',$d_detalle_log,$con);
		    		//.-	Datos para la bitácora
		    		if($this->ms->terminar_transaccion($con))
		    		{

		    			// Enviar correo de confirmación

		    			$this->load->library('Class_mail');
						$mail = new Class_mail();

						$template = 'templates/confirmar_correo.html';
						$mensaje = file_get_contents($template);
						$nombre = htmlentities($d_usuario['vNombre'], ENT_QUOTES, "UTF-8");
						$url = base_url().'C_seguridad/confirmar_correo?id='.$idusuario.'&token='.$token;
						$mensaje = str_replace('{{var_nombre_dest}}', $nombre, $mensaje);
						$mensaje = str_replace('{{var_url}}', $url, $mensaje);
						
						$asunto = utf8_decode('Confirmación de correo');

		    			if($mail->enviar_correo_gmail($d_usuario['vCorreo'],$asunto,$mensaje)) echo '0';		    			
		    			else echo 'No se ha podido enviar el correo';
		    		}
		    		else
		    		{
		    			echo 500;
		    		}
		    	}
		    	else
		    	{
		    		echo "El correo ya ha sido registrado";
		    	}

    		}
    		
    	}
    }


    public function index_usuarios()
    {
    	$op = new Class_options();
    	$datos['resultado_busqueda'] = $this->listado_usuarios('','',1);
    	$datos['op_roles'] = $op->options_roles(0,'Seleccione un rol');
    	$datos['op_estatus'] = $op->options_estatus_usuario(0,'Seleccione un estatus');

    	$this->load->view('usuarios/index',$datos);
    }

    public function buscar_usuarios()
    {
    	$pag = $this->input->post('pag');
    	$where = '';
    	$palabra = trim($this->input->post('fTitulo'));
    	if($this->input->post('fEstatus') > 0) $where['u.iEstatus'] = $this->input->post('fEstatus');
    	if($this->input->post('fRol') > 0) $where['u.iIdRol'] = $this->input->post('fRol');

    	echo $this->listado_usuarios($where,$palabra,$pag);
    }

    public function listado_usuarios($where='',$palabra='',$pag=1)
	{
		$qc = $this->ms->buscar_usuarios($where,$palabra);
		$listado = '';

		if($qc)
		{
			$paginador = Paginador($qc,$pag);

			if($paginador['total_registros'] > 0)
			{ 

				$listado .= '
               <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th width="100px">ID</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Rol</th>                                    
                                    <th width="200px"></th>
                                </tr>
                            </thead>
                            <tbody>';
                            
                            foreach ($paginador['resultado'] as $dc)
                            {	
                                $icono = '<i class="text-success mdi mdi-account" title="Usuario activo"></i>';
                                if($dc->iEstatus == 1) $icono = '<i class="mdi mdi-account" title="Pendiente de validar su correo"></i>';
                                if($dc->iEstatus == 3) $icono = '<i class="text-danger mdi mdi-account-remove" title="Usuario bloqueado"></i>';

                                $listado .= '<tr>
                                    <td>'.$dc->iIdUsuario.'</td>
                                    <td>'.$icono.'&nbsp;'.$dc->vNombre.' '.$dc->vApellidoPaterno.' '.$dc->vApellidoMaterno.'</td>
                                    <td>'.$dc->vCorreo.'</td>
                                    <td>'.$dc->vRol.'</td>
                                    <td width="300px" align="center">';
                                    if($dc->iEstatus == 1)
                                    {
                                    	$listado .= '<i class="mdi mdi-send" style="cursor:pointer" title="Enviar correo de confirmación" onclick="ReeviarCorreo('.$dc->iIdUsuario.')"></i>&nbsp;';
                                    }
                                    $listado .= '<i class="mdi mdi-lead-pencil" style="cursor:pointer" title="Editar" onclick="CapturarUsuario('.$dc->iIdUsuario.')"></i>&nbsp;';
                                    //$listado .= '<button type="button" class="btn waves-effect waves-light btn-outline-dark" onclick="CapturarUsuario('.$dc->iIdUsuario.');"><i class="mdi mdi-lead-pencil"  ></i>&nbsp;Editar</button>';
                                    
                                if($dc->iIdUsuario != $_SESSION[PREFIJO.'_idusuario'])
                            	{   
                            		if($dc->iEstatus == 3) $listado .= '<i class="mdi mdi-account-check text-success" title="Desbloquear" style="cursor:pointer" onclick="Desbloquear('.$dc->iIdUsuario.');"></i>&nbsp;';
                            		else $listado .= '<i class="mdi mdi-block-helper text-danger" title="Bloquear" style="cursor:pointer" onclick="Bloquear('.$dc->iIdUsuario.');"></i>&nbsp;';
                            		$listado .= '<i class="mdi mdi-delete-forever" title="Eliminar" style="cursor:pointer" onclick="Eliminar('.$dc->iIdUsuario.');"></i>&nbsp;';
                            		//$listado .= '&nbsp;<button type="button" class="btn waves-effect waves-light btn-outline-dark" onclick="Eliminar(\''.$dc->iIdUsuario.'\');"><i class="mdi mdi-delete"></i>&nbsp;Eliminar</button>';
                            	}
                        		$listado .= '</td>
                                </tr>';                        
                            }
                            
                    $listado .='
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12">'.$paginador['botones_paginacion'].'</div>
                    </div>';
            } else $listado = '<p align="center">No se han encontrado resultados para mostrar.</p>';
		}else $listado = '<p align="center">Ha ocurrido un error.</p>';


		return $listado;
	}

	public function capturar_usuario()
	{
		if(isset($_POST['id']))
		{
			$id = $this->input->post('id');
			$op = new Class_options();

			if($id == 0)
			{
				$datos['iIdUsuario'] = $id;
				$datos['vNombre'] = '';
				$datos['vApellidoPaterno'] = '';
				$datos['vApellidoMaterno'] = '';
				$datos['vCorreo'] = '';
				$datos['iIdMunicipio'] = 0;
				$datos['vMunicipio'] = '';
				$datos['iIdLocalidad'] = 0;
				$datos['vLocalidad'] = '';
				$datos['iIdAsentamiento'] = 0;
				$datos['iIdGradoEstudio'] = 0;
				$datos['iIdOcupacion'] = 0;
				$datos['dia'] = 0;
				$datos['mes'] = 0;
				$datos['anio'] = 0;
				$datos['iCodigoPostal'] = '';
				$datos['iIdRol'] = 0;
				$datos['iGenero'] = 0;

			}
			else
			{
				$where['u.iIdUsuario'] = $id;
				$usuario = $this->ms->datos_usuarios($where);
				if($usuario)
				{
					$usuario = $usuario->row();
					foreach ($usuario as $key => $value)
					{
						$datos[$key] = $value;
					}

					$datos['dia'] = substr($datos['dFechaNacimiento'], 8,2);
					$datos['mes'] = substr($datos['dFechaNacimiento'], 5,2);
					$datos['anio'] = substr($datos['dFechaNacimiento'], 0,4);
				}
			}


			$datos['op_grados_estudio'] = $op->options_grados_estudio($datos['iIdGradoEstudio'],'Seleccione un grado de estudio');
			$datos['op_ocupaciones'] = $op->options_ocupaciones($datos['iIdOcupacion'],'Seleccione una ocupación');
			$datos['op_municipios'] = $op->options_municipios($datos['iIdMunicipio'],'Seleccione un municipio');
			$where1['iIdMunicipio'] = $datos['iIdMunicipio'];
			$datos['op_localidades'] = $op->options_localidades($datos['iIdLocalidad'],'Seleccione una localidad',$where1);
			$where2['iIdLocalidad'] = $datos['iIdLocalidad'];
			$datos['op_asentamientos'] = $op->options_asentamientos($datos['iIdAsentamiento'],'Seleccione una colonia',$where2);
			$datos['op_dias'] = $op->options_dias($datos['dia'],'Día');
			$datos['op_meses'] = $op->options_meses($datos['mes'],'Mes');
			$datos['op_anios'] = $op->options_anios($datos['anio'],'Año');
			$datos['op_roles'] = $op->options_roles($datos['iIdRol'],'Seleccione un estatus');

			//var_dump($datos);
			$this->load->view('usuarios/capturar_usuario',$datos);	
		}
		
	}

	function eliminar_usuario()
	{
		if(isset($_POST['id']) && !empty($_POST['id']))
		{
			
			$datos['iEstatus'] = 0;
			$where['iIdUsuario'] = $this->input->post('id');
			$con = $this->ms->iniciar_transaccion();

    		$aux = $this->ms->actualiza_registro('Usuario',$where,$datos,$con);

    		if($this->ms->terminar_transaccion($con))
    		{
    			echo 0;
    		}
    		else
    		{
    			echo 'No fue posible eliminar el usuario';
    		}

		}else echo 'Acceso denegado';
	}

	function bloquear_usuario()
	{
		if(isset($_POST['id']) && !empty($_POST['id']))
		{
			
			$datos['iEstatus'] = 3;
			$where['iIdUsuario'] = $this->input->post('id');
			$con = $this->ms->iniciar_transaccion();

    		$aux = $this->ms->actualiza_registro('Usuario',$where,$datos,$con);

    		if($this->ms->terminar_transaccion($con))
    		{
    			//	Enviamos correo de notificación
    			$this->load->library('Class_mail');
    			$mail = new Class_mail();
    			$usuario = $this->ms->datos_usuarios(array('u.iIdUsuario' => $where['iIdUsuario']));
    			$usuario = $usuario->row();

    			$template = 'templates/usuario_bloqueado.html';
				$mensaje = file_get_contents($template);
				$vNombre = htmlentities($usuario->vNombre, ENT_QUOTES, "UTF-8");
				$mensaje = str_replace('{{var_nombre}}', $vNombre, $mensaje);
				
				$asunto = utf8_decode('Usuario bloqueado');
				$correo_enviado = $mail->enviar_correo_gmail($usuario->vCorreo,$asunto,$mensaje);

				if($correo_enviado)	echo "0"; //	Los cambios fueron guardados
				else echo "1";	//	Los cambios fueron guardados pero los correos no pudieron ser enviados
    		}
    		else
    		{
    			echo 'No fue posible bloquear el usuario';
    		}

		}else echo 'Acceso denegado';
	}

	function desbloquear_usuario()
	{
		if(isset($_POST['id']) && !empty($_POST['id']))
		{
			
			$datos['iEstatus'] = 2;
			$where['iIdUsuario'] = $this->input->post('id');
			$con = $this->ms->iniciar_transaccion();

    		$aux = $this->ms->actualiza_registro('Usuario',$where,$datos,$con);

    		if($this->ms->terminar_transaccion($con))
    		{
    			//	Enviamos correo de notificación
    			$this->load->library('Class_mail');
    			$mail = new Class_mail();
    			$usuario = $this->ms->datos_usuarios(array('u.iIdUsuario' => $where['iIdUsuario']));
    			$usuario = $usuario->row();

    			$template = 'templates/usuario_desbloqueado.html';
				$mensaje = file_get_contents($template);
				$vNombre = htmlentities($usuario->vNombre, ENT_QUOTES, "UTF-8");
				$mensaje = str_replace('{{var_nombre}}', $vNombre, $mensaje);
				
				$asunto = utf8_decode('Usuario desbloqueado');
				$correo_enviado = $mail->enviar_correo_gmail($usuario->vCorreo,$asunto,$mensaje);

				if($correo_enviado)	echo "0"; //	Los cambios fueron guardados
				else echo "1";	//	Los cambios fueron guardados pero los correos no pudieron ser enviados
    		}
    		else
    		{
    			echo 'No fue posible bloquear el usuario';
    		}

		}else echo 'Acceso denegado';
	}

	public function confirmar_correo()
	{
		if( isset($_GET['id']) && !empty($_GET['id']) && isset($_GET['token']) && !empty($_GET['token']) )
		{

			$idusuario = $this->input->get('id');
			$token = $this->input->get('token');

			if($this->ms->consultar_usuario_por_token($idusuario,$token))
			{
				$datos_usuario = array('iEstatus'=>2);
				$where['iIdUsuario'] = $idusuario;
				$con = $this->ms->iniciar_transaccion();

				$this->ms->actualiza_registro('Usuario',$where,$datos_usuario,$con);

				if($this->ms->terminar_transaccion($con))
				{
					$html = '<p>¡Correo confirmado! Redireccionando...</p>
							<script>
								setTimeout(function(){ window.location.href = "'.base_url().'Sitio/login" }, 3000);
							</script>';
					echo $html;
				}
				else echo 'Ha ocurrido un error';

			}else echo 'No se encontró el usuario o ha sido bloquedado por un administrador';
		}
		else
		{
			echo 'Accedo denegado';
		}
	}

	public function recuperar_contrasenia()
	{
		$this->load->view('recuperar_contrasenia');
	}

	public function validar_envio_recuperacion_contrasenia()
	{
		if(isset($_POST['correo']) && !empty($_POST['correo']))
		{

			$correo = $this->input->post('correo');

			$query = $this->ms->consultar_usuario_por_correo($correo);
			if($query)
			{
				if($query->num_rows() == 1)
				{	
					//	Obtenermos los datos del usuario
					$token = $this->generar_token();				
					$where['iIdUsuario'] = $idusuario = $query->row()->iIdUsuario;
					$nombre = $query->row()->vNombre;
					$datos_usuario['vToken'] = $token;

					//	Guardamos el token para enviar el correo
					$con = $this->ms->iniciar_transaccion();

					$this->ms->actualiza_registro('Usuario',$where,$datos_usuario,$con);

					if($this->ms->terminar_transaccion($con))
					{
						//Enviamos el correo

						$template = 'templates/recuperar_contrasenia.html';
						$url = base_url().'C_seguridad/cambiar_contrasenia?id='.$idusuario.'&token='.$token;
						$mensaje = file_get_contents($template);
						$mensaje = str_replace('{{var_url}}', $url, $mensaje);
						$asunto = utf8_decode('Recuperación de contraseña');

						$this->load->library('Class_mail');
						$mail = new Class_mail();

						if($mail->enviar_correo_gmail($correo,$asunto,$mensaje)) echo '0';
						else echo 'No se ha podido enviar el correo, intente de nuevo más tarde';

						/*if( $this->enviar_correo_recuperacion_contrasenia($correo,$nombre,$idusuario,$token) ) echo 0;
						else echo 'No se ha podido enviar el correo, intente de nuevo más tarde';*/
					}


				}else echo 'No se encontró ningún usuario con el correo proporcionado';
			}else echo 500;


		}

	}
	
	public function cambiar_contrasenia()
	{
		if( isset($_GET['id']) && !empty($_GET['id']) && isset($_GET['token']) && !empty($_GET['token']) )
		{

			$datos['idusuario'] = $this->input->get('id');
			$datos['token'] = $this->input->get('token');

			$this->load->view('cambiar_contrasenia',$datos);			
		}
		else
		{
			echo 'Accedo denegado';
		}
	}

	public function actualizar_contrasenia()
	{
		if( isset($_POST['idusuario']) && !empty($_POST['idusuario']) && isset($_POST['token']) && !empty($_POST['token']))
		{
			$datos_usuario = array('vContrasenia' => SHA1($this->input->post('contrasenia')));
			$where['iIdUsuario'] = $this->input->post('idusuario');
			$where['vToken'] = $this->input->post('token');

			$con = $this->ms->iniciar_transaccion();

			$this->ms->actualiza_registro('Usuario',$where,$datos_usuario,$con);

			if($this->ms->terminar_transaccion($con)) echo 0;
			else echo 500;

		}else echo 'Acceso denegado';
	}

	public function verificar_existe_correo()
	{
		if( isset($_POST['correo']) && !empty($_POST['correo']) )
		{
			$correo = $this->input->post('correo');
			if(!$this->ms->verificar_existe_correo_usuario($correo)) echo 0;
			else echo "1";
		}
	}

	public function generar_token()
	{
		$var = rand(100000, 999999);
		return md5($var);
	}

	public function usuario_registrado()
	{
		$this->load->view('usuario_registrado');
	}


	public function enviar_validacion_correo()
	{
		if(isset($_POST['id']) && !empty($_POST['id']))
		{
			$iIdUsuario = $this->input->post('id');
			// Enviar correo de confirmación

			$this->load->library('Class_mail');
			$mail = new Class_mail();
			
			$usuario = $this->ms->datos_usuarios(array('u.iIdUsuario' => $iIdUsuario));
    		$usuario = $usuario->row();

			$template = 'templates/confirmar_correo.html';
			$mensaje = file_get_contents($template);
			$nombre = htmlentities($usuario->vNombre, ENT_QUOTES, "UTF-8");
			$correo = $usuario->vCorreo;
			$token = $usuario->vToken;
			$url = base_url().'C_seguridad/confirmar_correo?id='.$iIdUsuario.'&token='.$token;
			$mensaje = str_replace('{{var_nombre_dest}}', $nombre, $mensaje);
			$mensaje = str_replace('{{var_url}}', $url, $mensaje);
			
			$asunto = utf8_decode('Confirmación de correo');

			if($mail->enviar_correo_gmail($correo,$asunto,$mensaje)) echo '0';		    			
			else echo 'No se ha podido enviar el correo';	
		}
	}
}
