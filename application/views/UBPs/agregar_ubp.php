<div id="contenido_modulo" class="container">
<div class="col-12">
                    <div class="card">
                        <div class="card-body">
                        <div align="right">
                                    <button type="button" class="btn waves-effect waves-light btn-light" onclick="regresar()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                                </div>
                            <form class="needs-validation was-validated">
                                <div class="form-row">                                    
                                    <div class="col-md-2">
                                        <label for="validationCustom01">Clave UBP</label>
                                        <input type="text" class="form-control" id="claveUBP" placeholder="Clave UBP" value="" required="">
                                        <div class="valid-feedback">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="validationCustom02">Nombre de la UBP</label>
                                        <input type="text" class="form-control" id="nombUBP" placeholder="Nombre de la UBP" value="" required="">
                                        <div class="valid-feedback">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="validationCustomUsername">Año</label>
                                        <input type="text" class="form-control" id="anio" placeholder="Año" value="" required="">
                                        <div class="valid-feedback">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="validationCustom03">Tipo UBP</label>
                                        <div class="form-group">
                                            <select class="custom-select" required="">
                                                <option value="">Seleccione...</option>
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
                                            <select class="custom-select" required="">
                                                <option value="">Seleccione...</option>
                                                <?php
                                                    foreach ($Dep as $de) { ?>
                                                        <option value="<?= $de->iIdDependencia ?>"><?= $de->vDependencia ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="valid-feedback"> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Programa presupuestario (PP)</label>
                                        <div class="form-group">
                                            <select class="custom-select" required="">
                                                <option value="">Seleccione...</option>
                                                <?php
                                                    foreach ($PP as $pre) { ?>
                                                        <option value="<?= $pre->iIdProgramaPresupuestario ?>"><?= $pre->vProgramaPresupuestario ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="valid-feedback"> </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Guardar</button>
                            </form>                            
                        </div>
                    </div>
                </div>
                </div>

                <script>
                    function UBP(){
        cargar('<?= base_url()?>C_ubps/agregar','#contenido_modulo');
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

                            function guardarUBP(f, e){
                                e.preventDefault();
                                $.ajax({
                                    type: "POST",
                                    url: "<?= base_url() ?>C_ubps/insertarUBP",
                                    data: $(f).serialize(),

                                    success: function(resp){
                                        if(resp > 0){
                                            cargar('<?= base_url() ?>C_ubps/regresar', '#contenido_modulo');
                                        }else{
                                            alert(resp);
                                        }
                                    },
                                    error: function(XMLHHttRequest, textStatus, errorThrown) {
                                        
                                    }
                                });
                            }
                            </script>