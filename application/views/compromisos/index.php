<div class="container-fluid">

    <div class="row">
        <div class="col-10">
            <div class="card">
                <div class="card-body">
                    <h1 class="page-title">Compromisos</h1>
                    <h6 class="card-subtitle">Administración del catalogo de compromisos </h6>
                    <h4 class="card-title">Búsqueda</h4>
                    <h6 class="card-subtitle"> </h6>
                    <form class="" id="buscarCompromiso"  onsubmit="buscar_compromiso(this,event);">
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="eje">Eje</label>
                                    <select name="eje" id="eje" class="custom-select" onchange="cargarResponsables();">
                                        <option value="0">Todos</option>
                                        <?=$options_ejes;?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="dependencia">Responsable</label>
                                    <select name="dependencia" id="dependencia" class="custom-select">
                                        <option value="0">Todos</option>
                                        <?=$options_dependencias;?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="estatus">Estatus</label>
                                    <select name="estatus" id="estatus" class="custom-select">
                                        <option value="0">Todos</option>
                                        <?=$options_estatus;?>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="eje">Última actualización posterior a:</label>
                                    <input type="date" class="form-control" name="fecha" id="fecha" value="">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="eje">Nombre o número de compromiso:</label>
                                    <input type="text" class="form-control" name="palabra" id="palabra" value="">
                                </div>
                            </div>
                            <div class="col-1">
                                <div class="form-group" style="margin-top: 30px;">
                                    <button type="submit" class="btn waves-effect waves-light" onclick="listar_compromiso_busqueda()">Buscar</button>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="form-group" style="margin-top: 30px;">
                                    <button type="submit" class="btn btn-primary btn-block" onclick="agregar_compromiso()">Nuevo</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-2">
            <div class="card">
                <div class="card-body">
                    <h4 class="page-title">Activar periodod de evaluaciones </h4></br></br></br></br>
					<center>
					<input id="toggle-one" checked type="checkbox"></br></br></br></br>
					</center>
					<script>
  $(function() {
    $('#toggle-one').bootstrapToggle();
  })
</script>
                </div>
            </div>
        </div>
    </div>
	<section id="contenedor">
    <?php
    include_once('tabla.php');
    ?>
    </section>
</div>
<script type="text/javascript">
function cargarResponsables() {
    var valor = $("#eje").val();
    $.post("<?=base_url();?>C_compromisos/cargar_options/", {
        listado: 'responsables',
        valor: valor
    }, function(resultado, status) {

        $('#dependencia option[value!="0"]').remove();
        $('#dependencia').append(resultado);

    });
}
</script>

<script>
    function agregar_compromiso() {
        cargar('<?= base_url() ?>C_compromisos/create', '#contenedor');
    }
    function listar_compromiso(){
        cargar('<?= base_url() ?>C_compromisos/listartablacompromiso', '#contenedor');
    }
    function listar_compromiso_busqueda(){
        cargar('<?= base_url() ?>C_compromisos/listartablacompromiso', '#contenedor','POST', $("#buscarCompromiso").serializeArray());
}

</script>


<script>
    function buscar_compromiso(f,e){
        e.preventDefault();
    //     $.ajax({         
    //         type: "POST",
    //         url: "<?=base_url()?>C_financiamientos/insert", //Nombre del controlador
    //         data: $(f).serialize(),

    //         success: function(resp) {
    //           if(resp > 0){
                
    //             buscarfinanciamiento();
    //             alerta('Guardado exitosamente','success');

    //           } else {
    //             alerta('Error al guardar','error');
    //           }

    //         },
    //         error: function(XMLHttpRequest, textStatus, errorThrown) {
              
    //         }
    //     });
    }

</script>

