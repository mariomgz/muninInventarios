<%-- 
    Document   : inicioSesion
    Created on : 12/04/2021, 01:28:50 PM
    Author     : Beto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-419">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styleLogin.css"> 
        <title>Login - Ingreso Munin Inventarios</title>

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="assetsLogin/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assetsLogin/css/util.css">
        <link rel="stylesheet" type="text/css" href="assetsLogin/css/main.css">
        <!--===============================================================================================-->

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
              integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">			

                <div class="wrap-login100 p-t-50 p-b-90">

                    <form class="login100-form validate-form flex-sb flex-w" action="Usuario" method="post" autocomplete="off">

                        <img src="assetsLogin/images/icons/Logo_munin.png" class="rounded mx-auto d-block" style="width: 115px;right: 100px;margin-left: auto; 
                             margin-right: auto;">

                        <span class="login100-form-title p-b-51">	
                            <br>
                            Inicio Sesión
                        </span>


                        <div class="label-form">

                            <label for="username"> Usuario:</label>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Usuario es Obligatorio">
                            <input class="input100" type="email" name="textEmail" placeholder=" Ingresa tu usuario" required>
                            <span class="focus-input100"></span>
                        </div>                           

                        <div class="label-form">

                            <label for="pass"> Contraseña:</label>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Contraseña es Obligatorio">
                            <input class="input100"  type="password" name="textClave" placeholder="Ingresa tu contraseña" required pattern=".{8,}">
                            <span class="focus-input100"></span>
                        </div>                         

                        <div class="container-login100-form-btn m-t-17">
                            <input class="login100-form-btn" type="submit" name="accion" value="Ingresar">

                            <input type="hidden" value="3" name="opcion">
                        </div>                                

                    </form>


                    <div class="flex-sb-m w-full p-t-3 p-b-24">
                        <div>
                            <a href="index.jsp?#contact" class="txt1">
                                <br>
                                ¿Olvidaste tu contraseña?
                            </a>
                        </div>
                    </div>

                    <div style="color: red;text-align: center; margin-bottom: 10px">                              

                        <%
                            if (request.getAttribute("mensajeError") != null) {
                        %>
                        ${mensajeError}
                        <% } else {%>
                        ${mensajeExito}
                        <%}%>             

                    </div>

                </div>
            </div>
        </div>



        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/bootstrap/js/popper.js"></script>
        <script src="assetsLogin/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/daterangepicker/moment.min.js"></script>
        <script src="assetsLogin/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="assetsLogin/js/main.js"></script>



        <!-- Latest compiled and minified JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
                integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
    </body>

</html>
