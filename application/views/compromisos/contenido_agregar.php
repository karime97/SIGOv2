<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-10">
                    <h4 class="card-title">Nuevo compromiso</h4>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-light" type="submit" onclick="buscarfinanciamiento2()"><i
                            class="mdi mdi-arrow-left">Regresar</i></button>
                </div>
                <div class="col-md-12"><br></div>
            </div>

            <form class="needs-validation was-validated" onsubmit="guardarCompromiso(this,event);" id="frmCompromiso">
       <div class="row">
       <div class="col-md-8"></div>
                <div class="col-md-2">
                <button type="submit" class="btn btn-success btn-block" onclick="guardar_compromiso()">Guardar</button>
                </div>
                <div class="col-md-2">
                <button type="submit" class="btn btn-danger btn-block" onclick="agregar_compromiso()">Cancelar</button>
                </div>
       </div>
                <div class="form-row">
                    <div class="col-md-6">
                        <label class="form-inline"  type="number">Numero:</label>
                        <input type="text" class="form-control" name="numero" require="requiere" />
                        <label class="form-inline">Nombre corto:</label>
                        <input type="text" class="form-control" require="requiere" name="nombrecorto" />
                        <label class="form-inline">Nombre completo:</label>
                        <textarea class="form-control"></textarea>
                        <label class="form-inline">Descripción:</label>
                        <textarea class="form-control"></textarea>
                    </div>

                    <div class="col-6">
                        <label class="form-inline">Observaciones</label>
                        <div class="form-group">
                        <textarea cols="80" id="editor1" name="editor1" rows="5" data-sample="1" data-sample-short=""></textarea>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-inline">Eje:</label>
                        <select class="form-control"></select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-inline">Política pública:</label>
                        <select class="form-control"></select>
                    </div>
                
                    <div class="col-md-3">
                        <label class="form-inline">Dependencia responsable:</label>
                        <select class="form-control"></select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-inline">Dependencia correspondiente:</label>
                        <select class="form-control"></select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-inline">Estatus del compromiso:</label>
                        <select class="form-control"></select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-inline">Eviencia fotografica:</label>
                        <div class="row">
                            <div class="col-md-2">
                                <a href="javascript:void(0)" class="message-item">
                                    <img src="<?=base_url()?>public/assets/images/users/4.jpg" alt="user"
                                        class="rounded-circle" height="50" width="50">
                                    <a>Eliminar</a>
                                </a>
                            </div>
                            <!-- nueva imagen -->
                            <div class="col-md-2">
                                <a href="javascript:void(0)" class="message-item">
                                    <img src="<?=base_url()?>public/assets/images/users/4.jpg" alt="user"
                                        class="rounded-circle" height="50" width="50">
                                    <a>Eliminar</a>
                                </a>
                            </div>
                            <!-- nueva imagen -->
                            <div class="col-md-2">
                                <a href="javascript:void(0)" class="message-item">
                                    <img src="<?=base_url()?>public/assets/images/users/4.jpg" alt="user"
                                        class="rounded-circle" height="50" width="50">
                                    <a>Eliminar</a>
                                </a>
                            </div>
                            <!-- nueva imagen -->
                            <div class="col-md-6">
                            <input type="file" name="" id="">
                        </div>
                    </div>
                </div>
            </form>
            <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function() {
                'use strict';
                window.addEventListener('load', function() {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function(form) {
                        form.addEventListener('submit', function(event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
            </script>
        </div>
    </div>
</div>


<script>
function guardarCompromiso(f, e) {
    e.preventDefault();

    // $.ajax({         
    //     type: "POST",
    //     url: "<?=base_url()?>C_financiamientos/insert", //Nombre del controlador
    //     data: $(f).serialize(),

    //     success: function(resp) {
    //       if(resp > 0){

    //         buscarfinanciamiento();
    //         alerta('Guardado exitosamente','success');

    //       } else {
    //         alerta('Error al guardar','error');
    //       }

    //     },
    //     error: function(XMLHttpRequest, textStatus, errorThrown) {

    //     }
    // });
}
</script>


<!-- <script src="<?=base_url()?>public/assets/libs/ckeditor/ckeditor.js"></script> -->

<script>

//default
// initSample();

//inline editor
// We need to turn off the automatic editor creation first.
// CKEDITOR.disableAutoInline = true;

// CKEDITOR.inline('editor2', {
//     extraPlugins: 'sourcedialog',
//     removePlugins: 'sourcearea'
// });

var editor1 = CKEDITOR.replace('editor1', {
    extraAllowedContent: 'div',
    height: 300
});
// editor1.on('instanceReady', function() {
//     // Output self-closing tags the HTML4 way, like <br>.
//     this.dataProcessor.writer.selfClosingEnd = '>';

//     // Use line breaks for block elements, tables, and lists.
//     var dtd = CKEDITOR.dtd;
//     for (var e in CKEDITOR.tools.extend({}, dtd.$nonBodyContent, dtd.$block, dtd.$listItem, dtd
//             .$tableContent)) {
//         this.dataProcessor.writer.setRules(e, {
//             indent: true,
//             breakBeforeOpen: true,
//             breakAfterOpen: true,
//             breakBeforeClose: true,
//             breakAfterClose: true
//         });
//     }
    // Start in source mode.
//     this.setMode('source');
// });
</script>

<script>
function guardar_compromiso(){
console.log($("#frmCompromiso").serializeArray());

}
</script>