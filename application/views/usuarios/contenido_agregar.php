<div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo usuarios</h4>
            <form class="m-t-40" novalidate>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Dependencia<span class="text-danger">*</span></label>
                            <div class="controls">
                                <select name="select" id="select" required class="form-control" required data-validation-required-message="Este campo es requerido">
                                    <option value="">Seleccionar...</option>
                                    <?= $dependencias ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nombre(s)<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Correo institucional<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nombre de usuario<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Rol<span class="text-danger">*</span></label>
                            <div class="controls">
                                <select name="select" id="select" required class="form-control" required data-validation-required-message="Este campo es requerido">
                                    <option value="">Seleccionar...</option>
                                    <?= $roles ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Apellido paterno<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Correo personal<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Contraseña<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Formación academica<span class="text-danger">*</span></label>
                            <div class="controls">
                                <select name="select" id="select" required class="form-control" required data-validation-required-message="Este campo es requerido">
                                    <option value="">Seleccionar...</option>
                                    <?= $formacion_academica ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Apellido materno<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Telefono<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Confirmar contraseña<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Maximo nivel academico<span class="text-danger">*</span></label>
                            <div class="controls">
                                <select name="select" id="select" required class="form-control" required data-validation-required-message="Este campo es requerido">
                                    <option value="">Seleccionar...</option>
                                    <?= $nivel_academico ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Cargo<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Celular<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Fecha de nacimiento<span class="text-danger">*</span></label>
                            <div class="controls">
                                <input type="text" name="text" class="form-control" required data-validation-required-message="Este campo es requerido"> </div>
                            <div class="form-control-feedback">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-xs-right">
                    <button type="submit" class="btn btn-success">Guardar</button>
                    <button type="reset" class="btn btn-inverse">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php base_url() ?>public/assets/extra-libs/jqbootstrapvalidation/validation.js"></script>
<script>
    ! function(window, document, $) {
        "use strict";
        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
    }(window, document, jQuery);
</script>