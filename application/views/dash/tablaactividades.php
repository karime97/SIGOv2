<div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered display" style="width:100%" id="grid">
                        <thead>
                            <tr>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($actividades2 as $act2) {
                                ?>
                                <tr>
                                    <td>
                                        <div class="col-md-12" style="background-color: white;">
                                            <div class="row">
                                                <div class="col-md-2" style="padding-top: 1rem;">

                                                </div>
                                                <div class="col-md-6" style="color: black; font-size: 120%; padding: 2rem;">
                                                <label style="display: none;"><?php echo $act2['iIdActividad']; ?></label>
                                                <a style="cursor:pointer;"><?php echo $act2['vActividad']; ?></a>
                                                </div>
                                                <div class="col-md-1">
                                                    <div id="basic-doughnut2" style="width: 100%; height:100%;"></div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div style="position: relative; top: 45%; left: -90%; font-size: 70%; color: #11386b">45%</div>
                                                    <div style="position: relative; top: 60%; left: -103%; font-size: 70%; color: #11386b;">AVANCE GENERAL</div>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>