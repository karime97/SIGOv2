<style>
    .boton_eliminar {
        background-color: #f44336;
        color: #fff;
    }

    .boton_eliminar:hover {
        background-color: #ff7961;
    }
</style>
<div id="contenido_modulo" class="">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-10">
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-light" type="submit" onclick="filter2()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                    </div>
                </div>
                <br><br>
                <form class="needs-validation was-validated" onsubmit="guardarDetalles(this,event);">
                    <div class="form-row">
                        <legend>Datos generales</legend>
                        <div class="col-md-10 mb-10">
                            <label for="validationCustom04">Nombre de la actividad</label>
                            <input class="form-control" id="validationCustom04" name="NombAct" required="" type="text" placeholder="" value="<?= $consulta->vActividad ?>">
                            <input id="idAct" name="idAct" type="hidden" value="<?= $consulta->iIdActividad ?>">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                        <div class="col-md-2 mb-2">
                            <label for="validationCustom04">Año</label>
                            <input class="form-control" id="validationCustom04" name="annio" required="" type="text" placeholder="" onkeypress="solonumeros(event);" maxlength="4" value="<?= $consulta->iAnio ?>">
                            <input id="id" name="id" type="hidden" value="<?= $consulta->iIdDetalleActividad ?>">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>

                        <div class="col-md-6 mb-6">
                            <label for="validationCustom04">Fecha de inicio</label>
                            <input type="date" class="form-control" id="fINICIO" name="fINICIO" required="" value="<?= $consulta->dInicio ?>">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label for="validationCustom04">Fecha fin</label>
                            <input type="date" class="form-control" id="fFIN" name="fFIN" required="" value="<?= $consulta->dFin ?>">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Objetivo general</label>
                            <textarea class="form-control" id="objGeneral" name="objGeneral" aria-invalid="false" required="" placeholder="" rows="5" value="<?= $consulta->vObjetivo ?>"></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Población objetivo</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" aria-invalid="false" required="" placeholder="" rows="5" value="<?= $consulta->vDescripcion ?>"></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>

                       <legend>Alienación al P.E.D</legend>
                       
                        <div class="col-md-6">
                            <label for="validationCustom04">Eje</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="eje" id="eje" onchange="cargarPpublica()">
                                    <option value="0">Seleccione...</option>
                                    <?php foreach ($eje as $value) { ?>
                                        <option value="<?php echo $value->iIdEje ?>"><?= $value->vEje ?></option>
                                    <?php } ?>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Política pública</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="polipub" id="polipub" onchange="cargarObjetivo()">

                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Objetivo</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="objetivo" id="objetivo" onchange="cargarEstrategia()">

                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Estrategia</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="estrategia" id="estrategia" onchange="cargarLineaAccion()">

                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Línea de acción</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="linAcc" id="linAcc">

                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                    </div>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary" onclick="agregarCarrito()">Agregar</button>
                </center>
                <br>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive" id="tabla-grid3">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                    <!--<h1>Objetivo General</h1>
                    <div class="form-row">
                        <div class="col-md-12 mb-12">
                            <textarea class="form-control" id="objGeneral" name="objGeneral" aria-invalid="false" required="" placeholder="" cols="40" rows="5" style="resize: both; margin: 0px -246px 0px 0px; width: 1125px; height: 190px;"><?= $consulta->vObjetivo ?></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                <br><br><br>
                    <h1>Descripción</h1>
                    <div class="form-row">
                        <div class="col-md-12 mb-12">
                            <textarea class="form-control" id="descripcion" name="descripcion" aria-invalid="false" required="" placeholder="" cols="40" rows="5" style="resize: both; margin: 0px -246px 0px 0px; width: 1125px; height: 190px;"><?= $consulta->vDescripcion ?></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                <br><br><br>-->
                    <legend>Fuentes de financiamiento</legend>
                    <div class="form-row">
                       
                        <div class="col-md-6">
                            <label for="validationCustom04">Fuente de financiamiento</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="fuenteF" id="fuenteF">
                                    <option value="0">Seleccione...</option>
                                    <?php foreach ($finan as $value) { ?>
                                        <option value="<?php echo $value->iIdFinanciamiento ?>"><?= $value->vFinanciamiento ?></option>
                                    <?php } ?>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="validationCustom04">Monto de la fuente</label>
                            <input class="form-control" id="montoF" name="montoF" required="" type="text" onkeypress="solonumeros(event);" maxlength="20">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary" onclick="agregarCarritoF()">Agregar</button>
                </center>
                <br>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive" id="tabla-grid">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="row">
                        <div class="col-sm-9"></div>
                        <div class="col-sm-3">
                            <label for="validationCustom04">Monto de la fuente</label>
                            <input align='right' class="form-control" id="montoFinal" name="montoFinal" type="text">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                
                    <legend>Alineacion UBP</legend>
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="validationCustom04">Número UBP</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="NumUBP" id="NumUBP">
                                    <option value="0">Seleccione...</option>
                                    <?php foreach ($ubp as $value) { ?>
                                        <option value="<?php echo $value->iIdUbp ?>"><?= $value->vUBP ?></option>
                                    <?php } ?>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                    </div>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary" onclick="agregarCarritoUP()">Agregar</button>
                </center>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive" id="tabla-grid2">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br><br>
                <center>
                    <button class="btn btn-success" type="submit">Guardar</button>
                </center>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();

    $("#tabla-grid").load('<?= base_url() ?>C_pat/tablaFinanciamiento');
    $("#tabla-grid2").load('<?= base_url() ?>C_pat/tablaUbpsPp');
    $("#tabla-grid3").load('<?= base_url() ?>C_pat/generar_tabla');

    function sumaMontoFin() {
        $("#montoFinal").load('<?= base_url() ?>C_pat/sumaMonto');
    }

    function solonumeros(e) {
        var key = window.event ? e.which : e.keyCode;
        if (key < 48 || key > 57)
            e.preventDefault();
    }

    function cargarPpublica() {

        var value = $("#eje").val();
        $("#polipub").load('C_pat/dPoliPub/' + value);
        $("#objetivo").load('C_pat/dObjetivo/' + 0);
        $("#estrategia").load('C_pat/dEstrategia/' + 0);
        $("#linAcc").load('C_pat/dLineaAccion/' + 0);
    }

    function cargarObjetivo() {
        var value = $("#polipub").val();
        $("#objetivo").load('C_pat/dObjetivo/' + value);
    }

    function cargarEstrategia() {
        var value = $("#objetivo").val();
        $("#estrategia").load('C_pat/dEstrategia/' + value);
    }

    function cargarLineaAccion() {
        var value = $("#estrategia").val();
        $("#linAcc").load('C_pat/dLineaAccion/' + value);
    }

    function guardarDetalles(f, e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_pat/guardarAct",
            data: $(f).serialize(),

            success: function(resp) {
                if (resp == 'Correcto') {
                    filter();
                    alerta('Guardado exitosamente', 'success');
                } else {
                    alerta('Error al guardar', 'error');
                }
            },
            error: function(XMLHHttRequest, textStatus, errorThrown) {}
        });
    }

    /* Carrito selectores */
    function agregarCarrito() {
        if ($('#linAcc').val() == '0') {
            alerta('Debe seleccionar una opcion', 'error');

        } else {
            var formData = new FormData();
            formData.append('linAcc', $("#linAcc").val());
            formData.append('tema', $("#tema").val());
            var url = "C_pat/carritoSelectores";
            $.ajax({
                url: url,
                type: 'POST',
                data: formData,
                async: false,
                success: function(data) {
                    if (data == 1) {
                        $("#tabla-grid3").load('<?= base_url() ?>C_pat/generar_tabla');
                    } else {
                        alerta('No se puede repetir la opcion', 'error');
                    }
                },
                cache: false,
                contentType: false,
                processData: false
            });
        }
    }

    function eliminarCarrito(id) {
        var formData = new FormData();
        formData.append('linAcc', id);
        var url = "C_pat/removecarritoSelectores";
        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            async: false,
            success: function(data) {
                if (data == 1) {
                    $("#tabla-grid3").load('<?= base_url() ?>C_pat/generar_tabla');
                } else {
                    alerta('Error al eliminar', 'error');
                }
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }

    /* Carrito selectores */
    function agregarCarritoF() {
        if ($('#fuenteF').val() == '0') {
            alerta('Debe seleccionar una opción', 'error');
        } else {
            var formData = new FormData();
            formData.append('fuenteF', $("#fuenteF").val());
            formData.append('montoF', $("#montoF").val());
            var url = "C_pat/carritoFinanciamiento";
            $.ajax({
                url: url,
                type: 'POST',
                data: formData,
                async: false,
                success: function(data) {
                    if (data == 1) {
                        $("#tabla-grid").load('<?= base_url() ?>C_pat/tablaFinanciamiento');
                    } else {
                        alerta('No se puede repetir la opcion', 'error');
                    }
                },
                cache: false,
                contentType: false,
                processData: false
            });
        }
    }

    function eliminarCarritoF(id) {
        var formData = new FormData();
        formData.append('fuenteF', id);
        var url = "C_pat/removecarritoFinanciamiento";
        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            async: false,
            success: function(data) {
                if (data == 1) {
                    $("#tabla-grid").load('<?= base_url() ?>C_pat/tablaFinanciamiento');
                } else {
                    alerta('Error al eliminar', 'error');
                }
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }

    /* Carrito UBP y PP */
    function agregarCarritoUP() {
        if ($('#NumUBP').val() == '0') {
            alerta('Debe seleccionar una opción', 'error');
        } else {
            var formData = new FormData();
            formData.append('NumUBP', $("#NumUBP").val());
            var url = "C_pat/carritoUbpsPp";
            $.ajax({
                url: url,
                type: 'POST',
                data: formData,
                async: false,
                success: function(data) {
                    if (data == 1) {
                        $("#tabla-grid2").load('<?= base_url() ?>C_pat/tablaUbpsPp');
                    } else {
                        alerta('No se puede repetir la opcion', 'error');
                    }
                },
                cache: false,
                contentType: false,
                processData: false
            });
        }
    }

    function eliminarCarritoUP(id) {
        var formData = new FormData();
        formData.append('NumUBP', id);
        var url = "C_pat/removecarritoUbpsPp";
        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            async: false,
            success: function(data) {
                if (data == 1) {
                    $("#tabla-grid2").load('<?= base_url() ?>C_pat/tablaUbpsPp');
                } else {
                    alerta('Error al eliminar', 'error');
                }
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }
</script>