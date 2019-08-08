<br><br>
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Entregables</h1>
        <h5 class="card-subtitle"> Administración del catálogo de entregables. </h5>
        <div class="row">
            <div class="col-md-1 mb-3"></div>
            <div class="col-md-9 mb-3">
                <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="agregar_entregable(<?= $id_detact ?>)">Agregar</button>
                <button type="button" class="btn waves-effect waves-light btn-success" style="margin-top:35px" onclick="modificar_ponderacion(<?= $id_detact ?>)">Ponderaciones</button>
            </div>
            <div class="col-md-2 mb-3">
                <div class="form-group">
                    <div class="button-group">
                        <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px" onclick="regresar()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="contenedor">
    <?php
    include_once('contenido_tabs.php');
    ?>
</div>

<script>
    function agregar_entregable(id) {
        cargar('<?= base_url() ?>C_entregables/create', '#contenedor','POST', 'id=' + id);
    }

    function modificar_ponderacion(id){       
        cargar('<?= base_url() ?>C_entregables/showponderacion', '#contenedor','POST', 'id2=' + id);
    }

    function municipalizacion(id) {
        cargar('<?= base_url() ?>C_entregables/create_municipalizacion', '#contenedor','POST', 'id=' + id);
    }

    function modificar_entregable(id) {

        var variables = 'id='+id+ '&'+ 'id2='+<?= $id_detact ?>;

        cargar('<?= base_url() ?>C_entregables/edit', '#contenedor', 'POST', variables);
    }

    function regresar() {
        cargar('<?= base_url() ?>C_pat/index', '#contenido');
    }

    function regresarmodulo() {
        cargar('<?= base_url() ?>index.php/C_entregables/','#contenido', 'POST', 'id=' + <?= $id_detact ?>);
    }
    
    function agregar_ponderacion(id,id2) {

        var variables = 'id='+id+ '&'+ 'id2='+id2;
        
        cargar('<?= base_url() ?>C_entregables/showponderacion', '#contenedor','POST', variables);
    }

    function mostrar_avances(id){
        cargar('<?= base_url() ?>C_avances/index', '#contenido','POST', 'id=' + id);
    }
</script>
