<br><br>
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Roles</h1>
        <h5 class="card-subtitle"> Administración del catálogo roles. </h5>
        <br><br>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Rol</label>
                <select class="custom-select" id="b_rol" name="b_rol">
                    <option value="">Seleccione...</option>
                    <?= $roles ?>
                </select>
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="form-group">
                    <div class="button-group">
                        <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px" onclick="buscarRol()">Buscar</button>
                        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="agregar_rol()">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- alternative pagination -->
<div id="contenedor">
    <?php
    include_once('contenido_tabla.php');
    ?>
</div>

<script>
    function agregar_rol() {
        cargar('<?= base_url() ?>C_roles/create', '#contenedor');
    }

    function modificar_rol(id) {
        cargar('<?= base_url() ?>C_roles/edit', '#contenedor', 'POST', 'id=' + id);
    }

    function asignar_permisos(id){
        cargar('<?= base_url() ?>C_roles/editpermisos', '#contenedor', 'POST', 'id=' + id);
    }

    function buscarRol() {
        var rol = $("#b_rol").val();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_roles/search",
            data: {
                'rol': rol,
            },
            //contentType: 'json',
            success: function(resp) {
                $("#contenedor").html(resp);
                $("#grid").dataTable().fnReloadAjax();
            },
            error: function(XMLHHttRequest, textStatus, errorThrown) {}
        });
    }

    function regresar() {
        var rol = $("#b_rol").val();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_roles/search",
            data: {
                'rol': rol,
            },
            //contentType: 'json',
            success: function(resp) {
                $("#contenedor").html(resp);
                $('#grid').DataTable({
                    stateSave: true,
                });
            },
            error: function(XMLHHttRequest, textStatus, errorThrown) {}
        });
    }

</script>