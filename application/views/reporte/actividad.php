<!--titulo-->
<section>
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Listado de reportes</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a style="cursor:pointer;">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">...</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!--endtitulo-->
<br><br>
<!-- formulario -->
<section>
    <div class="col-12">
        <div class="card" style="padding: 2%;">
            <div class="col-md-12">
                <h5>Filtrar por:</h5>
                <hr>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="SelEje">Eje</label>
                            <select class="form-control" id="SelEje">
                                <option class="selected">Seleccione..</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="SelDep">Dependencia</label>
                            <select class="form-control" id="SelDep">
                                <option class="selected">Seleccione..</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="SelAño">Año</label>
                            <select class="form-control" id="SelAño">
                                <option class="selected">Seleccione..</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <h5>Incluir en el reporte</h5>
                <hr>

                <div class="row">
                    <div class="col-md-4">
                        <div class="checkbox">
                            <label><input type="checkbox" value="">Fuente de fianciamiento</label>
                        </div>
                        <br>
                        <div class="checkbox">
                            <label><input type="checkbox" value="">Entregables</label>
                        </div>
                        <div class="col-md-12">
                        <a style="cursor:pointer; color:blue;"><i class="m-r-10 mdi mdi-briefcase-download"></i>Descargar</a>
                        
                        </div>
                    </div>
                    <div class="col-md-4">
                    <div class="checkbox">
                            <label><input type="checkbox" value="">Alineacion al PED</label>
                        </div>
                        <br>
                        <div class="checkbox">
                            <label><input type="checkbox" value="">Avances</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                    <label><input type="checkbox" value="">UBP</label>
                    </div>
                </div>
                <div style="float:right;"> <button type="button" class="btn waves-effect waves-light btn-block btn-danger">Generar</button></div>
            </div>
        </div>
    </div>
</section>
<!-- fin tabla -->
<!-- endformulario-->