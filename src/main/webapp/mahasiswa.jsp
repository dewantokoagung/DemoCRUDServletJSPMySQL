<%-- 
    Document   : mahasiswa
    Created on : Oct 25, 2014, 4:01:35 PM
    Author     : A.D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Simple CRUD JSP</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="asset/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="asset/css/datepicker3.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="bs-docs-section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header">
                            <h1 id="forms">Entri Mahasiswa</h1>
                            <a href="mahasiswa?action=list-mahasiswa" class="btn btn-primary btn-xs">View All</a>
                        </div>
                    </div>
                </div>
                <div class="row" id="form-add">
                    <div class="col-lg-6">
                        <div class="well bs-component">    
                            <form class="form-horizontal" method="post" action="mahasiswa">
                                <input type="hidden" name="action" value="simpan"/>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="inputNPM" class="col-lg-3 control-label">NPM</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputNPM" name="inputNPM" placeholder="NPM" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputNama" class="col-lg-3 control-label">Nama</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputNama" name="inputNama" placeholder="Nama" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTempatLahir" class="col-lg-3 control-label">Tempat Lahir</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputTempatLahir" name="inputTempatLahir" placeholder="Tempat Lahir" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTanggalLahir" class="col-lg-3 control-label">Tanggal Lahir</label>
                                        <div class="col-lg-9" id="datepicker">
                                            <input class="form-control" id="inputTanggalLahir" name="inputTanggalLahir" placeholder="Tanggal Lahir" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Jenis Kelamin</label>
                                        <div class="col-lg-9">
                                            <div class="radio">
                                                <label>
                                                    <input name="inputJenisKelamin" value="P" checked="" type="radio" required="">
                                                    Pria
                                                </label>                   
                                                <label>
                                                    <input name="inputJenisKelamin" value="W" type="radio" required="">
                                                    Wanita
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAlamat" class="col-lg-3 control-label">Alamat</label>
                                        <div class="col-lg-9">
                                            <textarea class="form-control" name="inputAlamat" rows="5" id="textArea" style="resize: none" placeholder="Alamat" required=""></textarea>                   
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-9 col-lg-offset-3">
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                            <button type="reset" class="btn btn-default">Reset</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div> 
        <script src="asset/js/jquery-1.10.2.min.js"></script>
        <script src="asset/js/bootstrap.min.js"></script>
        <script src="asset/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            $('#datepicker input').datepicker({
                format: "dd-mm-yyyy",
                autoclose: true,
                todayHighlight: true
            });
        </script>
    </body>
</html> 

