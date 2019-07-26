<div class="col-12">
    <div class="card">
        <div class="card-body">          
            <form class="needs-validation was-validated" onsubmit="guardarEntregable(this,event);">
                <div class="form-row">
                    <div class="col-md-4 mb-4">
                        <label for="validationCustom04">Nombre del entregable</label>
                        <input class="form-control" id="validationCustom04" name="clave" required="" type="text" placeholder="Ingresar clave">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <label for="validationCustom04">Nombre del compromiso</label>
                        <select class="custom-select" required="" name="">
                            <option value="">Seleccione...</option>                        
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mb-4">
                        <label for="validationCustom04">Número de compromiso</label>
                        <input class="form-control" id="validationCustom04" name="anio" required="" type="text" placeholder="Ingresar año">
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <label for="validationCustom04">Componente</label>
                        <select class="custom-select" required="" name="">
                            <option value="">Seleccione...</option>                        
                        </select>
                        <div class="invalid-feedback">
                            Este campo no puede estar vacio.
                        </div>
                    </div>

                </div>
                <br>
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
    function guardarEntregable(f,e){
        e.preventDefault();

        $.ajax({         
            type: "POST",
            url: "<?=base_url()?>C_entregables/insert", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
              if(resp > 0){
                
              } else {
                alert(resp);
              }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
              
            }
        });
    }
</script>

