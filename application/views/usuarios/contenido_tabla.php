<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th>Rol</th>
                                <th>Nombre completo</th>
                                <th>Usuario</th>
                                <th>Cargo</th>
                                <th>Dependencia</th>
                                <th>Correo institucional</th>
                                <th>Correo personal</th>
                                <th>Telefono</th>
                                <th>Celular</th>
                                <th>Fecha de nacimiento</th>
                                <th width="150px"> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            var_dump($consulta);
                            foreach($consulta as $value){ ?>
                            <tr>
                                <td></td>
                                <td><?= $value->vNombre." ".$value->vPrimerApellido." ".$value->vSegundoApellido ?></td>
                                <td><?= $value->vUsuario ?></td>
                                <td><?= $value->vCargo ?></td>
                                <td><?= $value->vDependencia ?></td>
                                <td><?= $value->vCorreo ?></td>
                                <td><?= $value->vCorreoPersonal ?></td>
                                <td><?= $value->vTelefono ?></td>
                                <td><?= $value->vCelular ?></td>
                                <td><?= $value->dFechaNacimiento ?></td>
                                <td>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-warning" onclick="modificar_usuario(<?= $value->iIdUsuario ?>)"><i class="mdi mdi-border-color"></i></button>
                                    <button type="button" class="btn btn-circle waves-effect waves-light btn-danger"><i class="mdi mdi-close" onclick="confirmar('¿Esta usted seguro?',EliminarUsuario,<?= $value->iIdUsuario ?>)"></i></button>
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