<%-- 
    Document   : edit
    Created on : Oct 26, 2014, 10:19:58 AM
    Author     : A.D
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="id.dewantoko.tutorial.bean.Mahasiswa"%>
<%@page import="id.dewantoko.tutorial.dao.MahasiswaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Mahasiswa mhs = new Mahasiswa();
    MahasiswaDAO dao = new MahasiswaDAO();
    List<Mahasiswa> list = dao.listMahasiswa();
    String pid = request.getParameter("id");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>
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
                            <h1 id="forms">Edit Mahasiswa</h1>
                            <a href="mahasiswa?action=form-add" class="btn btn-primary btn-xs">Add Record</a>
                            <a href="mahasiswa?action=list-mahasiswa" class="btn btn-primary btn-xs">View All</a>
                        </div>
                    </div>
                </div>
                <div class="row" id="form-add">
                    <div class="col-lg-6">
                        <div class="well bs-component">    
                            <%
                                if (!((pid) == null)) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    int npm = Integer.parseInt(request.getParameter("npm"));
                                    mhs = dao.cariMahasiswa(id, npm);
                            %>
                            <form class="form-horizontal" method="post" action="mahasiswa">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="inputId" readonly="readonly" value="<%=mhs.getId()%>">
                                <fieldset>
                                    <div class="form-group">
                                        <label for="inputNPM" class="col-lg-3 control-label">NPM</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputNPM" name="inputNPM" value="<%=mhs.getNpm()%>" placeholder="NPM" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputNama" class="col-lg-3 control-label">Nama</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputNama" name="inputNama" value="<%=mhs.getNama()%>" placeholder="Nama" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTempatLahir" class="col-lg-3 control-label">Tempat Lahir</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" id="inputTempatLahir" name="inputTempatLahir" value="<%=mhs.getTlahir()%>" placeholder="Tempat Lahir" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTanggalLahir" class="col-lg-3 control-label">Tanggal Lahir</label>
                                        <div class="col-lg-9" id="datepicker">
                                            <input class="form-control" id="inputTanggalLahir" name="inputTanggalLahir" value="<%=sdf.format(mhs.getTgllahir())%>" placeholder="Tanggal Lahir" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Jenis Kelamin</label>
                                        <div class="col-lg-9">
                                            <div class="radio">
                                                <label>
                                                    <input name="inputJenisKelamin" value="P" <% if ((mhs.getJkelamin().equalsIgnoreCase("P"))) { %> checked="" <% } %> type="radio" required="">
                                                    Pria
                                                </label>                   
                                                <label>
                                                    <input name="inputJenisKelamin" value="W" <% if ((mhs.getJkelamin().equalsIgnoreCase("w"))) { %> checked="" <% } %> type="radio" required="">
                                                    Wanita
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAlamat" class="col-lg-3 control-label">Alamat</label>
                                        <div class="col-lg-9">
                                            <textarea class="form-control" name="inputAlamat" rows="5" id="textArea" style="resize: none" required=""><%=mhs.getAlamat()%></textarea>                   
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
                            <% } else { %>
                            <h1 id="forms">Data not found</h1>
                            <% }%>
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