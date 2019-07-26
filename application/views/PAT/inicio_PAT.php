<div id="">
    <br><br>
    <div class="row">
        <div class="col-md-12">
            <div class="card card-body">
                <h1 class="card-title">Actividades</h1>
                <h5 class="card-subtitle"></h5>
                <div class="form-body">
                    <div class="card-body">
                        <div class="row p-t-20">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="control-label">Nombre de la actividad</label>
                                    <input type="text" id="clave" class="form-control" placeholder="">

                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">Año</label>
                                    <input type="text" id="anio" class="form-control form-control-danger" placeholder="" onkeypress="solonumeros(event);" maxlength="4">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px" onclick="filter()" id="btn_buscar">Buscar</button>
                                    <button type="button" class="btn waves-effect waves-light btn-primary" data-toggle="modal" style="margin-top:35px" data-target="#exampleModal">Agregar</button>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <!--/row-->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form class="needs-validation was-validated" onsubmit="guardarAct(this,event);">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nueva actividad</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="col-md-9 mb-6">
                                <label for="validationCustom04">Nombre de la actividad</label>
                                <input class="form-control" id="validationCustom04" name="NombAct" required="" type="text" placeholder="">
                                <div class="invalid-feedback">
                                    Este campo no puede estar vacio.
                                </div>
                                <input class="form-control" name="idAct" type="hidden" value="">
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom04">Año</label>
                                <input class="form-control" id="validationCustom05" name="annio" required="" type="text" placeholder="" onkeypress="solonumeros(event);" maxlength="4">
                                <div class="invalid-feedback">
                                    Este campo no puede estar vacio.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="contenido_modulo" class="content">
        <?php include_once('vTablaAct.php') ?>
    </div>

    <script>
        function solonumeros(e) {
            var key = window.event ? e.which : e.keyCode;
            if (key < 48 || key > 57)
                e.preventDefault();
        }

        function capturarAct() {
            cargar('<?= base_url() ?>C_pat/cargar', '#contenido_modulo');
        }

        function abrirEntregables(id) {
            cargar('<?= base_url() ?>C_entregables/index', '#contenido_modulo', 'POST', 'id=' + id);
        }

        function filter() {
            var keyword = $("#clave").val();
            var year = $("#anio").val();

            $.ajax({
                type: "POST",
                url: "<?= base_url() ?>C_pat/gettable",
                data: {
                    'keyword': keyword,
                    'year': year
                },
                //contentType: 'json',
                success: function(resp) {
                    $("#contenido_modulo").html(resp);
                    $("#grid").dataTable().fnReloadAjax();
                },
                error: function(XMLHHttRequest, textStatus, errorThrown) {}
            });
        }

        function filter2() {
            var keyword = $("#clave").val();
            var year = $("#anio").val();

            $.ajax({
                type: "POST",
                url: "<?= base_url() ?>C_pat/gettable",
                data: {
                    'keyword': keyword,
                    'year': year
                },
                //contentType: 'json',
                success: function(resp) {
                    $("#contenido_modulo").html(resp);
                    $('#grid').DataTable({
                        stateSave: true,
                    });
                    //$("#grid").dataTable().fnReloadAjax();
                },
                error: function(XMLHHttRequest, textStatus, errorThrown) {}
            });
        }

        function solonumeros(e) {
            var key = window.event ? e.which : e.keyCode;
            if (key < 48 || key > 57)
                e.preventDefault();
        }

        function modificarAct(id) {
            cargar('<?= base_url() ?>C_pat/edit', '#contenido_modulo', 'POST', 'id=' + id);
        }

        function guardarAct(f, e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "<?= base_url() ?>C_pat/insertarAct",
                data: $(f).serialize(),

                success: function(resp) {
                    if (resp > 0) {
                        filter();
                        alerta('Guardado exitosamente', 'success');
                        $("#validationCustom04").val(null);
                        $("#validationCustom05").val(null);
                    } else {
                        alerta('Error al guardar', 'error');
                    }
                },
                error: function(XMLHHttRequest, textStatus, errorThrown) {}
            });
        }
    </script>