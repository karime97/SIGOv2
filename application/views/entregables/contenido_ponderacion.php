<?= $contenido ?>

<script>
    $(document).ready(function(){
        var total = 0;
        $('.ponderacion').each(function(index, value) {
            total += eval($(this).val());
        })
        $("#total").text(total);
        $("#totalponderacion").val(total);
    });

    function sumar(){
        var total = 0;
        $(".ponderacion").each(function() {

            if (isNaN(parseFloat($(this).val()))) {
                total += 0;
            } else {
                total += parseFloat($(this).val());
            }
        });
        $("#total").text(total);
        $("#totalponderacion").val(total);
    }

    function guardarPonderacion(f, e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "<?= base_url() ?>C_entregables/restart_ponderacion", //Nombre del controlador
            data: $(f).serialize(),

            success: function(resp) {
                if (resp == "correcto") {

                    regresarmodulo();
                    alerta('Guardado exitosamente', 'success');

                }
                if (resp == "mayor") {

                    alerta('La ponderacion ingresada supera el total de 100, favor de verificar las ponderaciones', 'warning');

                }
                if (resp == "menor") {

                    alerta('La ponderacion ingresada no alcanza el total de 100, favor de verificar las ponderaciones', 'warning');

                }
                if (resp == "error") {

                    alerta('Error al guardar', 'error');
                }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }
</script>