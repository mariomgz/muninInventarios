<%-- 
    Document   : bodega
    Created on : 30/06/2021, 10:05:41 AM
    Author     : Beto
--%>

<%@page import="modeloDAO.BodegaDAO"%>
<%@page import="modeloVO.BodegaVO"%>
<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <title>Bodegas Munin Inventarios</title>
    </head>
    <body>

        <div class="container">

            <main>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Gestión Bodegas</li>
                    </ol>
                </nav>

                <div>
                    <h3>Gestión Bodegas</h3>
                </div>

                <br>   
                
                <!--

                <form action="Bodega" method="post" autocomplete="off">
                    <div class="d-flex col-lg-4 ml-auto">
                        <label>Consultar Id Bodega</label>
                        <input type="text" name="textBodegaId" class="form-control border-info">
                        <input type="hidden" value="Consultar" name="opcion">

                    </div>

                </form>
                
                -->

                <div class="container">
                    <%                                    if (request.getAttribute(
                                "mensajeError") != null) {
                    %>
                    <div style="color: red;">
                        ${mensajeError}
                        <% } else {%> 
                        <div style="color: #2196d0;">
                            ${mensajeExito}
                            <%}%>  
                        </div>
                        <br>

                        <div class="d-flex row"> 

                            <!-- Sidebar -->

                            <div class="card col-xs-12 col-sm-12 col-md-12 col-lg-3">

                                <div class="card-body"> 



                                    <form action="Bodega" method="post">                                

                                        <div class="form-group- ">
                                            <label style="text-align: left;" for="textBodegaId"> Id Bodega*</label>

                                            <input type="text" name="textBodegaId" readonly
                                                   <%
                                                       BodegaVO bodegaEditarVO = (BodegaVO) request.getAttribute("datosConsultados");
                                                       if (bodegaEditarVO != null) {

                                                   %> 

                                                   value="<%=bodegaEditarVO.getBodegaId()%>"
                                                   <%}%>  
                                                   id="nombre_cli" required
                                                   class="form-control">
                                        </div> 

                                        <div class="form-group- ">
                                            <label style="text-align: left;" for="textBodegaNombre"> Nombre Bodega*</label>

                                            <input type="text" name="textBodegaNombre"
                                                   <%
                                                       //ProductoVO productoEditarVO = (ProductoVO) request.getAttribute("datosConsultados");
                                                       if (bodegaEditarVO != null) {

                                                   %> 

                                                   value="<%=bodegaEditarVO.getNombreBodega()%>"
                                                   <%}%>  
                                                   id="nombre_cli" required
                                                   class="form-control">
                                        </div>   

                                        <div class="form-group- ">
                                            <label style="text-align: left;" for="textUbicacion"> Ubicación*</label>

                                            <input type="text" name="textUbicacion"
                                                   <%
                                                       //ProductoVO productoEditarVO = (ProductoVO) request.getAttribute("datosConsultados");
                                                       if (bodegaEditarVO != null) {

                                                   %> 

                                                   value="<%=bodegaEditarVO.getUbicacion()%>"
                                                   <%}%>  
                                                   id="nombre_cli" required
                                                   class="form-control">
                                        </div>  

                                        <br>                             

                                        <input type="submit" name="opcion" value="Agregar"class="btn btn-info">                                
                                        <input type="submit" name="opcion" value="Actualizar"class="btn btn-success">

                                    </form>


                                </div> 

                            </div>

                            <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-9"> 

                                <form>

                                    <table class="table table-hover table-sm table-responsive-xl" id="tablax">

                                        <thead class="thead-light">
                                            <tr>                                        
                                                <th>ID</th>                                        
                                                <th>NOMBRE BODEGA</th>
                                                <th>UBICACIÓN</th>
                                                <th></th> 

                                            </tr>
                                        </thead>    

                                        <tbody> 

                                            <%
                                                BodegaVO bodegaVO = new BodegaVO();
                                                BodegaDAO bodegaDAO = new BodegaDAO();

                                                ArrayList<BodegaVO> listaBodegas = bodegaDAO.listar();

                                                for (int i = 0;
                                                        i < listaBodegas.size();
                                                        i++) {

                                                    bodegaVO = listaBodegas.get(i);


                                            %>


                                            <tr>                                     

                                                <td><%=bodegaVO.getBodegaId()%></td>
                                                <td><%=bodegaVO.getNombreBodega()%></td>
                                                <td><%=bodegaVO.getUbicacion()%></td>                                                   


                                                <td class="btn-group">

                                                    <a class="material-icons" style="color: #2196d0" href="Bodega?opcion=Editar&bodegaId=<%=bodegaVO.getBodegaId()%>"  >edit</a>
                                                    <!--
                                                    <a class="btn btn-danger btn-sm text-white" style="margin-left: 5px" href="Categoria?opcion=Borrar&documento=<%=bodegaVO.getBodegaId()%>"
                                                       onclick="return confirm('Estás seguro que deseas eliminar el registro?')">Borrar</a>
                                                    -->

                                                </td>


                                            </tr>

                                            <% }%>

                                        </tbody>

                                    </table>
                                </form>

                            </div>
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

                <!-- DATATABLES -->
                <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
                </script>
                <!-- BOOTSTRAP -->
                <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
                </script>
                <script>
                    $(document).ready(function () {
                        $('#tablax').DataTable({
                            language: {
                                processing: "Tratamiento en curso...",
                                search: "Buscar&nbsp;:",
                                lengthMenu: "Agrupar de _MENU_ items",
                                info: "Registros del _START_ al _END_ de un total de _TOTAL_",
                                infoEmpty: "No existen datos.",
                                infoFiltered: "(filtrado de _MAX_ elementos en total)",
                                infoPostFix: "",
                                loadingRecords: "Cargando...",
                                zeroRecords: "No se encontraron datos con tu busqueda",
                                emptyTable: "No hay datos disponibles en la tabla.",
                                paginate: {
                                    first: "Primero",
                                    previous: "Anterior",
                                    next: "Siguiente",
                                    last: "Ultimo"
                                },
                                aria: {
                                    sortAscending: ": active para ordenar la columna en orden ascendente",
                                    sortDescending: ": active para ordenar la columna en orden descendente"
                                }
                            },
                            scrollY: 400,
                            lengthMenu: [[8, 25, -1], [8, 25, "All"]],
                            "bLengthChange": false
                        });
                    });
                </script>



                <!-- Menu Toggle Script -->
                <script>
                    $("#menu-toggle").click(function (e) {
                        e.preventDefault();
                        $("#wrapper").toggleClass("toggled");
                    });
                </script>

                </html>
