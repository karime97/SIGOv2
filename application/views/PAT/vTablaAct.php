<style>
    .boton {
        background-color: #B274E8;
        color: #fff;
    }

    .boton:hover {
        background-color: #C397EA;
    }

    .boton_desc {
        background-color: #62DDBA;
        color: #fff;
    }

    .boton_desc:hover {
        background-color: #90E4CC;
    }

    .boton_InfTex {
        background-color: #7E70E9;
        color: #fff;
    }

    .boton_InfTex:hover {
        background-color: #A69DED;
    }

    .boton_edit {
        background-color: #ffb300;
        color: #fff;
    }

    .boton_edit:hover {
        background-color: #ffe54c;
    }

    .boton_eliminar {
        background-color: #f44336;
        color: #fff;
    }

    .boton_eliminar:hover {
        background-color: #ff7961;
    }
</style>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th width="100px">Avance</th>
                                <th>Nombre</th>
                                <th>Año</th>
                                <th width="150px">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($actividad as $value) { ?>
                                <tr>
                                    <td></td>
                                    <td><?= $value->vActividad ?></td>
                                    <td><?= $value->iAnio ?></td>
                                    <td align="center">
                                        <button type="button" class="btn btn-circle waves-effect waves-light boton_edit" onclick="modificarAct(<?= $value->iIdDetalleActividad ?>)"><i class="mdi mdi-border-color"></i></button>
                                        <button type="button" class="btn btn-circle waves-effect waves-light boton_eliminar " onclick=""><i class="mdi mdi-close"></i></button>
                                        <button type="button" class="btn btn-circle waves-effect waves-light boton" onclick=""><i class="icon-badge"></i></button>
                                        <button type="button" class="btn btn-circle waves-effect waves-light boton_desc" onclick=""><i class="mdi mdi-download"></i></button>
                                        <button type="button" class="btn btn-circle waves-effect waves-light boton_InfTex" onclick=""><i class="icon-book-open"></i></button>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="holi"></div>

<script>
    $(document).ready(function() {
        $('#grid').DataTable();
        //$('#grid').DataTable().ajax.reload(); 
    });
</script>