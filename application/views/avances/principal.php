<br><br>
<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-md-10 mb-3">
                <h3 class="card-title">Datos generales</h3>
                <br><br>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label>Actividad estrategica: </label>
                    </div>
                    <div class="col-md-6 mb-3">
                        <h6><?= $consulta->vActividad ?></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label>Entregables: </label>
                    </div>
                     <div class="col-md-6 mb-3">
                        <h6><?= $consulta->vEntregable ?></h6>
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <button type="button" class="btn waves-effect waves-light btn-light" onclick="regresarmodulo()"><i class="mdi mdi-arrow-left">Regresar</i></button>
            </div>
        </div>
    </div>

    <div id="contenedor">
        <?php
        include_once('contenido_tabs.php');
        ?>
    </div>