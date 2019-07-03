<br><br>
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Fuentes de financiamiento</h1>
        <h5 class="card-subtitle"> Administración del catálogo de fuentes de financiamiento. </h5>
        <br><br>
            <div class="row">
            <div class="col-md-4 mb-3">
                <label for="validationCustom01">Año</label>
                <input type="text" id="anio" class="form-control" placeholder="Ingresar año">
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationTooltip02">Fuentes</label>
                <input class="form-control" id="fuente" required="" type="text" placeholder="Ingresar fuentes">
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="form-group">
                    <div class="button-group">
                        <button type="button" class="btn waves-effect waves-light btn-light" style="margin-top:35px" onclick="buscarfinanciamiento()">Buscar</button>
                        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-top:35px" onclick="agregar_financiamiento()">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- alternative pagination -->
<div id="contenedor">
    <?php
    include_once('contenido_tabla.php');
    ?>
</div>

<script>
    function agregar_financiamiento() {
        cargar('<?= base_url() ?>C_financiamientos/create', '#contenedor');
    }

    function modificar_financiamiento(id) {
        cargar('<?= base_url() ?>C_financiamientos/edit', '#contenedor','POST','id='+id);
    } 

    function regresar() {
        cargar('<?= base_url() ?>C_financiamientos/return', '#contenedor');
    }

    function buscarfinanciamiento(){
        var fuente = $("#fuente").val();
        var anio = $("#anio").val();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_financiamientos/search",
            data: {'fuente' : fuente, 'anio' : anio},
            //contentType: 'json',
            success: function(resp){
                $("#contenedor").html(resp);
            },
            error: function(XMLHHttRequest, textStatus, errorThrown) {                        
            }
        });
    }
</script>