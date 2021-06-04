<%-- 
    Document   : crearUsuario
    Created on : 10/04/2021, 04:59:09 PM
    Author     : Beto
--%>

<%@page import="controlador.UsuarioControlador"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es-419">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styleLogin.css"> 
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>


        <title>Registro - Munin Inventarios</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
              integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


    </head>
    <body oncopy="return false" onpaste="return false">
        <div class="container">

            <main>

                <div class="register" style="min-height: 850px;">

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <img style="width:20%;display: block;margin: auto;" src="images/Logo_munin.png">
                    </div>

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <h2 style="text-align: center;">Registro de nuevo usuario</h2>
                    </div>

                    <form action="Usuario" method="post" autocomplete="off" id="frmRegistro">

                        <div style="color: red;text-align: center; margin-bottom: 10px">                              

                            <%
                                if (request.getAttribute("mensajeError") != null) {                                    
                            %>
                            ${mensajeError}
                            <% } else {%>
                            ${mensajeExito}
                            <%}%>             

                        </div>

                        <div class="row">

                            <div class="col-xs-5 col-sm- col-md-6 col-lg-">
                                <label style="text-align: left;" for="textNombre">Nombre:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="textNombre" name="textNombre" id="nombre" placeholder="Ingresa tu nombre" required
                                       autofocus pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,40}" class="nombre">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-sm- col-md-6 col-lg-">
                                <label style="text-align: left;" for="textApellido">Apellido:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="textApellido" name="textApellido" id="apellido" placeholder="Ingresa tu apellido" required
                                       pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,40}" class="apellido">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-sm- col-md-6 col-lg-">
                                <label style="text-align: left;" for="textEmail">Correo:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="email" name="textEmail" id="correo" placeholder="Ingresa tu correo" required
                                       class="correo">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-sm- col-md-6 col-lg-">
                                <label style="text-align: left;" for="textEmailConfirmar">Confirmar Correo:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="email" name="textEmailConfirmar" id="correoConfirmar" placeholder="Confirma tu correo" required
                                       class="correo">
                            </div>
                        </div>                     


                        <div class="row">
                            <div class="col-xs-5 col                    -sm- col-md-6 col-lg-">
                                <label for="textClave">Contraseña:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="password" name="textClave" id="clave" placeholder="Ingresa tu contraseña" required
                                       pattern=".{8,}" class="pass">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-sm- col-md-6 col-lg-">
                                <label for="textClaveConfirmar">Confirmar Contraseña:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-6 col-lg-">
                                <input type="password" name="textClaveConfirmar" id="claveConfirmar" placeholder="Confirma tu contraseña"
                                       pattern=".{8,}" required class="confirmar">
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                            <input type="submit" value="CREAR CUENTA" id="boton" class="submit">
                        </div>

                        <input type="hidden" value="1" name="opcion">                        

                    </form>

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <p style="text-align: center;">¿Ya tienes una cuenta?<spam style="color: #2196d0;font-size: 16px;">
                            &nbsp;<a href="inicioSesion.jsp" >INGRESAR</a>
                        </spam>
                        </p>
                    </div>

                </div>

            </main>

        </div>

        <div class="container">

            <footer class="col-xs-12 col-sm- col-md-12 col-lg-">

                <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                    <p style="text-align: center;">Al registrar tu cuenta aceptas nuestros<spam style="color: #2196d0;">
                        &nbsp;Términos y Condiciones</spam>&nbsp;y <spam style="color: #2196d0;">&nbsp;Política de
                        Tratamiento de
                        Datos. </p>
                </div>

                <section id="fcred">
                    <p>Todos los Derechos Reservados &copy;</p>
                </section>

            </footer>

        </div>




        <!-- Latest compiled and minified JavaScript -->

        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
                integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>

        <script src="js/scriptUsuario.js" type="text/javascript"></script>
        <script src="alertifyjs/alertify.js" ></script>          
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        
    </body>
</html>
