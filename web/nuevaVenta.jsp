<%-- 
    Document   : registrarVenta
    Created on : 19/04/2021, 01:15:46 PM
    Author     : Beto
--%>



<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.ProductoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="modeloVO.VentaVO"%>
<%@page import="modeloDAO.VentaDAO"%>

<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" type="text/css" href="css/styleLogin.css"> 
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">    

        <title>Nueva Venta Munin Inventarios</title>
        <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
              rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">        
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap.css">
        <!--
        <link rel="stylesheet" type="text/css" href="app-assets/css/bootstrap-extended.css">  -->      
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
                            <li class="breadcrumb-item active">Ventas
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN: Content-->
    <div class="content-body">

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
        <br>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                      
            <div class="card">
                <div class="card-body">

                    <form action="Venta" method="post" id="frmVenta">                                   

                        <div class="form-group d-flex row"> 

                            <div class=" form-group col-xs-6 col-sm-6 col-md-3 col-lg-4 d-flex">

                                <!--
                                <input type="text" name="textId" value="${c.getClienteId()}"
                                       class="form-control" placeholder="Buscar ID Cliente" >-->
                                <select  name="textId"  class="form-control">  

                                    <option>Seleccione un Cliente...</option>

                                    <%
                                        ClienteDAO clienteDAO = new ClienteDAO();
                                        for (ClienteVO clienteVO : clienteDAO.listar()) {

                                    %>

                                    <option   class="form-control"
                                              value="<%=clienteVO.getClienteId()%>"><%=clienteVO.getClienteId()%></option>


                                    <%}%>


                                </select>
                                <div> 
                                    <button type="submit" name="opcion" id="buscarStock" value="buscarCliente" class="btn btn-outline-info ">Buscar</button>
                                    <!--<div >
                                        <button class="btn btn-outline-secondary bg-dark text-white" type="text" value="buscarClientes" name="opcion" style="margin-left: 5px">Buscar</button>                                            
                                    </div>-->
                                </div> 

                            </div> 

                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-5 ">
                                <input type="text" name="textNombre"  placeholder="Nombre Cliente" value="${c.getClienteNombre()} ${c.getClienteApellido()}" class="form-control" readonly >                               
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-5 col-lg-3 ">


                                <%
                                    Date dNow = new Date();
                                    SimpleDateFormat ft
                                            = new SimpleDateFormat("dd/MM/yyyy");
                                    String currentDate = ft.format(dNow);
                                %>
                                <input type="text" name="textFecha"  value="<%=currentDate%>" class="form-control" readonly="" >
                            </div>                                        

                        </div> 



                        <div class="form-group d-flex row">

                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-4 d-flex" style="margin-top: 30px">
                                <!--
                                <input type="text" name="textProductoId" value="${p.getProductoId()}"
                                       class="form-control" placeholder="Buscar ID Producto" aria-label="Recipient's username" aria-describedby="basic-addon2" id="btnPrueba">-->
                                <select  name="textProductoId"  class="form-control" id="buscarProductos">  

                                    <option>Seleccione un Producto...</option>

                                    <%
                                        ProductoDAO productoDAO = new ProductoDAO();
                                        for (ProductoVO productoVO : productoDAO.listar()) {

                                    %>

                                    <option   class="form-control"
                                              value="<%=productoVO.getProductoId()%>"><%=productoVO.getProductoNombre()%></option>


                                    <%}%>


                                </select>

                                <div> 
                                    <button type="submit" name="opcion" value="buscarProducto" class="btn btn-outline-info " id="buscarProductos"   >Buscar</button>
                                    <!--<div >
                                        <button class="btn btn-outline-secondary bg-dark text-white" type="text" value="buscarClientes" name="opcion" style="margin-left: 5px">Buscar</button>                                            
                                    </div>-->
                                </div> 
                            </div>                                       

                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <label>Nombre Producto:</label>  
                                <input type="text" name="textProductoNombre" placeholder="" value="${p.getProductoNombre()}" class="form-control"  readonly="" id="producto">                                              
                            </div> 

                            <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                <label>Precio:</label>   
                                <input type="text" name="textProductoPrecioVenta" placeholder="$" value="${p.getProductoPrecioVenta()}" class="form-control" readonly>                                                                                     
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                <label>Cantidad:</label>   
                                <input type="text" name="textProductoCantidad" placeholder="" value="1" class="form-control">                                                                                     
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-2 col-lg-1">
                                <label>*Stock:</label>  
                                <input type="text" name="textProductoStock" id="stock" placeholder="" value="${p.getStock()}" 
                                       class="form-control" readonly>                                            
                            </div>

                        </div> 

                        <div class="card-footer d-flex bg-white">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-1 ml-auto">

                                <button type="submit" name="opcion" value="Agregar" 
                                        class="btn btn-info mr-1" id="agregar" >Agregar</button>

                            </div>                                
                        </div>


                    </form>                          

                </div>                            

            </div>
        </div>
        <br>

        <form action="Venta" method="post" id="frmNuevaVenta">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="card">
                    <div class="card-body">

                        <table class="table table-hover table-sm table-responsive-xl">

                            <thead class="thead">
                                <tr>
                                    <th>ITEM</th>                                            
                                    <th>REFERENCIA</th>
                                    <th>NOMBRE</th>                                            
                                    <th>PRECIO</th>
                                    <th>CANTIDAD</th>
                                    <th>SUBTOTAL</th>
                                    <th></th>

                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach var="list" items="${lista}">

                                    <tr>
                                        <td>${list.getItem()}</td>                                                
                                        <td>${list.getIdProducto()}</td>
                                        <td>${list.getDescripcionP()}</td>                                                
                                        <td>$ ${list.getPrecio()}</td>                                                
                                        <td class="btn-group">
                                            <input type="hidden" id="idpro" value="${list.getIdProducto()}">
                                            <input type="number" id="Cantidad" value="${list.getCantidad()}" class="form-control col-md-8 text-center bg-blue" min="1">
                                        </td>
                                        <td>$ ${list.getSubtotal()}</td>

                                        <td class="btn-group">  

                                            <input type="hidden" id="idp" value="${list.getIdProducto()}">

                                            <a href="#" id="btnBorrar" class="lnr lnr-trash" style="margin-left: 5px;"></a>

                                        </td>

                                    </tr>


                                </c:forEach>                                        


                            </tbody>

                        </table>

                    </div>

                    <div class="card-footer d-flex bg-white">

                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 ml-auto">
                            <input type="text" name="textTotal" value="$ ${totalpagar}" class="form-control">
                        </div>
                    </div>
                    <div class="card-footer d-flex bg-white">
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 ml-auto">

                            <a href="Venta?opcion=limpiarTabla" class="btn btn-outline-secondary" >Cancelar</a> 
                            <a href="Venta?opcion=GenerarVenta" class="btn btn-info mr-1">Generar Venta</a> 

                        </div>                                
                    </div>
                </div>

            </div>

        </form>

    </div> 

    <!-- /#wrapper -->

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

    <!-- Bootstrap core JavaScript -->

    <script src="alertifyjs/alertify.js" ></script>          

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/scriptUsuario.js" type="text/javascript"></script>

    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

    <script type="text/javascript">


        $(document).ready(function () {

            var producto = $('#frmVenta #producto').val();


            if (producto === "") {

                $("#frmVenta #agregar").hide()();
                //return false;
            }

        });


    </script>


</html>
