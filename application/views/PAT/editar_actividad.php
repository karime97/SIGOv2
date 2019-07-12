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
                <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                    <div class="form-row">
                        <div class="col-md-10 mb-10">
                            <label for="validationCustom04">Nombre de la actividad</label>
                            <input class="form-control" id="validationCustom04" name="NombAct" required="" type="text" placeholder="">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                        <div class="col-md-2 mb-2">
                            <label for="validationCustom04">Año</label>
                            <input class="form-control" id="validationCustom04" name="annio" required="" type="text" placeholder="" onkeypress="solonumeros(event);" maxlength="4">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
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
                                <select class="custom-select" required="" name="polipub" id="polipub">
                                    
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Objetivo</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="obj">
                                    <option value="">Seleccione...</option>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Estrategia</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="estrategia">
                                    <option value="">Seleccione...</option>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Línea de acción</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="linAcc">
                                    <option value="">Seleccione...</option>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Población objetivo</label>
                            <div class="form-group">
                                <input class="form-control" id="validationCustom04" name="annio" required="" type="text" placeholder="" onkeypress="solonumeros(event);" maxlength="4">
                                <div class="invalid-feedback">
                                    Este campo no puede estar vacio.
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary">Agregar</button>
                </center>
                <br>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered display" style="width:100%" id="grid3">
                                            <thead>
                                                <tr>
                                                    <th>Eje</th>
                                                    <th>Politica pública</th>
                                                    <th>Objetivo</th>
                                                    <th>Estrategia</th>
                                                    <th>Linea de accion</th>
                                                    <th>Poblacion objetivo</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick=""><i class="mdi mdi-close"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br><br>
                <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                    <h1>Objetivo General</h1>
                    <div class="form-row">
                        <div class="col-md-12 mb-12">
                            <textarea class="form-control" id="textarea" name="objGeneral" aria-invalid="false" required="" placeholder="" cols="40" rows="5" style="resize: both; margin: 0px -246px 0px 0px; width: 1125px; height: 190px;"></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                </form>
                <br><br><br>
                <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                    <h1>Descripción</h1>
                    <div class="form-row">
                        <div class="col-md-12 mb-12">
                            <textarea class="form-control" id="textarea" name="objGeneral" aria-invalid="false" required="" placeholder="" cols="40" rows="5" style="resize: both; margin: 0px -246px 0px 0px; width: 1125px; height: 190px;"></textarea>
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                </form>
                <br><br><br>
                <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                    <h1>Modulo monetario</h1>
                    <div class="form-row">
                        <div class="col-md-6 mb-6">
                            <label for="validationCustom04">Fecha de inicio</label>
                            <input type="date" class="form-control" id="date" name="NombAct" required="">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                        <div class="col-md-6 mb-6">
                            <label for="validationCustom04">Fecha de inicio</label>
                            <input type="date" class="form-control" id="date" name="NombAct" required="">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Fuente de financiamiento</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="fuenteF">
                                    <option value="">Seleccione...</option>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <label for="validationCustom04">Monto de la fuente</label>
                            <input class="form-control" id="validationCustom04" name="NombAct" required="" type="text" placeholder="">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                </form>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary">Agregar</button>
                </center>
                <br>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                                            <thead>
                                                <tr>
                                                    <th>Nombre de la fuente de financiamiento</th>
                                                    <th>Cantidad</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick=""><i class="mdi mdi-close"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form>
                    <div class="row">
                        <div class="col-sm-9"></div>
                        <div class="col-sm-3">
                            <label for="validationCustom04">Monto de la fuente</label>
                            <input align='right' class="form-control" id="validationCustom04" name="NombAct" required="" type="text" placeholder="">
                            <div class="invalid-feedback">
                                Este campo no puede estar vacio.
                            </div>
                        </div>
                    </div>
                </form>
                <br><br><br>
                <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                    <h1>Alineacion UBP</h1>
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="validationCustom04">Número UBP</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="NumUBP">
                                    <option value="">Seleccione...</option>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                    </div>
                </form>
                <center>
                    <button type="button" class="btn waves-effect waves-light btn-primary">Agregar</button>
                </center>
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered display" style="width:100%" id="grid2">
                                            <thead>
                                                <tr>
                                                    <th>Número UBP</th>
                                                    <th>Nombre UBP</th>
                                                    <th>Número PP</th>
                                                    <th>Nombre PP</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td align="center"><button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick=""><i class="mdi mdi-close"></i></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
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

    $(document).ready(function() {
        $('#grid').DataTable();
    });
    $(document).ready(function() {
        $('#grid2').DataTable();
    });
    $(document).ready(function() {
        $('#grid3').DataTable();
    });

    function solonumeros(e) {
        var key = window.event ? e.which : e.keyCode;
        if (key < 48 || key > 57)
            e.preventDefault();
    }

    function cargarPpublica() {
        var value = $("#eje").val();
        $("#polipub").load('C_pat/dPoliPub/' + value);
    }
</script>