<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th>Clave</th>
                                <th>Unidad Básica de Presuspuestación (UBP)</th>
                                <th>Año</th>
                                <th width="150px">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            foreach($consulta as $value){ ?>
                            <tr>
                                <td><?= $value->vClave ?></td>
                                <td><?= $value->vUBP ?></td>
                                <td><?= $value->iAnio ?></td>
                                <td>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-warning " onclick="modificarUBP(<?= $value->iIdUbp ?>)"><i class="mdi mdi-border-color" ></i></button>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-danger " onclick="confirmar('¿Está seguro de eliminar?', eliminarUBP(<?= $value->iIdUbp ?>));"><i class="mdi mdi-close"></i></button>
                                </td>
                             </tr>
                             <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="holi"></div>

<script>
$(document).ready(function () {
        $('#grid').DataTable();
    });

    function alerta(mensaje,tipo){
            switch(tipo){
                case 'success':
                    toastr.success(mensaje, '¡Exito!', { "showMethod": "slideDown", "hideMethod": "slideUp", timeOut: 2000 });    
                    break;
                case 'warning':
                    toastr.warning(mensaje, 'Advertencia', { "showMethod": "slideDown", "hideMethod": "slideUp", timeOut: 2000 });    
                    break;
                case 'error':
                    toastr.error(mensaje, '¡Error!', { "showMethod": "slideDown", "hideMethod": "slideUp", timeOut: 2000 });    
                    break;
                default:
                    toastr.info(mensaje, 'Info', { "showMethod": "slideDown", "hideMethod": "slideUp", timeOut: 2000 });
            }
        }

    function confirmar(mensaje,funcion,var1){
            //event.preventDefault();
            var1 = var1 || '';
            swal({
                title: mensaje,
                /*text: mensaje,*/
                //icon: 'info',
                type: "warning",   
                showCancelButton: true,   
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Confirmar",   
                cancelButtonText: "Cancelar",
            }).then((confirm) => {

                if(confirm.hasOwnProperty('value')){
                    if(var1 != '') funcion(var1);
                    else funcion();
                } 
            });
        }

        function eliminarUBP(key){
                                $.ajax({
                                    type: "POST",
                                    url: "<?= base_url() ?>C_ubps/eliminar",
                                    data: {'key' : key},
                                    //contentType: 'json',
                                    success: function(resp){
                                        if(resp == true){
                                            cargar('<?= base_url()?>C_ubps/regresar','#contenido_modulo');
                                        }else{
                                            alert(resp);
                                        }
                                    },
                                    error: function(XMLHHttRequest, textStatus, errorThrown) {
                                        
                                    }
                                });
                            }
</script>