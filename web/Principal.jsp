<%-- 
    Document   : principal
    Created on : 15/04/2021, 12:16:43 PM
    Author     : Beto
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.PerfilVO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<%    UsuarioVO datVO = new UsuarioVO();
    datVO = (UsuarioVO) miSesion.getAttribute("datosPersonales");
%>

<html lang="es-419">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="js/Logica.js" type="text/javascript"></script>        
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>
        
        <title>Munin Inventarios</title>
    </head>
    <body>
        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class=" bg-blue  border-right" id="sidebar-wrapper">
                <div class="text-white sidebar-heading">Munin Inventarios</div>
                <div id="sidebar-accordion" class="accordion">
                    <div class="list-group ">
                        <a href="index.jsp" target="myFrame" class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-shopping-cart mr-3" aria-hidden="true"></i>INICIO
                        </a>
                        <a href="#cliente" data-toggle="collapse" aria-expanded="false"
                           class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-tachometer mr-3" aria-hidden="true"></i>CLIENTES
                        </a>
                        <div id="cliente" class="collapse" data-parent="#sidebar-accordion">
                            <a href="cliente.jsp"  target="myFrame"  class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Gestión Clientes
                            </a>                            

                        </div>
                        <a href="#proveedor" data-toggle="collapse" aria-expanded="false"
                           class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-tachometer mr-3" aria-hidden="true"></i>PROVEEDORES
                        </a>
                        <div id="proveedor" class="collapse" data-parent="#sidebar-accordion">
                            <a href="proveedor.jsp"  target="myFrame"  class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Gestión Proveedores
                            </a>                            

                        </div>                        
                        <a href="#producto" data-toggle="collapse" aria-expanded="false"
                           class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-tachometer mr-3" aria-hidden="true"></i>PRODUCTOS
                        </a>
                        <div id="producto" class="collapse" data-parent="#sidebar-accordion">
                            <a href="producto.jsp" target="myFrame" class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Gestión Productos
                            </a>                            

                        </div>
                        <a href="#venta" data-toggle="collapse" aria-expanded="false"
                           class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-tachometer mr-3" aria-hidden="true"></i>VENTAS
                        </a>
                        <div id="venta" class="collapse" data-parent="#sidebar-accordion">
                            <!--
                            <a href="venta.jsp"  target="myFrame"  class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Gestión Ventas-->

                            </a>
                            <a href="nuevaVenta.jsp" target="myFrame" class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Nueva Venta
                            </a>                            
                        </div>
                        <a href="#compra" data-toggle="collapse" aria-expanded="false"
                           class="list-group-item list-group-item-action bg-light text-blue">
                            <i class="fa fa-tachometer mr-3" aria-hidden="true"></i>COMPRAS
                        </a>
                        <div id="compra" class="collapse" data-parent="#sidebar-accordion">
                            <!--
                            <a href="venta.jsp"  target="myFrame"  class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Gestión Ventas-->

                            </a>
                            <a href="nuevaCompra.jsp" target="myFrame" class="list-group-item list-group-item-action bg-white text-dark pl-5">
                                Nueva Compra
                            </a>                            
                        </div>



                    </div>

                </div>

            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <button class="btn btn-info" id="menu-toggle">Menú </button>

                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="Cliente" id="navbarDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                    <%=datVO.getUsuNombre()%>  <%=datVO.getUsuApellido()%>                                     

                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                                    <!--
                                    
                                 <a class="dropdown-item" href="#"><%=datVO.getUsuLogin()%> </a>-->

                                    <form>
                                        <select onchange="enlace(value)" class="form-control border-0">
                                            <option>Perfil</option>

                                            <%
                                                PerfilVO perfilVO = new PerfilVO();
                                                ArrayList<PerfilVO> listaPerfiles = (ArrayList<PerfilVO>) miSesion.getAttribute("perfiles");
                                                for (int i = 0; i < listaPerfiles.size(); i++) {
                                                    perfilVO = listaPerfiles.get(i);
                                            %>
                                            <option value="<%=perfilVO.getNombrePerfil()%>"><%=perfilVO.getNombrePerfil()%></option>
                                            <% }%>
                                        </select>
                                    </form>
                                    <div class="dropdown-divider"></div>
                                    <form action="Sesiones" method="post">
                                        <button name="opcion" value="" class="dropdown-item" href="#">Salir</button>
                                    </form>
                                    <a </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>  

                <div class="m-4" style="height: 90%" >

                    <iframe name="myFrame" src="index.jsp" style="width: 100%; height: 100%"></iframe>


                </div>

            </div>            


        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="template/jquery.min.js"></script>
    <script src="template/bootstrap.bundle.min.js"></script>
    <script src="alertifyjs/alertify.js" ></script>    
    <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/scriptUsuario.js" type="text/javascript"></script>

    <!-- Menu Toggle Script -->
    <script>
                                            $("#menu-toggle").click(function (e) {
                                                e.preventDefault();
                                                $("#wrapper").toggleClass("toggled");
                                            });
    </script>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function () {

        $('#ejecutar').click(function () {
            alertify.success("Mensaje Éxito");
        });
    });
</script>
