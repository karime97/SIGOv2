<div class="card">
    <div class="card-body">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#ingresar" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Ingresar datos</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#importar" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">Importar datos</span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="ingresar" role="tabpanel">
                <div class="p-20">
                    <?php
                    include_once('ingresar_datos.php');
                    ?>
                </div>
            </div>
            <div class="tab-pane" id="importar" role="tabpanel">
                <div class="p-20">
                    <?php
                    include_once('importar_datos.php');
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="dropdown-divider"></div>
<div class="card">
    <div class="card-body">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#1tri" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">1 Trimestre</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#2tri" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">2 Trimestre</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#3tri" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">3 Trimestre</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#4tri" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">4 Trimestre</span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="1tri" role="tabpanel">
                <div class="p-20">
                    <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Position</th>
                                                <th>Office</th>
                                                <th>Age</th>
                                                <th>Start date</th>
                                                <th>Salary</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Cara Stevens</td>
                                                <td>Sales Assistant</td>
                                                <td>New York</td>
                                                <td>46</td>
                                                <td>2011/12/06</td>
                                                <td>$145,600</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            <div class="tab-pane" id="2tri" role="tabpanel">
                <div class="p-20">

                </div>
            </div>
            <div class="tab-pane" id="3tri" role="tabpanel">
                <div class="p-20">

                </div>
            </div>
            <div class="tab-pane" id="4tri" role="tabpanel">
                <div class="p-20">

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#grid').DataTable();
    });
</script>