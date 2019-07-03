<div id="contenido_modulo" class="">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div align="right">
                    <button type="button" class="btn waves-effect waves-light btn-light" onclick="filter()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                </div>
                <form class="needs-validation was-validated" onsubmit="guardarUBP(this,event);">
                    <div class="form-row">
                        <div class="col-md-2">
                            <label for="validationCustom01">Clave UBP</label>
                            <input type="text" class="form-control" id="claveUBP" name="Cubp" placeholder="Clave UBP" value="<?= $consulta->vClave ?>" required="" maxlength="5">
                            <div class="valid-feedback">

                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Nombre de la UBP</label>
                            <input type="text" class="form-control" id="nombUBP" name="NombUbp" placeholder="Nombre de la UBP" value="<?= $consulta->vUBP ?>" required="">
                            <div class="valid-feedback">

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="validationCustomUsername">Año</label>
                            <input type="text" class="form-control" id="anio" name="annio" placeholder="Año" value="<?= $consulta->iAnio ?>" required="" onkeypress="solonumeros(event);" maxlength="4">
                            <div class="valid-feedback">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationCustom03">Tipo UBP</label>
                            <div class="form-group">
                                <select class="custom-select" required="" id="Tubp" name="TipoUBP">
                                    <option value="<?= $consulta->iIdTipoUbp ?>"><?= $consulta->vTipoUbp ?></option>
                                    <?php
                                    foreach ($tUBP as $value) { ?>
                                        <option value="<?= $value->iIdTipoUbp ?>"><?= $value->vTipoUbp ?></option>
                                    <?php } ?>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04">Dependencia</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="Depen">
                                    <option value="<?= $consulta->iIdDependencia ?>"><?= $consulta->vNombreCorto ?></option>
                                    <?php
                                    foreach ($Dep as $de) { ?>
                                        <option value="<?= $de->iIdDependencia ?>"><?= $de->vNombreCorto ?></option>
                                    <?php } ?>
                                </select>
                                <div class="valid-feedback"> </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>Programa presupuestario (PP)</label>
                            <div class="form-group">
                                <select class="custom-select" required="" name="ProgP">
                                    <option value="<?= $consulta->iIdProgramaPresupuestario ?>"><?= $consulta->vProgramaPresupuestario ?></option>
                                    <?php
                                    foreach ($PP as $pre) { ?>
                                        <option value="<?= $pre->iIdProgramaPresupuestario ?>"><?= $pre->vProgramaPresupuestario ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="<?= $consulta->iIdUbp ?>">
                    <center>
                        <button class="btn waves-effect waves-light btn-success" type="submit">Guardar</button>
                    </center>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function UBP() {
        cargar('<?= base_url() ?>C_ubps/agregar', '#contenido_modulo');
    }
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

    function guardarUBP(f, e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_ubps/actualizar",
            data: $(f).serialize(),

            success: function(resp) {
                if (resp == true) {
                    filter2();
                    alerta('Guardado exitosamente', 'success');

                } else {
                    alerta('Error al guardar', 'error');
                }
            },
            error: function(XMLHHttRequest, textStatus, errorThrown) {

            }
        });
    }

    function solonumeros(e) {
        var key = window.event ? e.which : e.keyCode;
        if (key < 48 || key > 57)
            e.preventDefault();
    }
</script>