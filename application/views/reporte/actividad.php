<!--titulo-->
<section>
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Listado de reportes</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a style="cursor:pointer;">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">...</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!--endtitulo-->
<br><br>
<!-- formulario -->
<section>
    <div class="col-12">
        <div class="card" style="padding: 2%;">
            <div class="col-md-12">
                <h5>Filtrar por:</h5>
                <hr>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="SelEje">Eje</label>
                            <select class="form-control" id="SelEje" onchange="dependencia();">
                                <option class="selected">Seleccione..</option>
                                <?php
                                    foreach($ejes as $key){
                                        ?>
                                            <option value="<?php echo $key['iIdEje']; ?>"><?php echo $key['vEje']; ?></option>
                                        <?php
                                    }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="SelDep">Dependencia</label>
                            <select class="form-control" id="SelDep">
                                <option class="selected">Seleccione..</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label readonly for="anio">Año</label>
                            <input type="text" id="anio" class="form-control" value="<?php echo date('Y'); ?>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
             

                <div class="row">
                    <div class="col-md-4">
                        
                        <br>
                        
                        <div class="col-md-12">
                        <a href="<?=base_url();?>public/reportes/actividadesBD.xls" style="cursor:pointer; color:blue;"><i class="m-r-10 mdi mdi-briefcase-download"></i>Descargar</a>
                        
                        </div>
                    </div>
                    <div class="col-md-4">
                   
                        <br>
                        
                    </div>
                   
                </div>
                <div style="float:right;"> <button onclick="generar();" type="button" class="btn waves-effect waves-light btn-block btn-danger">Generar</button></div>
            </div>
        </div>
    </div>
</section>
<!-- fin tabla -->
<!-- endformulario-->


<script>
function dependencia(){
    var id = document.getElementById("SelEje").value;
    $.ajax({         
      type: "POST",
      url:"<?=base_url()?>index.php/C_reporte/dependencias",
      data: 'id='+id,
      success: function(r) {  
        $("#SelDep").html(r);
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        notie.alert({ type: 3, text: 'Ha ocurrido un error. Contacte al administrador', time: 2 });
          /*alert("Status: " + textStatus);
          alert("Error: " + errorThrown);*/

      }
    });
  }

function generar2(){
    
    var id = 1;
    $.ajax({         
      type: "GET",
      url:"<?=base_url()?>index.php/C_reporte/reporte",
      data: 'id='+id,
      success: function(data) {  
        console.log(data);
       
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        notie.alert({ type: 3, text: 'Ha ocurrido un error. Contacte al administrador', time: 2 });
          /*alert("Status: " + textStatus);
          alert("Error: " + errorThrown);*/

      }
    });
  }

  function generar(){
    var eje = document.getElementById("SelEje").value;
    var dep = document.getElementById("SelDep").value;
    var anio = document.getElementById("anio").value;
    $.ajax({         
      type: "GET",
      url:"<?=base_url()?>index.php/C_reporte/generarrepo",
      data: {
          'eje': eje,
          'dep':dep,
          'anio':anio
        },
      success: function(data) {  
        console.log(data);
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        notie.alert({ type: 3, text: 'Ha ocurrido un error. Contacte al administrador', time: 2 });
          /*alert("Status: " + textStatus);
          alert("Error: " + errorThrown);*/

      }
    });
  }
</script>