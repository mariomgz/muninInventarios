<%-- 
    Document   : index
    Created on : 12/04/2021, 01:59:59 PM
    Author     : Beto
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <title>Munin Inventarios</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assetsDiseno/css/fontawesome.css">
        <link rel="stylesheet" href="assetsDiseno/css/templatemo-space-dynamic.css">
        <link rel="stylesheet" href="assetsDiseno/css/animated.css">
        <link rel="stylesheet" href="assetsDiseno/css/owl.css">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700|Poppins" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="assetsDiseno/css/bootstrap.min.css" rel="stylesheet">

        <!-- Magnificpopup Css -->
        <link rel="stylesheet" type="text/css" href="assetsDiseno/css/magnific-popup.css">

        <!-- Bootstrap core CSS -->
        <link href="assetsDiseno/css/materialdesignicons.min.css" rel="stylesheet">
        <link href="assetsDiseno/css/fontawesome.css" rel="stylesheet">
        <link href="assetsDiseno/css/pe-icon-7-stroke.css" rel="stylesheet">

        <!--Slider-->
        <link rel="stylesheet" href="assetsDiseno/css/owl.carousel.min.css" />
        <link rel="stylesheet" href="assetsDiseno/css/owl.theme.css" />
        <link rel="stylesheet" href="assetsDiseno/css/owl.transitions.css" />
        <link rel="stylesheet" href="assetsDiseno/css/slick.css" />
        <link rel="stylesheet" href="assetsDiseno/css/slick-theme.css" />

        <!-- Custom styles for this template -->
        <link href="assetsDiseno/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assetsDiseno/css/estilos.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="assetsDiseno/css/menu.css" rel="stylesheet">
        <link href="assetsDiseno/css/default.css" rel="stylesheet">
        <link href="assetsDiseno/css/menu-small.css" rel="stylesheet">
        <!--
          
      TemplateMo 562 Space Dynamic
      
      https://templatemo.com/tm-562-space-dynamic
      
        -->
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** 
                            <a href="index.html" class="logo">
                              <h4>Spac<span>Dyna</span></h4>
                            </a>-->
                            <div class="col-xs-6 col-sm- col-md-12 col-lg-">
                                <img class="float-start img-responsive" src="assetsDiseno/images/Logo_munin.png" style="width: 80px; ">
                            </div>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="#top" class="active">Inicio</a></li>
                                <li class="scroll-to-section"><a href="#about">Características</a></li>
                                <li class="scroll-to-section"><a href="#ventajas">Ventajas</a></li>
                                <li class="scroll-to-section"><a href="#portfolio">Módulos</a></li>
                                <li class="scroll-to-section"><a href="#funcionalidad">Funcionalidades</a></li>
                                <li class="scroll-to-section"><a href="#blog">Planes</a></li>
                                <li class="scroll-to-section"><a href="#contact">Contacto</a></li>
                                <li class="scroll-to-section">
                                    <div class="main-red-button"><a href="inicioSesion.jsp">Iniciar Sesión</a></div>
                                </li>
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-6 align-self-center">
                                <div class="left-content header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                    <h6>Bienvenidos</h6>
                                    <h2><em>Munin Inventarios</em></h2>

                                    <p>Munin es una solución integral de inventarios en la nube que te permite gestionar tu negocio
                                        controlando tus ventas, compras, clientes, proveedores, inventarios y te permite generar reportes para
                                        que sepas qué decisiones tomar inteligentemente.</p>

                                </div>
                            </div>
                            <div class="img col-sm-6 col-md-6 col-lg-6">

                                <div class="imagehome">
                                    <img src="assetsDiseno/images/vectorGrafico4.jpg" style="width: 120%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="about" class="about-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="left-image wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                            <img src="assetsDiseno/images/about-left-image.png" alt="person graphic">
                        </div>
                    </div>
                    <div class="col-lg-8 align-self-center">
                        <div class="services">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
                                        <div class="icon">
                                            <img src="assetsDiseno/images/service-icon-01.png" alt="reporting">
                                        </div>
                                        <div class="right-text">
                                            <h4>Facturación electrónica</h4>
                                            <p>Crea facturas electrónicas válidas ante la DIAN.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.7s">
                                        <div class="icon">
                                            <img src="assetsDiseno/images/service-icon-02.png" alt="">
                                        </div>
                                        <div class="right-text">
                                            <h4>Control de inventarios</h4>
                                            <p>Controla con un clic y en tiempo real los productos de tus
                                                bodegas.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="item wow fadeIn" data-wow-duration="1s" data-wow-delay="0.9s">
                                        <div class="icon">
                                            <img src="assetsDiseno/images/service-icon-03.png" alt="">
                                        </div>
                                        <div class="right-text">
                                            <h4>Reportes inteligentes</h4>
                                            <p>Accede a tus reportes contables cuando los necesites.</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="ventajas" class="our-blog section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-12">
                        <div class="section-title text-center">
                            <div class="spacer-30"></div>
                            <h3>Ventajas</h3>

                            <div class="spacer-15"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.25s">
                        <div class="left-image" style="width: 50%; margin-top: 100px; margin-left: 200px;">
                            <img src="assetsDiseno/images/blog-dec.png" alt="">

                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.25s">
                        <div class="right-list">
                            <ul>
                                <li>
                                    <div class="left-content align-self-center">

                                        <a href="#">
                                            <h4>Flexible</h4>
                                        </a>
                                        <p>Pagas mensualmente por usar nuestro servicio. Puedes cancelarlo en cualquier momento.</p>
                                    </div>

                                </li>
                                <li>
                                    <div class="left-content align-self-center">

                                        <a href="#">
                                            <h4>Adaptable</h4>
                                        </a>
                                        <p>A medida que tu empresa crece puedes adquirir módulos adicionales cuando los necesites.</p>
                                    </div>

                                </li>
                                <li>
                                    <div class="left-content align-self-center">

                                        <a href="#">
                                            <h4>Bajo Costo</h4>
                                        </a>
                                        <p>Al estar en la nube, no requieres costosas inversiones. Solo necesitas un computador con navegador
                                            y una conexión a Internet.</p>
                                    </div>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="portfolio" class="our-portfolio section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3" style="margin-bottom: 70px;">
                        <div class="section-heading  wow bounceIn" data-wow-duration="1s" data-wow-delay="0.2s">
                            <div class="section-title text-center">
                                <div class="spacer-30"></div>
                                <h3>Módulos Personalizados</h3>

                                <div class="spacer-30"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <a href="#">
                            <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.3s">
                                <div class="hidden-content">
                                    <h4>Contabilidad automatizada</h4>
                                    <p>Simplifica el proceso contable de tu empresa con reportes
                                        inmediatos.</p>
                                </div>
                                <div class="showed-content">
                                    <img src="assetsDiseno/images/services/accounting.jpg" alt="">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a href="#">
                            <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.4s">
                                <div class="hidden-content">
                                    <h4>Reportes inteligentes</h4>
                                    <p>Accede a tus reportes contables cuando los necesites y
                                        siempre actualizados.</p>
                                </div>
                                <div class="showed-content">
                                    <img src="assetsDiseno/images/services/reports.jpg" alt="">
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-sm-6">
                        <a href="#">
                            <div class="item wow bounceInUp" data-wow-duration="1s" data-wow-delay="0.6s">
                                <div class="hidden-content">
                                    <h4>Cotizaciones</h4>
                                    <p>Crea y envía cotizaciones a tus clientes en segundos.</p>
                                </div>
                                <div class="showed-content">
                                    <img src="assetsDiseno/images/services/quotation.jpg" alt="">
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div id="funcionalidad" class="our-services section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3" style="margin-bottom: 70px;">
                        <div class="section-heading  wow bounceIn" data-wow-duration="1s" data-wow-delay="0.2s">
                            <div class="section-title text-center">
                                <div class="spacer-30"></div>
                                <h3>Funcionalidades</h3>

                                <div class="spacer-30"></div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 align-self-center  wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.2s">
                        <div class="left-image">
                            <img src="assetsDiseno/images/services-left-image.png" alt="">
                        </div>
                    </div>

                    <div class="col-lg-6 wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.2s">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="first-bar progress-skill-bar">
                                    <h4>Maneja múltiples bodegas y localizaciones</h4>

                                    <div class="filled-bar"></div>
                                    <div class="full-bar"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="second-bar progress-skill-bar">
                                    <h4>Consulta reportes en tiempo real para tener siempre visibilidad de tus inventarios</h4>

                                    <div class="filled-bar"></div>
                                    <div class="full-bar"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="third-bar progress-skill-bar">
                                    <h4>Una interfaz de usuario rápida diseñada para la gestión moderna de inventario</h4>

                                    <div class="filled-bar"></div>
                                    <div class="full-bar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- PRICE START -->
        <div id="blog" class=" our-portfolio section">
            <section class="section pt-0" id="price">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-12">
                            <div class="section-title text-center">
                                <div class="spacer-30"></div>
                                <h3>Planes</h3>
                                <p>Elige uno de nuestros planes y empieza a crecer con Munin</p>
                                <div class="spacer-15"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <div class="col-lg-6 col-md-6">
                            <div class="pricing-table-wraper mt-30">
                                <div class="pricing-table" style="border-radius: 20px;">
                                    <div class="pricing-header">
                                        <h4 class="text-uppercase">PYME</h4>
                                        <div class="price"><span><sup>$</sup>60.000</span><span> Mes</span></div>
                                    </div>
                                    <div class="pricing-body">
                                        <ul class="list list-unstyled">
                                            <li>2 Usuarios con acceso a Munin</li>
                                            <li>2 Bodegas de inventario</li>
                                            <li>Dashboard Inteligente</li>
                                            <li>Integración con otras aplicaciones</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <a href="#" class="btn btn-custom">Empieza Gratis</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6">
                            <div class="pricing-table-wraper mt-30">
                                <div class="pricing-table" style="border-radius: 20px;">
                                    <div class="lable">
                                        <h6 class="best mb-0 text-uppercase">Plan &nbsp;Sugerido</h6>
                                    </div>
                                    <div class="pricing-header">
                                        <h4 class="text-uppercase">PRO</h4>
                                        <div class="price"><span><sup>$</sup>100.000</span><span> Mes</span></div>
                                    </div>
                                    <div class="pricing-body">
                                        <ul class="list list-unstyled">
                                            <li>3 Usuarios con acceso a Munin</li>
                                            <li>10 Bodegas de inventario</li>
                                            <li>Dashboard Inteligente</li>
                                            <li>Integración con otras aplicaciones</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <a href="#" class="btn btn-custom">Empieza Gratis</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- PRICE START -->


        <div id="contact" class="contact-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-center wow fadeInLeft" data-wow-duration="0.5s" data-wow-delay="0.25s">
                        <div class="section-heading">
                            <h2>Contáctanos.</h2>
                            <i>
                                <p>"Con Munin cuentas con el más completo Centro de Ayuda para avanzar a tu ritmo."</p>
                            </i>
                            <p>Queremos que te pongas en contacto con nosotros para compartir tus comentarios, opiniones y necesidades o
                                para recibir una asesoría completa.</p>
                            <div class="phone-info">
                                <h4>Llámanos al <span><i class="fa fa-phone"></i> <a href="#">010-020-0340</a></span></h4>
                                <h4>Nos pueden encontrar en Bogotá <span><i class="fa fa-location-arrow"></i> <a href="#"></a></span></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInRight" data-wow-duration="0.5s" data-wow-delay="0.25s">
                        <form id="contact" action="" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <fieldset>
                                        <input type="name" name="name" id="name" placeholder="Nombre" autocomplete="on" required>
                                    </fieldset>
                                </div>
                                <div class="col-lg-6">
                                    <fieldset>
                                        <input type="surname" name="surname" id="surname" placeholder="Apellido" autocomplete="on" required>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Correo" required="">
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <textarea name="message" type="text" class="form-control" id="message" placeholder="Mensaje"
                                                  required=""></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">

                                    <button type="submit" id="form-submit" class="main-button">Enviar Mensaje</button>

                                </div>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.25s">
                        <p>© Copyright 2021 Munin Inventarios. Todos los derechos reservados.

                        </p>
                        <!--
                        <p><a href='https://www.freepik.es/vectores/tiempo'>www.freepik.es</a></p>
                        -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Scripts -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assetsDiseno/js/owl-carousel.js"></script>
        <script src="assetsDiseno/js/animation.js"></script>
        <script src="assetsDiseno/js/imagesloaded.js"></script>
        <script src="assetsDiseno/js/templatemo-custom.js"></script>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assetsDiseno/js/jquery.min.js"></script>
        <script src="assetsDiseno/js/popper.min.js"></script>
        <script src="assetsDiseno/js/bootstrap.min.js"></script>
        <script src="assetsDiseno/js/scrollspy.min.js"></script>
        <!-- Portfolio -->
        <script src="assetsDiseno/js/jquery.magnific-popup.min.js"></script>
        <script src="assetsDiseno/js/isotope.js"></script>
        <!-- Carousel -->
        <script src="assetsDiseno/js/owl.carousel.min.js"></script>
        <script src="assetsDiseno/js/owlcarousel.init.js"></script>
        <script src="assetsDiseno/js/slick.min.js"></script>
        <script src="assetsDiseno/js/slick.init.js"></script>
        <!--custom script-->
        <script src="assetsDiseno/js/app.js"></script>

    </body>

</html>