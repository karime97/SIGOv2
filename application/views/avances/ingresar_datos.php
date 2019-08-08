<div class="col-12">
    <div class="card">
        <div class="card-body">
            <form class="needs-validation was-validated" onsubmit="guardarAvance(this,event);">
                <div class="form-row">                   
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Mes de corte</label>
                        <select id="mes_corte" name="mes_corte" required class="form-control">
                            <option value="">Seleccionar...</option>
                            <option value="Enero">Enero</option>
                            <option value="Febrero">Febrero</option>
                            <option value="Marzo">Marzo</option>
                            <option value="Abril">Abril</option>
                            <option value="Mayo">Mayo</option>
                            <option value="Junio">Junio</option>
                            <option value="Julio">Julio</option>
                            <option value="Agosto">Agosto</option>
                            <option value="Septiembre">Septiembre</option>
                            <option value="Octubre">Octubre</option>
                            <option value="Noviembre">Noviembre</option>
                            <option value="Diciembre">Diciembre</option>
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Avance del entregable<span class="text-danger">*</span></label>
                        <input type="text" id="avance" name="avance" class="form-control" required="" placeholder="Ingresar avance">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Monto ejercido<span class="text-danger">*</span></label>
                        <input type="text" id="monto" name="monto" class="form-control" required="" placeholder="Ingresar monto">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Beneficiarios<span class="text-danger">*</span></label>
                        <input type="text" id="beneficiario" name="beneficiario" class="form-control" required="" placeholder="Ingresar beneficiarios">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col-md-12 mb-3">
                        <label>Observaciones<span class="text-danger">*</span></label>
                        <textarea class="form-control" id="observaciones" name="observaciones" aria-invalid="false" required="" placeholder="Ingresar observacion"></textarea>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <br>
                <center>
                    <button class="btn waves-effect waves-light btn-success" type="submit">Guardar</button>
                    <button type="reset" class="btn waves-effect waves-light btn-inverse" onclick="regresarmodulo()">Cancelar</button>
                </center>
            </form>
        </div>
    </div>
</div>

<script>   
    function guardarAvance(f, e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_avances/insert", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
                if (resp >0) {

                    alerta('Guardado exitosamente', 'success');
                } else {
                    alerta('Error al guardar', 'error');
                }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>
