<%-- 
    Document   : reporteInventario
    Created on : 29/05/2021, 12:49:35 PM
    Author     : Beto
--%>

<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
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
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>
        <title>Reportes Munin Inventarios</title>
    </head>

    <body>
        <div class="container">
            <main>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Reportes</li>
                    </ol>
                </nav>

                <div>
                    <h3>Reportes de Inventario</h3>
                </div>
                <br>  

                <div class="card" style="width: 18rem;">
                    <form method="post" action="GenerarPDF.jsp" target="_black">
                        <div class="card-body">
                            <h5 class="card-title">Inventario General</h5>
                            <p class="card-text">Se incluye el stock de todos los productos.</p>                        
                            <input class="btn btn-info" type="submit" value="Generar Reporte">
                        </div>
                    </form>                    

                </div>
                <br>

                <div class="card" style="width: 18rem;">
                    <form method="post" action="GenerarParametrizadoPDF.jsp" target="_black">
                        <div class="card-body">
                            <h5 class="card-title">Inventario por Categoría</h5>
                            <p class="card-text">Stock filtrado por categoría.</p>
                            <select  name="categoria"  class="form-control">                                  

                                <option>Seleccione...</option>
                                <%
                                    CategoriaDAO categoriaDAO = new CategoriaDAO();
                                    for (CategoriaVO categoriaVO : categoriaDAO.listar()) {

                                %>
                                <option   class="form-control"
                                          value="<%=categoriaVO.getCategoriaId()%>"><%=categoriaVO.getNombreCategoria()%></option>

                                <%}%>                               

                            </select>
                            <br>

                            <input class="btn btn-info" type="submit" value="Generar Reporte">
                        </div>
                    </form>                   

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

    </body>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="template/jquery.min.js"></script>
<script src="template/bootstrap.bundle.min.js"></script>
<script src="alertifyjs/alertify.js" ></script>
<script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>


<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</html>