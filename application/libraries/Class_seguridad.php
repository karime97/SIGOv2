<?php if (!defined('BASEPATH')) exit('No permitir el acceso directo al script');

class Class_seguridad {

    function __construct()
    {
        $CI =& get_instance();
        $CI->load->helper('url');
        $CI->load->model('M_seguridad');
    }

    function generar_menu($idusuario)
    {
        $resp = array('menu'=>'','modulo_inicial'=>'');
        $str = $modulo_inicial = '';
        $id_permiso_ant = 0;
        $modseguridad =  new M_seguridad();
        $menu = $modseguridad->consultar_menu_sistema($idusuario, 0);
        if($menu)
        {
            if($menu->num_rows () > 0)
            {
                $menu = $menu->result();
                
                $str = '<nav class="sidebar-nav">
                            <ul id="sidebarnav">';
                foreach ($menu as $padre)
                {

                    $submenu = $modseguridad->consultar_menu_sistema($idusuario, $padre->iIdPermiso);
                    if($submenu != false && $submenu->num_rows() > 0)
                    {
                        $submenu = $submenu->result();

                        $str.= '<li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-av-timer"></i><span class="hide-menu">'.$padre->vPermiso.'</span></a>';
                        $str.= '<ul aria-expanded="false" class="collapse  first-level">';

                        
                        foreach ($submenu as $hijo)
                        {
                            if($modulo_inicial == '') $modulo_inicial = base_url().$hijo->vUrl;
                            $str.= '<li class="sidebar-item"><a onclick="cargar(\''.base_url().$hijo->vUrl.'\',\'#contenido\');" class="sidebar-link"><i class="mdi mdi-adjust"></i><span class="hide-menu"> '.$hijo->vPermiso.' </span></a></li>';
                        }
               
                        $str.= '</ul>';
                        $str.= '<li>';
                    }
                    else
                    {
                        if($modulo_inicial == '') $modulo_inicial = base_url().$padre->vUrl;
                        $str .= '<li class="sidebar-item">
                                <a class="sidebar-link  waves-effect waves-dark" onclick="Cargar(\''.base_url().$padre->vUrl.'\',\'#contenido\');" aria-expanded="false"><i class="'.$padre->vClass.'"></i><span class="hide-menu">'.$padre->vPermiso.'</span></a>
                            </li>';
                    }
                }

                $str .= '   </ul>
                        </nav>';

            }
        }

        $resp['menu'] = $str;
        $resp['modulo_inicial'] = $modulo_inicial;

        return $resp;
    }
    
    function verifica_permiso($permiso, $id_usuario=0, $id_rol=0)
    {
        $acceso = -1;
        $ms = new Model_seguridad();
        $qp = $ms->verificar_permiso($permiso,$id_usuario,$id_rol);
        if($qp != false)
        {
            foreach ($qp as $d)
            {
              $permisousuario = $d->permiso_usuario;
              $permisorol = $d->permiso_rol;
            }

            if($permisousuario > $permisorol) $acceso = $permisousuario;
            else $acceso = $permisorol;
        }

        return $acceso;
    }
   
    
}