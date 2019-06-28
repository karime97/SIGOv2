<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th>Clave</th>
                                <th>Fuente de Financiamiento</th>
                                <th>Año</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach($consulta as $value){ ?>
                            <tr>
                                <td><?= $value->vClave ?></td>
                                <td><?= $value->vFinanciamiento ?></td>
                                <td><?= $value->iAnio ?></td>
                                <td>
                                    <i class="m-r-10 mdi mdi-border-color"></i>
                                    <i class="m-r-10 mdi mdi-close"></i>
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

<script>
    $(document).ready(function() {
        $('#grid').DataTable();
    });
</script>