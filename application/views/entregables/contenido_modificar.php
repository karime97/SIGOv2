<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-10">
                    <h4 class="card-title">Nuevo entregable</h4>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-light" type="submit" onclick="regresarmodulo()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                </div>
            </div>
            <br>
            <br>
            <h5 class="card-title">Datos generales</h5>
            <div class="dropdown-divider"></div>
            <form class="needs-validation was-validated" onsubmit="modificarEntregables(this,event);">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label>Entregale<span class="text-danger">*</span></label>
                        <textarea class="form-control" id="entregable" name="entregable" aria-invalid="false" required="" placeholder="Ingresar nombre del entregable"><?= $consulta->vEntregable ?></textarea>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Meta<span class="text-danger">*</span></label>
                        <input type="text" id="meta" name="meta" class="form-control" required="" placeholder="" value="<?= $consulta->nMeta ?>" onkeypress="return NumCheck(event, this)">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Unidad de medida</label>
                        <select id="unidadmedida" name="unidadmedida" required class="form-control">
                            <?= $unidadmedida ?>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Sujeto afectado</label>
                        <select id="sujetoafectado" name="sujetoafectado" required class="form-control">
                            <?= $sujeto_afectado ?>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Periodicidad<span class="text-danger">*</span></label>
                        <select name="periodicidad" id="periodicidad" required class="form-control">
                            <?= $periodicidad ?>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <br>
                <?php if($consulta->iMunicipalizacion == 1){
                    $checked_m = 'checked';
                }else{
                    $checked_m = '';
                } ?>
                <?php if($consulta->iMismosBeneficiarios == 1){
                    $checked_b = 'checked';
                }else{
                    $checked_b = '';
                } ?>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                       <div class="custom-control custom-checkbox mr-sm-2 m-b-15">
                            <input type="checkbox" class="custom-control-input" id="checkbox0" name="municipalizable" value="1" <?= $checked_m ?>>
                            <label class="custom-control-label" for="checkbox0">Municipalizable</label>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                       <div class="custom-control custom-checkbox mr-sm-2 m-b-15">
                            <input type="checkbox" class="custom-control-input" id="checkbox1" name="beneficios" value="1" <?= $checked_b ?>>
                            <label class="custom-control-label" for="checkbox1">Mismos beneficiarios</label>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <h5 class="card-title">Alineacion compromisos</h5>
                <div class="dropdown-divider"></div>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom04">Compromiso</label>
                        <select id="compromiso" name="compromiso" required class="form-control" onchange="cargarComponente()">
                        <option value="0">Seleccionar...</option>
                            <?= $compromiso ?>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Componente</label>
                        <select name="componente" id="componente" required class="form-control">
                            <?= $componente ?>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <center>
                    <input type="hidden" name="id_entregable" value="<?= $id_ent ?>">
                    <input type="hidden" name="id_detalleactividad" value="<?= $id_detact ?>">
                    <button class="btn waves-effect waves-light btn-success" type="submit">Guardar cambios</button>
                    <button type="reset" class="btn waves-effect waves-light btn-inverse" onclick="regresarmodulo()">Cancelar</button>
                </center>
            </form>
        </div>
    </div>
</div>

<script>
    function cargarComponente() {
        var value = $("#compromiso").val();
        $("#componente").load('C_entregables/showcomponentes/' + value);
    }
</script>

<script>
    function modificarEntregables(f, e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_entregables/update", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
                if (resp >0) {

                    //agregar_ponderacion(resp,<?= $id_detact ?>);
                    alerta('Modificado exitosamente', 'success');
                    regresarmodulo();
                } else {
                    alerta('Error al guardar', 'error');
                }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>