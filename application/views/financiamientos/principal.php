<br><br>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Fuentes de financiamiento</h4>
        <form method="get" action="">
            <div class="row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Año</label>
                <input class="form-control" id="validationCustom01" required="" type="text" placeholder="Ingresar año">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationTooltip02">Fuentes</label>
                <input class="form-control" id="validationTooltip02" required="" type="text" placeholder="Ingresar fuentes">
                <div class="valid-tooltip">
                    Looks good!
                </div>
            </div>
            <div class="col-sm-12 col-md-3" style="margin-top:35px;">
                <div class="form-group">
                    <div class="button-group">
                        <button type="submit" class="btn waves-effect waves-light btn-success">Buscar</button>
                        <button type="button" class="btn waves-effect waves-light btn-info" onclick="agregar_financiamiento()">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- alternative pagination -->
<div id="contenedor">
    <?php
    include_once('contenido_tabla.php');
    ?>
</div>

<script>
    function agregar_financiamiento() {
        cargar('<?= base_url() ?>C_financiamientos/create', '#contenedor');
    }

    function regresar() {
        cargar('<?= base_url() ?>C_financiamientos/return', '#contenedor');
    }
</script>