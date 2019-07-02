 <br><br>
 <div class="card">
     <div class="card-body">
         <h4 class="card-title">Buscar por:</h4>
         <form method="get" action="">
             <div class="row">
                 <div class="col-md-4 mb-3">
                     <label for="validationCustom01">Sector</label>
                     <input class="form-control" id="validationCustom01" required="" type="text" placeholder="Ingresar sector">
                     <div class="valid-feedback">
                         Looks good!
                     </div>
                 </div>
                 <div class="col-md-4 mb-3">
                     <label for="validationTooltip02">Dependencia</label>
                     <input class="form-control" id="validationTooltip02" required="" type="text" placeholder="Ingresar dependencia">
                     <div class="valid-tooltip">
                         Looks good!
                     </div>
                 </div>
                 <div class="col-sm-12 col-md-3" style="margin-top:35px;">
                     <div class="form-group">
                         <div class="button-group">
                             <button type="submit" class="btn waves-effect waves-light btn-success">Buscar</button>
                             <button type="button" class="btn waves-effect waves-light btn-info" onclick="agregar_dependencia()">Agregar</button>
                         </div>
                     </div>
                 </div>
             </div>
         </form>
     </div>
 </div>
 <base href="<?= base_url() ?>public/">

 <div id="contenedor">
     <?php
    include_once('contenido_tabla.php');
    ?>
 </div>

 <script>
    function agregar_dependencia() {
        cargar('<?= base_url() ?>C_dependencias/create', '#contenedor');
    }

    function modificar_dependencia(id) {
        cargar('<?= base_url() ?>C_dependencias/edit', '#contenedor','POST','id='+id);
    }  

    function regresar() {
        cargar('<?= base_url() ?>C_dependencias/return', '#contenedor');
    }
</script>