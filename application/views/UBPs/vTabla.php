<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th>Clave</th>
                                <th>Unidad Básica de Presuspuestación (UBP)</th>
                                <th>Año</th>
                                <th width="150px">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            foreach($consulta as $value){ ?>
                            <tr>
                                <td><?= $value->vClave ?></td>
                                <td><?= $value->vUBP ?></td>
                                <td><?= $value->iAnio ?></td>
                                <td>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-warning " onclick="modificarUBP(<?= $value->iIdUbp ?>)"><i class="mdi mdi-border-color" ></i></button>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-danger "><i class="mdi mdi-close"></i></button>
                                </td>
                             </tr> 
                             <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="holi"></div>

<script>
$(document).ready(function () {
        $('#grid').DataTable();
    });
</script>