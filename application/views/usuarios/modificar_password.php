<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-10">
                    <h4 class="card-title">Cambiar contraseña</h4>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-light" type="submit" onclick="regresar()"><i class="mdi mdi-arrow-left">Regresar</i></button>
                </div>
            </div>
            <br><br>
            <form class="needs-validation was-validated" onsubmit="modificarPassword(this,event);">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Antigua contraseña<span class="text-danger">*</span></label>
                        <input type="password" id="contrasenia" name="excontrasenia" class="form-control" placeholder="ingresar contraseña" required="">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Nueva contraseña<span class="text-danger">*</span></label>
                        <input type="password" id="contrasenia" name="newcontrasenia" class="form-control" placeholder="ingresar contraseña" required="">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Confirmar nueva contraseña<span class="text-danger">*</span></label>
                        <input type="password" id="contrasenia" name="confcontrasenia" class="form-control" placeholder="ingresar contraseña" required="">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <br><br>
                <input type="hidden" value="<?= $consulta->iIdUsuario ?>" name='id' />
                <center>
                    <button class="btn waves-effect waves-light btn-success" type="submit">Guardar cambios</button>
                    <button type="reset" class="btn waves-effect waves-light btn-inverse" onclick="regresar()">Cancelar</button>
                </center>
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
            </form>
        </div>
    </div>
</div>

<script>
    function modificarPassword(f, e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_usuarios/updatepass", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
                if (resp == "correcto") {

                    regresar();
                    alerta('Modificado exitosamente', 'success');

                }
                if (resp == "error_pass") {

                    alerta('Verifique la contraseña antigua', 'warning');

                }
                if(resp == "error_passnew"){
                    alerta('La confirmación de la contraseña no coincide con la nueva contraseña', 'warning');
                }
                if (resp == "error") {
                    alerta('Error al modificar', 'error');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>