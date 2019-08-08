<?= $tabla ?>

<script>
    $(document).ready(function() {
        $('#grid').DataTable();
    });
</script>

<script>
    function EliminarEntregable(id) {
        event.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_entregables/delete", //Nombre del controlador
            data: {
                'id': id
            },

            success: function(resp) {
                if (resp == true) {

                    regresarmodulo();
                    alerta('Eliminado exitosamente', 'success');

                } else {
                    alerta('Error al eliminar', 'error');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>