<br><br>
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Usuarios</h1>
        <h5 class="card-subtitle"> Administración del catálogo usuarios. </h5>
        <br><br>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Rol</label>
                <select class="custom-select" id="rol" name="rol">
                    <option value="">Seleccione...</option>
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationTooltip02">Usuario</label>
                <input class="form-control" id="usuario" name="usuario" type="text" placeholder="Ingresar usuario">
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
</script>