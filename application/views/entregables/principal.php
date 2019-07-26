<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-md-10">
                <h1 class="card-title">Entregables</h1>
                <h5 class="card-subtitle"> Administración del catálogo de entregables. </h5>
            </div>
            <div class="col-md-2">
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-10">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="agregar_entregable()">Agregar</button>
            </div>
        </div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#entregable" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Entregables</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#alineacion" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">Alineación</span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="entregable" role="tabpanel">
                <div class="p-20">
                    <?php
                    include_once('tabla_entregables.php');
                    ?>
                </div>
            </div>
            <div class="tab-pane  p-20" id="alineacion" role="tabpanel">
                <div class="p-20">
                    <?php
                    include_once('contenido_alineacion.php');
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>