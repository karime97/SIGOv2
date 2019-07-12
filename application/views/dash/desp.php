<!-- echarts -->
<script src="<?= base_url(); ?>public/assets/libs/echarts/dist/echarts-en.min.js"></script>
<!-- #end echarts -->
<!-- seccion titulo-->

<style>
    .desplazada {
        position: relative;
        top: -67%;
        left: 42%;
        font-size: 25px;
    }

    .desplazada2 {
        position: relative;
        top: -30%;
        left: 13%;
        font-size: 25px;
    }
</style>

<section>
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">YUCATÁN CON ECONOMÍA INCLUSIVA</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a style="cursor:pointer;" onclick="cargar('<?= base_url(); ?>index.php/C_dash/', '#contenido');">Regresar al Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Despliegue</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="col-10 align-self-center">
                <div class="row">

                </div>
            </div>
        </div>
    </div>
</section>

<section>
    <div class="col-12" style="background-color: #f2f4f5;">
        <div class="card" style="padding: 2%;">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <?php //var_dump($actividades); ?>
                        <label for="seldep">Dependencia</label>
                        <select class="form-control" id="seldep" onchange="actividades()">
                            <option class="selected">Seleccione...</option>
                            <?php
                            foreach ($dependencias as $dep) {
                                ?>
                                <option id="dep" value="<?php echo $dep['iIdDependencia']; ?>"><?php echo $dep['vNombreCorto']; ?></option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="selEnt">Entidad</label>
                        <select class="form-control" id="seEnt">
                            <option>Seleccione...</option>
                            <option></option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end Titulo -->


<!-- tabla -->
<section>
    <div class="col-12" style="background-color: #f2f4f5;">
        <div class="card">
            <div class="row">
                <!-- columna 1 -->
                <div class="col-md-9" style="background-color: #f2f4f5;">
                    <div class="col-md-12">
                        <div class="row">
                            <?php
                            foreach ($temas as $tema) {
                                ?>
                                <div class="col-md-4" style="border: 6px solid #f2f4f5; background-color:white;">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <?php echo $tema['vTema']; ?>
                                        </div>
                                        <div class="col-md-4" style="padding-top: 5%;">
                                            <div style=" width: 90%; border-radius: 50%; background-color: #3db279; padding-top: 15%; padding-left: 10%; padding-right: 10%;">
                                                <img class="thumbnails" src="<?= base_url(); ?><?php echo $tema['vIcono']; ?>" width="100%">
                                            </div>
                                        </div>
                                        <div class="col-md-12">

                                            Avance: 28%

                                        </div>
                                        <div class="col-md-12">
                                            <div class="progress" style="background-color:gray;">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%; height: 6px; background-color: #3cb279"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <!-- fin columna 1 -->
                <!-- columna 2 -->
                <div class="col-md-3" style="background-color: #f2f4f5;">
                    <div id="basic-doughnut5" style="width: 100%; height:100%;"></div>
                    <div class="desplazada2">AVANCE GENERAL</div>

                    <div class="desplazada">45%</div>
                </div>
                <!-- fin columna 2 -->
            </div>
        </div>
    </div>
</section>
<!-- fin tabla -->

<!-- plan anual de trabajo -->
<!-- titulo 2 -->
<section>
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 align-self-center">
                <center>
                    <h4 class="page-title">PLAN ANUAL DE TRABAJO</h4>
                </center>
            </div>
        </div>
    </div>
    <br>
    <br>
</section>
<!-- end titulo 2 -->

<!-- contenido -->

<section>
    <div class="col-12" style="background-color: #f2f4f5;">
        <div class="card" style="padding: 1rem;">
            <div class="col-md-12" style="background-color: red;">
                <div class="row">
                    <div class="col-md-2" style="padding-top: 1rem;">
                        <img class="thumbnail" src="<?= base_url(); ?>public\img\icons\ods/ods-1.png" width="70%">
                    </div>
                    <div class="col-md-6" style="color: white; font-size: 120%; padding: 2rem;">ID Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et erat dictum nisl cursus commodo. Maecenas vulputate nulla dolor, viverra auctor augue gravida nec. Nulla non neque tellus</div>
                    <div class="col-md-1">
                        <div id="basic-doughnut1" style="width: 100%; height:100%;"></div>
                    </div>
                    <div class="col-md-1">
                        <div style="position: relative; top: 45%; left: -90%; font-size: 70%; color: white;">45%</div>
                        <div style="position: relative; top: 60%; left: -103%; font-size: 70%; color: white;">AVANCE GENERAL</div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </div>
</section>

<!-- end contenido -->
<!-- end plan anual de trabajo -->

<div class="row">
    <div class="col-12">
        <div class="card" id="tablaactividades">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($actividades as $act) {
                                ?>
                                <tr>
                                    <td>
                                        <div class="col-md-12" style="background-color: white;">
                                            <div class="row">
                                                <div class="col-md-2" style="padding-top: 1rem;">

                                                </div>
                                                <div class="col-md-6" style="color: black; font-size: 120%; padding: 2rem;">
                                                <label style="display: none;"><?php echo $act['iIdActividad']; ?></label>
                                                <a style="cursor:pointer;"><?php echo $act['vActividad']; ?></a>
                                                </div>
                                                <div class="col-md-1">
                                                    <div id="basic-doughnut2" style="width: 100%; height:100%;"></div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div style="position: relative; top: 45%; left: -90%; font-size: 70%; color: #11386b">45%</div>
                                                    <div style="position: relative; top: 60%; left: -103%; font-size: 70%; color: #11386b;">AVANCE GENERAL</div>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>



<script>
    // based on prepared DOM, initialize echarts instance
    var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut5'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add custom colors
        color: ['#113868', '#597789'],

        series: [{
            name: '',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: true,

            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                    value: 25,
                    name: ''
                },

                {
                    value: 75,
                    name: ''
                }
            ]
        }]
    };


    basicdoughnutChart.setOption(option);
</script>
<script>
    // based on prepared DOM, initialize echarts instance
    var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut1'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add custom colors
        color: ['#ffab4c', '#ffffff'],

        series: [{
            name: '',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: true,

            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                    value: 25,
                    name: ''
                },

                {
                    value: 75,
                    name: ''
                }
            ]
        }]
    };


    basicdoughnutChart.setOption(option);
</script>

<script>
    // based on prepared DOM, initialize echarts instance
    var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut2'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add custom colors
        color: ['#d0282a', '#c0cac8'],

        series: [{
            name: '',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: true,

            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                    value: 25,
                    name: ''
                },

                {
                    value: 75,
                    name: ''
                }
            ]
        }]
    };


    basicdoughnutChart.setOption(option);
</script>

<script>
    // based on prepared DOM, initialize echarts instance
    var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut3'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add custom colors
        color: ['#d0282a', '#c0cac8'],

        series: [{
            name: '',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: true,

            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                    value: 25,
                    name: ''
                },

                {
                    value: 75,
                    name: ''
                }
            ]
        }]
    };


    basicdoughnutChart.setOption(option);
</script>
<script>
    $(document).ready(function() {
        $('#grid').DataTable();
    });

    function actividades() {
    var id = document.getElementById("seldep").value;
    cargar('<?= base_url(); ?>index.php/C_dash/desplieguetabla/?id='+id, '#tablaactividades');
  }
</script>