<%-- 
    Document   : Admin
    Created on : 14/05/2021, 03:02:13 PM
    Author     : Beto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.PerfilVO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<%     UsuarioVO datVO = new UsuarioVO();
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
        <link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
              rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/charts/apexcharts.css">
        
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
        <link rel="stylesheet" type="text/css" href="app-assets/css/pages/dashboard-ecommerce.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/charts/chart-apex.css">
        <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/extensions/ext-component-toastr.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!-- END: Custom CSS-->


    </head>
    <body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
          data-menu="vertical-menu-modern" data-col="">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow">
            <div class="navbar-container d-flex content">
                <div class="bookmark-wrapper d-flex align-items-center">
                    <ul class="nav navbar-nav d-xl-none">
                        <li class="nav-item"><a class="nav-link menu-toggle" href="javascript:void(0);"><i class="ficon"
                                                                                                           data-feather="menu"></i></a></li>
                    </ul>

                </div>
                <ul class="nav navbar-nav align-items-center ml-auto">

                    <li class="nav-item dropdown dropdown-user">
                        <a class="nav-link dropdown-toggle dropdown-user-link"
                           id="dropdown-user" href="inicioAdmin.jsp" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <div class="user-nav d-sm-flex d-none">
                                <%=datVO.getUsuNombre()%>  <%=datVO.getUsuApellido()%> 
                            </div>

                            <span class="avatar"><img
                                    class="round"  src="app-assets/images/avatars/avatardefault.png" alt="avatar"
                                    height="40" width="40" style="background-color: white"><span class="avatar-status-online"></span></span>
                        </a>                        

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                            <!--
                            
                         <a class="dropdown-item" href="#"><%=datVO.getUsuLogin()%> </a>-->

                            <form>
                                <select onchange="enlace(value)" class="form-control border-0 custom-select">
                                    <option><i class="mr-50" data-feather="user"></i>Perfil</option>

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
                                <button name="opcion" value="" class="dropdown-item" href="#">

                                    <i class="mr-50" data-feather="power"></i>
                                    Salir</button>
                            </form>

                        </div>
                    </li>
                </ul>
            </div>
        </nav>    

        <!-- END: Header-->

        <!-- BEGIN: Main Menu-->
        <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="navbar-header" style="height: 15%;">
                <ul class="nav navbar-nav flex-row">

                    <li class="nav-item mr-auto">                    

                        <a class="navbar-brand" href="Admin.jsp"><span class="brand-logo">
                            </span>
                            <img  src="app-assets/images/logo/logoMunin_azul.png" style=" width: 50%;margin-left: 50px">

                        </a></li>

                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

                    <li class=" nav-item"><a class="d-flex align-items-center" href="inicioAdmin.jsp" target="myFrame"><i data-feather="home"></i><span 
                                class="menu-title text-truncate" data-i18n="inicio">Inicio</span></a>
                    </li>                    

                    <li class=" nav-item"><a class="d-flex align-items-center" href="reporteInventario.jsp" target="myFrame"><i data-feather="activity"></i><span
                                class="menu-title text-truncate" data-i18n="reportes">Reportes</span></a>                        
                    </li>                    

                    <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="settings"></i><span
                                class="menu-title text-truncate" data-i18n="configuracion">Configuración</span></a>
                        <ul class="menu-content">
                            <li><a class="d-flex align-items-center" href="bodega.jsp" target="myFrame"><i
                                        data-feather="circle"></i><span class="menu-item" data-i18n="List">Bodegas</span></a>
                            </li>
                            <li><a class="d-flex align-items-center" href="categoria.jsp" target="myFrame"><i
                                        data-feather="circle"></i><span class="menu-item" data-i18n="List">Categorías</span></a>
                            </li>

                        </ul>
                    </li>

                </ul>
            </div>
        </div>
        <!-- END: Main Menu-->

        <!-- BEGIN: Content-->  

        <div class="app-content content">  

            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>

            <div class="content-wrapper" >
                <iframe scrolling="no" name="myFrame" src="inicioAdmin.jsp" style="width: 100%;height: 1100px;"></iframe> 

            </div>

        </div>

        <!-- END: Content-->

        <div class="sidenav-overlay"></div>
        <div class="drag-target"></div>


        <!-- BEGIN: Footer-->

        <footer class="footer footer-static footer-light">
            <p class="clearfix mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021<a
                        class="ml-25" href="index.jsp" target="_blank">Munin Inventarios</a><span
                        class="d-none d-sm-inline-block">, Todos los Derechos Reservados</span></span></p>
        </footer>
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>


        <!-- END: Footer-->


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