<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-10">
                    <h4 class="card-title">Permisos especiales</h4>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-light" type="submit" onclick="regresar()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                </div>
            </div>
            <br><br>
            <form class="needs-validation" onsubmit="guardarPermisos(this,event);">
                <div class="row">
                    <div class="col-md-10">
                        
                    </div>
                    <div class="col-md-2">
                        <button data-toggle="tooltip" data-placement="top" title="Reestablecer" id="btnreestablecer" disabled="true" type="button" class="btn waves-effect waves-light btn-light" onclick="reestablecer('¿Esta usted seguro(a)?','<?= $mensaje ?>',ReestablecerPermisos,<?= $id_us ?>)"><i class="mdi mdi-restart"></i></button>
                    </div>
                </div>
                <?= $menu ?>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});	
</script>
<script>
   $(document).ready(function() {
        if($('#validacionbtn').val() == 1){
            $("#btnreestablecer").removeAttr('disabled');
        }
    });
</script>
<script>
    function guardarPermisos(f,e){
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?=base_url()?>C_usuarios/restart", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
              if(resp == "correcto"){
                
                regresar();
                alerta('Guardado exitosamente','success');

              }if(resp == "error"){

                alerta('Error al guardar','error');
              }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
              
            }
        });
    }
</script>

<script>
function changecheck(idcheck,id,idpermisopadre){
    $("#"+idcheck).on('click change', function(e) {
        $("#val"+id).val(1);
        $("#guardarpermisos").removeAttr('disabled');

        if(idpermisopadre != 0){

            if($("#rbt1"+idpermisopadre).is(':checked') || $("#rbt2"+idpermisopadre).is(':checked') || $("#rbt3"+idpermisopadre).is(':checked')){               

            }else{
                $("#rbt2"+idpermisopadre).prop("checked", true);
            }
        }
    });
}  
</script>

<script>
    function reestablecer(titulo,mensaje,funcion,var1){
            //event.preventDefault();
            var1 = var1 || '';
            swal({
                title: titulo,
                text: mensaje,
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
</script>

<script>
    function ReestablecerPermisos(id) {
        event.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_usuarios/restore", //Nombre del controlador
            data: {
                'id': id
            },

            success: function(resp) {
                if (resp == true) {
                    
                    regresar();
                    alerta('Restauración exitosa', 'success');

                } else {
                    alerta('Error al restaurar', 'error');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>