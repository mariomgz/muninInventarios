<%-- 
    Document   : index
    Created on : 12/04/2021, 01:59:59 PM
    Author     : Beto
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es-419">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Inicio Munin Inventarios</title>
    </head>
    <body>

        <div class="container-fluid">

            <main>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                    </ol>
                </nav>

                <div class="fondo">

                    <section id="banner">

                        <div class="row align-items-center">

                            <div class="introBanner col-sm-5 col-md-5 col-lg-5">
                                <h1>Bienvenido a Munin</h1>                                    
                                <h4>Software de Inventarios en la Nube</h4>                                  

                            </div>

                            <div class="img col-sm-7 col-md-7 col-lg-7">

                                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>

                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="images/laptopGrafico.jpg" class="d-block w-100 rounded" alt="...">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>Reportes Inteligentes</h3>
                                                <p>Accede a reportes fácilmente y siempre actualizados.</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img src="images/computer-writing.jpg" class="d-block w-100 rounded" alt="...">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>Equipo de Soporte</h3>
                                                <p>El equipo de soporte disponible para atender todas tus dudas.</p>
                                            </div>
                                        </div>                                                
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>

                            </div>
                        </div>

                    </section>

                </div>

            </main>

            <footer>
                <div>
                    <section id="fcred" class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <p>Todos los Derechos Reservados &copy;</p>
                    </section>
                </div>

            </footer>
            
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="template/jquery.min.js"></script>
<script src="template/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
crossorigin="anonymous"></script>


<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
</body>
</html>
