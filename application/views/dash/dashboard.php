<!-- referencias -->
<!-- highmaps -->
<script src="<?= base_url(); ?>assets/highmaps/code/highmaps.js"></script>
<script src="<?= base_url(); ?>assets/highmaps/code/modules/exporting.js"></script>
<script src="<?= base_url(); ?>assets/highmaps/code/modules/offline-exporting.js"></script>
<!-- #end highmaps -->
<!-- echarts -->
<script src="<?= base_url(); ?>public/assets/libs/echarts/dist/echarts-en.min.js"></script>
<!-- #end echarts -->
<!-- #end referencias -->


<style>
    .desplazada {
        position: relative;
        top: -68%;
        left: 35%;
        width: 30%;
    }

    .desplazada2 {
        position: relative;
        top: -32%;
        left: 43%;
        width: 30%;
    }
    .desplazada3 {
        position: relative;
        top: 43%;
        left: 47%;
        font-size: 10px;
    }
</style>



<!-- seccion titulo-->

<section>
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">DESCA</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end Titulo -->
<br>
<div class="col-md-12">
    <div class="row">
    <div class="col-md-3">
    <label>Año</label>
    <input type="text" value="<?php echo date('Y'); ?>" id="año" min="1" max="9999" onkeypress='return validaNumericos(event)' class="text form-control">
    </div>
    <div class="col-md-1" style="padding-top: 2.5%;">
    <button onclick="recuperar()" class="btn btn-dark"><i class="mdi mdi-search-web"></i></button>
    <br><br>
    </div>
    </div>
    
    </div>
<section id="datos">

</section>

<!-- Javascript-->





<script>
var año = "";

function recuperar(){
    año = document.getElementById("año").value;
    cargar('<?= base_url(); ?>index.php/C_dash/datosdash/?an='+año, '#datos');
}

function validaNumericos(event) {
    if(event.charCode >= 48 && event.charCode <= 57){
      return true;
     }
     Swal.fire(
        'Lo sentimos',
        'Unicamente se permiten números en este apartado',
        'error'
        )
     return false;        
}

var input=  document.getElementById('año');
input.addEventListener('input',function(){
  if (this.value.length > 4) 
     this.value = this.value.slice(0,4); 
})
</script>

<!-- #end Javascript -->