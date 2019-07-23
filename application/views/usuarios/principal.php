<br><br>
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Usuarios</h1>
        <h5 class="card-subtitle"> Administración del catálogo usuarios. </h5>
        <br><br>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Rol</label>
                <select class="custom-select" id="b_rol" name="b_rol">
                    <option value="">Seleccione...</option>
                    <?= $roles ?>
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationTooltip02">Usuario</label>
                <input class="form-control" id="b_usuario" name="b_usuario" type="text" placeholder="Ingresar usuario">
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="form-group">
                    <div class="button-group">
                        <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px" onclick="buscarUsuario()">Buscar</button>
                        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="agregar_usuario()">Agregar</button>
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
    function agregar_usuario() {
        cargar('<?= base_url() ?>C_usuarios/create', '#contenedor');
    }

    function modificar_usuario(id) {
        cargar('<?= base_url() ?>C_usuarios/edit', '#contenedor', 'POST', 'id=' + id);
    }

    function modificar_password(id) {
        cargar('<?= base_url() ?>C_usuarios/editpassword', '#contenedor', 'POST', 'id=' + id);
    }
    function asignar_permisos(id){
        cargar('<?= base_url() ?>C_usuarios/editpermisos', '#contenedor', 'POST', 'id=' + id);
    }

    function buscarUsuario() {
        var rol = $("#b_rol").val();
        var usuario = $("#b_usuario").val();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_usuarios/search",
            data: {
                'rol': rol,
                'usuario': usuario
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
        var rol = $("#brol").val();
        var usuario = $("#busuario").val();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_usuarios/search",
            data: {
                'rol': rol,
                'usuario': usuario
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