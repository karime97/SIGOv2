<div class="container-fluid">
    
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Búsqueda</h4>
                    <h6 class="card-subtitle"> </h6>
                    <form class="">
                    	<div class="row">
                    		<div class="col-4">
                    			<div class="form-group">
                    				<label for="eje">Eje</label>
		                            <select name="eje" id="eje" class="custom-select" onchange="cargarResponsables();">
		                            	<option value="0">Todos</option>
                                        <?=$options_ejes;?>
		                            </select>
		                        </div>
                    		</div>
                    		<div class="col-4">
                    			<div class="form-group">
                    				<label for="dependencia">Responsable</label>
		                            <select name="dependencia" id="dependencia" class="custom-select">
		                            	<option value="0">Todos</option>
                                        <?=$options_dependencias;?>
		                            </select>
		                        </div>
                    		</div>
                    		<div class="col-4">
                    			<div class="form-group">
                    				<label for="estatus">Estatus</label>
		                            <select name="estatus" id="estatus" class="custom-select">
		                            	<option value="0">Todos</option>
                                        <?=$options_estatus;?>
		                            </select>
		                        </div>
                    		</div>
                    	</div>

                    	<div class="row">
                    		<div class="col-4">
                    			<div class="form-group">
                    				<label for="eje">Última actualización posterior a:</label>
		                            <input type="text" class="form-control" name="fecha" id="fecha" value="">
		                        </div>
                    		</div>
                    		<div class="col-6">
                    			<div class="form-group">
                    				<label for="eje">Nombre o número de compromiso:</label>
		                            <input type="text" class="form-control" name="palabra" id="palabra" value="">
		                        </div>
                    		</div>
                    		<div class="col-2">
                    			<div class="form-group" style="margin-top: 30px;">
                    				<button type="submit" class="btn btn-primary btn-block">Buscar</button>
		                        </div>
                    		</div>
                    	</div>
                    </form>
                </div>
            </div>
        </div>
    </div>

  	<div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
	function cargarResponsables(){
        var valor = $("#eje").val();
        $.post("<?=base_url();?>C_compromisos/cargar_options/",{listado:'responsables',valor:valor},function(resultado,status){
            
            $('#dependencia option[value!="0"]').remove();
            $('#dependencia').append(resultado);
            
        });
    }
</script>