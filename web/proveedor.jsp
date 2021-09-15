<%-- 
    Document   : proveedor
    Created on : 18/05/2021, 12:50:41 PM
    Author     : Beto
--%>

<%@page import="modeloVO.CiudadVO"%>
<%@page import="modeloDAO.CiudadDAO"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="modeloVO.ProveedorVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.ClienteVO"%>

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
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css"> 

        <title>Proveedor Munin Inventarios</title>
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
                            <li class="breadcrumb-item"><a href="inicio.jsp">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Proveedores
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN: Content-->
    <div class="content-body">

        <!-- Basic Vertical form layout section start -->
        <section id="basic-vertical-layouts">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Datos del Proveedor</h4>
                        </div>
                        <div class="card-body">
                            <form class="form form-vertical" action="Proveedor" method="post" id="frmDatosProveedor">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical">NIT de proveedor</label>
                                            <input type="number" name="textProveedorId" 

                                                   <%
                                                       ProveedorVO proveedorEditarVO = (ProveedorVO) request.getAttribute("datosConsultados");
                                                       if (proveedorEditarVO != null) {

                                                   %> 

                                                   value="<%=proveedorEditarVO.getProveedorId()%>"
                                                   <%}%>
                                                   id="id_proveedor" required pattern="{2,40}" class="form-control" placeholder="Nit proveedor">



                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="contact-info-vertical">Nombre de Proveedor</label>
                                            <input type="text" name="textProveedorName" 
                                                   <%
                                                       if (proveedorEditarVO != null) {

                                                   %> 

                                                   value="<%=proveedorEditarVO.getNombreProveedor()%>"
                                                   <%}%>


                                                   id="nombre_proveedor" required pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,30}" class="form-control" placeholder="Nombre de Proveedor">



                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical">Ciudad </label>
                                            <select  name="textProveedorCiudad"  class="form-control"> 


                                                <%
                                                    if (proveedorEditarVO != null) {
                                                %> 
                                                <option  class="form-control"  value="<%=proveedorEditarVO.getCiudadProveedor()%>" label="Modificar Ciudad..." > </option>                                           
                                                <%
                                                    CiudadDAO ciudadDAO = new CiudadDAO();
                                                    for (CiudadVO ciudadVO : ciudadDAO.listar()) {

                                                %> 
                                                <option   class="form-control"
                                                          value="<%=ciudadVO.getCiudadId()%>"><%=ciudadVO.getNombreCiudad()%></option>
                                                <%}
                                                } else {%>
                                                <option>Seleccione...</option>
                                                <%
                                                    CiudadDAO ciudadDAO = new CiudadDAO();
                                                    for (CiudadVO ciudadVO : ciudadDAO.listar()) {

                                                %>
                                                <option   class="form-control"
                                                          value="<%=ciudadVO.getCiudadId()%>"><%=ciudadVO.getNombreCiudad()%></option>


                                                <%}%>
                                                <%}%>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical">Dirección</label>
                                            <input type="text" name="textProveedorDireccion" 
                                                   <%
                                                       if (proveedorEditarVO != null) {

                                                   %> 

                                                   value="<%=proveedorEditarVO.getDireccionProveedor()%>"
                                                   <%}%>

                                                   id="direccion_proveedor"  class="form-control" placeholder="Dirección">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical">Teléfono</label>   
                                            <input type="tel" name="textProveedorTel" id="tel_proveedor" 
                                                   <%
                                                       if (proveedorEditarVO != null) {

                                                   %> 

                                                   value="<%=proveedorEditarVO.getTelefonoProveedor()%>"
                                                   <%}%>

                                                   required pattern="{2,15}" class="form-control" placeholder="Telefono">
                                        </div> 
                                    </div>  



                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical">Email</label> 

                                            <input type="email" name="textProveedorEmail"
                                                   <%
                                                       if (proveedorEditarVO != null) {
                                                   %>                                            
                                                   value="<%=proveedorEditarVO.getEmailProveedor()%>"
                                                   <%}%>  
                                                   id="correo" required
                                                   class="form-control" placeholder="Email">
                                        </div> 
                                    </div> 



                                    <div class="col-12" id="botonesAgregar">

                                        <button type="reset" class="btn btn-outline-secondary">Cancelar</button>
                                        <button  type="submit" name="opcion" value="Agregar" class="btn btn-info mr-1">Agregar</button>

                                    </div>
                                    <br>
                                    <br>
                                    <br>

                                    <div class="col-12" id="botonesActualizar">
                                        <button type="reset" class="btn btn-outline-secondary">Cancelar</button>
                                        <button id="actualizar" type="submit" name="opcion" value="Actualizar" class="btn btn-info mr-1">Actualizar</button>

                                    </div>

                                </div>

                            </form>

                        </div>

                    </div>
                </div>

                <div class="col-md-9 col-12">
                    <div class="card" style="height: 740px">

                        <div class="card-body">   

                            <div class="card-header border-bottom">
                                <h4 class="card-title">Listado de Proveedores</h4>
                            </div>
                            <br>

                            <form action="Proveedor" method="post" id="frmProveedor">

                                <div class="container">
                                    <%                                    if (request.getAttribute(
                                                "mensajeError") != null) {
                                    %>
                                    <div style="color: red;">
                                        ${mensajeError}</div>
                                        <% } else {%> 
                                    <div style="color: #2196d0;">
                                        ${mensajeExito}</div>

                                    <%}%>  
                                </div>

                                <table class="table table-hover table-sm table-responsive-xl" id="tablax">

                                    <thead class="thead">
                                        <tr>                                        
                                            <th>NIT PROVEEDOR</th>                                        
                                            <th>NOMBRE</th> 
                                            <th>CIUDAD</th>
                                            <th>DIRECCIÓN</th> 
                                            <th>TELÉFONO</th>                                        
                                            <th>EMAIL</th>
                                            <th></th>
                                        </tr>
                                    </thead>    

                                    <tbody> 


                                        <%
                                            ProveedorVO proveedorVO = new ProveedorVO();
                                            ProveedorDAO proveedorDAO = new ProveedorDAO();

                                            ArrayList<ProveedorVO> listaProveedor = proveedorDAO.listar();

                                            for (int i = 0; i < listaProveedor.size(); i++) {

                                                proveedorVO = listaProveedor.get(i);


                                        %>


                                        <tr>                                     

                                            <td><%=proveedorVO.getProveedorId()%></td>
                                            <td><%=proveedorVO.getNombreProveedor()%></td>
                                            <td><%=proveedorVO.getCiudadProveedor()%></td>
                                            <td><%=proveedorVO.getDireccionProveedor()%></td>
                                            <td><%=proveedorVO.getTelefonoProveedor()%></td>                                                                               
                                            <td><%=proveedorVO.getEmailProveedor()%></td>                                         

                                            <td class="btn-group">

                                                <a href="Proveedor?opcion=Editar&documento=<%=proveedorVO.getProveedorId()%>"  id="borrar"><i data-feather="edit"></i></a>
                                                <a style="margin-left: 5px; " href="Proveedor?opcion=Borrar&documento=<%=proveedorVO.getProveedorId()%>"
                                                   onclick="return confirm('Estás seguro que deseas eliminar el registro?')"><i data-feather="delete"></i></a>

                                            </td>


                                        </tr>

                                        <% }%>                                  

                                    </tbody>

                                </table>
                            </form>

                        </div>
                    </div>

                </div>

            </div>

        </section>

    </div>
    <!-- Basic Vertical form layout section end -->

    <!-- END: Content-->

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

    <script>
        $(document).ready(function () {
            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items",
                    info: "Registros del _START_ al _END_ de un total de _TOTAL_",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                "bLengthChange": false
            });
        });
    </script>



    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

    <script type="text/javascript">


        $(document).ready(function () {

            var nombre = $('#frmDatosProveedor #id_proveedor').val();


            if (nombre === "") {

                $("#frmDatosProveedor #botonesActualizar").hide()();

            } else {

                $("#frmDatosProveedor #botonesAgregar").hide()();

            }


        });


    </script>

</html>
