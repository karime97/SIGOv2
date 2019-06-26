<div class="card-body">
    <h4 class="card-title">Fuentes de financiamiento</h4>
    <div class="row">
        <div class="col-sm-12 col-md-3">
            <div class="form-group">
                <label class="control-label col-form-label">Año</label>
                <select class="form-control">
                    <option>Choose Your Option</option>
                    <option>Desiging</option>
                    <option>Development</option>
                    <option>Videography</option>
                </select>
            </div>
        </div>
        <div class="col-sm-12 col-md-3">
            <div class="form-group">
                <label class="control-label col-form-label">Fuentes</label>
                <select class="form-control">
                    <option>Choose Your Option</option>
                    <option>Less then $5000</option>
                    <option>$5000 - $10000</option>
                    <option>$10000 - $20000</option>
                </select>
            </div>
        </div>
        <div class="col-sm-12 col-md-3" style="margin-top:35px;">
            <div class="form-group">
                <div class="button-group">
                    <button type="button" class="btn waves-effect waves-light btn-success">Buscar</button>
                    <button type="button" class="btn waves-effect waves-light btn-info">Agregar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- alternative pagination -->
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
                                    <i class="m-r-10 mdi mdi-delete"></i>
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
$(document).ready(function () {
        $('#grid').DataTable();
    });
</script>