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

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
              integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">

            <main>

                <div class="register" style="min-height: 550px;">

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <img style="width:20%;display: block;margin: auto;" src="images/Logo_munin.png">
                    </div>

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <h2 style="text-align: center;">Ingresa a tu cuenta</h2>
                    </div>

                    <form action="Usuario" method="post" autocomplete="off">
                        
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
                            <div class="col-xs-5 col-sm- col-md-5 col-lg-">
                                <label for="textEmail">Usuario:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-7 col-lg-">

                                <input type="email" name="textEmail" id="usuario" placeholder="Ingresa tu usuario" required
                                       autofocus class="usuario">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-sm- col-md-5 col-lg-">
                                <label for="textClave">Contraseña:</label>
                            </div>
                            <div class="col-xs-7 col-sm- col-md-7 col-lg-">

                                <input type="password" name="textClave" id="clave" placeholder="Ingresa tu contraseña" required
                                       pattern=".{8,}" class="pass">
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                            <input type="submit" name="accion" value="INGRESAR" id="boton" class="submit">
                        </div>

                        <input type="hidden" value="3" name="opcion">

                        

                    </form>

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <p style="text-align: center;">
                        <spam style="color: #2196d0;font-size: 16px;">&nbsp;¿Olvidaste tu contraseña?
                        </spam>
                        </p>
                    </div>

                    <div class="col-xs-12 col-sm- col-md-12 col-lg-">
                        <p style="text-align: center;">¿No tienes cuenta aún?<spam style="color: #2196d0;">&nbsp;Comunícate
                            con el administrador del sistema
                        </spam>
                        </p>
                    </div>
                </div>

            </main>

        </div>

        <div class="container">
            <footer class="col-xs-12 col-sm- col-md-12 col-lg-">

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
    </body>

</html>
