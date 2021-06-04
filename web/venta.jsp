<%-- 
    Document   : venta
    Created on : 24/04/2021, 03:42:03 PM
    Author     : Beto
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="modeloVO.VentaVO"%>
<%@page import="modeloDAO.VentaDAO"%>
<%@page import="modeloVO.ProductoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloVO.ProductoVO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Registrar Venta Munin Inventarios</title>
    </head>
    <body>
        <div class="container">

            <main>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Nueva Venta</li>
                    </ol>
                </nav>

                <div>
                    <h3>Nueva Venta</h3>
                </div>  

                <br>  

                <div class="d-flex row">
                    

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                        <form action="Venta" method="post">

                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex col-lg-5 ml-auto">
                                        <label>Número de Serie</label>
                                        <input type="text" name="idProducto" class="form-control">                            
                                    </div>

                                    <table class="table table-hover table-sm table-responsive-xl">
                                        <thead>
                                            <tr>
                                                <th>ID VENTA</th>                                                
                                                <th>ID CLIENTE</th>
                                                <th>FECHA</th>                                                                               
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%

                                                VentaVO ventaVO = new VentaVO();
                                                VentaDAO ventaDAO = new VentaDAO();

                                                ArrayList<VentaVO> listaVentas = ventaDAO.listar();

                                                for (int i = 0; i < listaVentas.size(); i++) {

                                                    ventaVO = listaVentas.get(i);


                                            %>
                                            <tr>
                                                <td></td>                                                
                                                <td></td>
                                                <td></td>

                                            </tr>

                                            <% }%>

                                        </tbody>
                                    </table>


                                </div>
                                <div class="card-footer">
                                    <div>
                                        <input type="submit" name="accion" value="Cancelar" class="btn btn-warning">
                                        <input type="submit" name="accion" value="Generar Venta" class="btn btn-success">                                    
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div style="color: red;">                              

                        <%                        if (request.getAttribute("mensajeError") != null) {
                        %>
                        ${mensajeError}
                        <% } else {%>
                        ${mensajeExito}
                        <%}%>            

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

        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="template/jquery.min.js"></script>
        <script src="template/bootstrap.bundle.min.js"></script>



        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
