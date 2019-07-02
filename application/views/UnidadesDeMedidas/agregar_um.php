<div id="contenido_modulo" class="container">
<div class="col-12">
                    <div class="card">
                        <div class="card-body">
                        <div align="right">
                                    <button type="button" class="btn waves-effect waves-light btn-light" onclick="regresar()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                                </div>
                            <form class="needs-validation was-validated" onsubmit="guardarUBP(this,event);">
                                <div class="form-row">
                                    <div class="col-md-4 mb-3">
                                        <label for="validationCustom02">Nombre de la Unidad de Medida</label>
                                        <input type="text" class="form-control" id="nombUBP" name="NombUm" placeholder="Nombre de la UBP" value="" required="">
                                        <div class="valid-feedback">
                                            
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <button class="btn waves-effect waves-light btn-success" type="submit">Guardar</button>
                            </form>                            
                        </div>
                    </div>
                </div>
                </div>

                <script>
                    function UBP(){
        cargar('<?= base_url()?>C_unidadesmedida/cargar','#contenido_modulo');
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

                            function guardarUM(f, e){
                                e.preventDefault();
                                $.ajax({
                                    type: "POST",
                                    url: "<?= base_url() ?>C_unidadesmedida/insertar",
                                    data: $(f).serialize(),

                                    success: function(resp){
                                        if(resp > 0){
                                            cargar('<?= base_url()?>C_unidadesmedida/regresar','#contenido_modulo');
                                        }else{
                                            alert(resp);
                                        }
                                    },
                                    error: function(XMLHHttRequest, textStatus, errorThrown) {
                                        
                                    }
                                });
                            }
                            </script>