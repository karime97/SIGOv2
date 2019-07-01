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
     <div class="container-fluid">
         <!-- ============================================================== -->
         <!-- Start Page Content -->
         <!-- ============================================================== -->
         <div class="row el-element-overlay">

             <?php

                foreach ($consulta as $value) {
                    echo '
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="el-card-item">
                                <div class="row">
                                    <div class="col-md-9">                                            
                                    </div>
                                    <div class="col-md-3">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fa fa-spin fa-cog"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="javascript:void(0)">Editar</a>
                                                <a class="dropdown-item" href="javascript:void(0)">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                           
                                <div class="el-card-avatar el-overlay-1">
                                <img src="/assets/images/gallery/chair.jpg" alt="img" />
                                </div>
                                <div class="d-flex no-block align-items-center">
                                    <div class="m-l-15">
                                        <h5 class="m-b-0">Dependencia: </h5>
                                        <h5 class="m-b-0">Titular: </h5>
                                        <h5 class="m-b-0">Enlace: </h5>
                                    </div>
                                    <div class="m-l-15">
                                        <h5 class="m-b-0">' . $value->vDependencia . '</h5>
                                        <h5 class="m-b-0">ejemplo </h5>
                                        <h5 class="m-b-0">ejemplo </h5>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>';
                } ?>

         </div>
         <!-- ============================================================== -->
         <!-- End PAge Content -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <!-- Right sidebar -->
         <!-- ============================================================== -->
         <!-- .right-sidebar -->
         <!-- ============================================================== -->
         <!-- End Right sidebar -->
         <!-- ============================================================== -->
     </div>
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