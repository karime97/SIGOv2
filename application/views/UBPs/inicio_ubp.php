<style>
.boton {
    width: 35px;
    height: 40px;
    padding: 10px 0 0 0;
    color: white;
}
</style>
<div id="">
<br><br>
<div class="row">
                    <div class="col-md-12">
                        <div class="card card-body">
                            <h1 class="card-title">UBP's</h1>
                            <h5 class="card-subtitle"> Administración del catálogo de Unidades Básicas de Presupuestación (UBP). </h5>
                            <div class="form-body">
                                    <div class="card-body">
                                        <div class="row p-t-20">
                                            <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label class="control-label">Buscar por palabra clave</label>
                                                        <input type="text" id="firstName" class="form-control" placeholder="">
                                                    </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Año</label>
                                                        <input type="text" id="lastName" class="form-control form-control-danger" placeholder="">
                                                    </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px">Buscar</button>
                                                    <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="capturarUBP()">Agregar</button>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="contenido_modulo" class="content">
            <?php include_once('vTabla.php') ?>
</div>

<script>
     function capturarUBP(){
        cargar('<?= base_url()?>C_ubps/agregar','#contenido_modulo');
    }

    function modificarUBP(id){
        cargar('<?= base_url()?>C_ubps/edit','#contenido_modulo', 'POST', 'id=' + id);
    }

    function regresar(){
        cargar('<?= base_url()?>C_ubps/regresar','#contenido_modulo');
    }
</script>