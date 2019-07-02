<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-10">
                    <h4 class="card-title">Modificar dependencia</h4>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-light" type="submit" onclick="regresar()">Regresar</button>
                </div>
            </div>
            <br><br>           
            <form class="needs-validation was-validated" onsubmit="modificarDependencia(this,event);">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Nombre corto</label>
                        <input class="form-control text-left" id="validationCustom04" name="nombrecorto" required="" type="text" placeholder="Ingresar clave" value="<?= $consulta->vNombreCorto ?>">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Dependencia</label>
                        <textarea class="form-control" id="textarea" name="dependencia" aria-invalid="false" required="" placeholder="Ingresar dependencia"><?= $consulta->vDependencia ?></textarea>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        
                    </div>

                </div>
                 <input type="hidden" value="<?= $consulta->iIdDependencia ?>" name='id' />
                <button class="btn btn-info" type="submit">Guardar</button>
            </form>
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
            </script>
        </div>
    </div>
</div>

<script>
    function modificarDependencia(f,e){
        e.preventDefault();

        $.ajax({         
            type: "POST",
            url: "<?=base_url()?>C_dependencias/update", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
                 if(resp == true){
                
                cargar('<?= base_url() ?>C_dependencias/return', '#contenedor'); //Opcion para redirigir a la tabla principal

              } else {
                alert(resp);
              }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
              
            }
        });
    }
</script>