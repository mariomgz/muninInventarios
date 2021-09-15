<%-- 
    Document   : reporteInventario
    Created on : 29/05/2021, 12:49:35 PM
    Author     : Beto
--%>

<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="es-419">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>
        <title>Reportes Munin Inventarios</title>
        <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
              rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">        
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/themes/bordered-layout.css">

        <!-- BEGIN: Page CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/css/core/menu/menu-types/vertical-menu.css">

        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!-- END: Custom CSS-->

    </head>

    <div class="content-header row">
        <div class="content-header-left col-md-9 col-12 mb-2">
            <div class="row breadcrumbs-top">
                <div class="col-12">
                    <div class="breadcrumb-wrapper">
                        <ol class="breadcrumb bg-light">
                            <li class="breadcrumb-item"><a href="inicioAdmin.jsp">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Reportes
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN: Content-->
    <div class="content-body">

        <section id="card-demo-example">

            <div class="row">

                <div class="col-md-6 col-lg-4">

                    <div class="card">
                        <form method="post" action="GenerarPDF.jsp" target="_black">

                            <div class="card-body">
                                <h4 class="card-title">Inventario General</h4>
                                <p class="card-text">
                                    Se incluye el stock de todos los productos.
                                </p>
                                
                                <input class="btn btn-info mr-1" type="submit" value="Generar Reporte">
                            </div>
                        </form>
                    </div>

                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <form method="post" action="GenerarParametrizadoPDF.jsp" target="_black">
                            <div class="card-body">
                                <h5 class="card-title">Inventario por Categoría</h5>
                                <p class="card-text">Stock filtrado por categoría.</p>
                                <select  name="categoria"  class="form-control">                                  

                                    <option>Seleccione...</option>
                                    <%
                                        CategoriaDAO categoriaDAO = new CategoriaDAO();
                                        for (CategoriaVO categoriaVO : categoriaDAO.listar()) {

                                    %>
                                    <option   class="form-control"
                                              value="<%=categoriaVO.getCategoriaId()%>"><%=categoriaVO.getNombreCategoria()%></option>

                                    <%}%>                               

                                </select>
                                <br>

                                <input class="btn btn-info" type="submit" value="Generar Reporte">
                            </div>
                        </form>                   

                    </div>
                </div>

            </div>
        </section>

    </div>

    <!-- BEGIN: Vendor JS-->
    <script src="app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="app-assets/vendors/js/charts/apexcharts.min.js"></script>
    <script src="app-assets/vendors/js/extensions/toastr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="app-assets/js/core/app-menu.js"></script>
    <script src="app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="app-assets/js/scripts/pages/dashboard-ecommerce.js"></script>
    <!-- END: Page JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/jszip.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/pdfmake.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/vfs_fonts.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/buttons.html5.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/buttons.print.min.js"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.rowGroup.min.js"></script>
    <script src="app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>

    <script>
        $(window).on('load', function () {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
    </script>
    <!-- /#page-content-wrapper -->


    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="template/jquery.min.js"></script>
    <script src="template/bootstrap.bundle.min.js"></script>
    <script src="alertifyjs/alertify.js" ></script>
    <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>


    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

</html>