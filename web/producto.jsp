<%-- 
    Document   : producto
    Created on : 23/04/2021, 01:57:11 PM
    Author     : Beto
--%>


<%@page import="modeloVO.BodegaVO"%>
<%@page import="modeloDAO.BodegaDAO"%>
<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloVO.ProductoVO"%>
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
        <title>Productos Munin Inventarios</title>
    </head>
    <body>

        <div class="container">

            <main>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Gestión Productos</li>
                    </ol>
                </nav>

                <div>
                    <h3>Gestión Productos</h3>
                </div>

                <br>  
                
                <!--

                <form action="Producto" method="post" autocomplete="off">
                    <div class="d-flex col-lg-4 ml-auto">
                        <label>Consultar Id Producto</label>
                        <input type="text" name="textProductoId" class="form-control border-info">
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



                                    <form action="Producto" method="post">                                

                                        <div class="form-group- ">
                                            <label style="text-align: left;" for="textProductoId"> Id Producto*</label>

                                            <input type="text" name="textProductoId" readonly
                                                   <%
                                                       ProductoVO productoEditarVO = (ProductoVO) request.getAttribute("datosConsultados");
                                                       if (productoEditarVO != null) {

                                                   %> 

                                                   value="<%=productoEditarVO.getProductoId()%>"
                                                   <%}%>  
                                                   id="nombre_cli" required
                                                   class="form-control">
                                        </div> 

                                        <div class="form-group- ">
                                            <label style="text-align: left;" for="textProductoNombre"> Nombre del Producto*</label>

                                            <input type="text" name="textProductoNombre"
                                                   <%
                                                       //ProductoVO productoEditarVO = (ProductoVO) request.getAttribute("datosConsultados");
                                                       if (productoEditarVO != null) {

                                                   %> 

                                                   value="<%=productoEditarVO.getProductoNombre()%>"
                                                   <%}%>  
                                                   id="nombre_cli" required
                                                   class="form-control">
                                        </div>                                


                                        <div class="form-group- form-group- 6">
                                            <label style="text-align: left;" for="textIdCategoria"> Nombre Categoría*</label>

                                            <select  name="textIdCategoria"  class="form-control">   

                                                <%
                                                    if (productoEditarVO != null) {

                                                %>

                                                <option  class="form-control"  value="<%=productoEditarVO.getIdCategoria()%>" label="Modificar Categoría..." > </option>

                                                <%
                                                    CategoriaDAO categoriaDAO = new CategoriaDAO();
                                                    for (CategoriaVO categoriaVO : categoriaDAO.listar()) {

                                                %>                                        
                                                <option   class="form-control"
                                                          value="<%=categoriaVO.getCategoriaId()%>"><%=categoriaVO.getNombreCategoria()%></option>

                                                <%}
                                                } else {%>
                                                <option>Seleccione...</option>
                                                <%
                                                    CategoriaDAO categoriaDAO = new CategoriaDAO();
                                                    for (CategoriaVO categoriaVO : categoriaDAO.listar()) {

                                                %>
                                                <option   class="form-control"
                                                          value="<%=categoriaVO.getCategoriaId()%>"><%=categoriaVO.getNombreCategoria()%></option>


                                                <%}%>
                                                <%}%>


                                            </select>

                                        </div> 
                                        <div class="form-group- form-group- 6">
                                            <label style="text-align: left;" for="textIdBodega"> Nombre Bodega*</label>

                                            <select  name="textIdBodega"  class="form-control">   

                                                <%
                                                    if (productoEditarVO != null) {

                                                %>

                                                <option  class="form-control"  value="<%=productoEditarVO.getIdBodega()%>" label="Modificar Bodega.." > </option>

                                                <%
                                                    BodegaDAO bodegaDAO = new BodegaDAO();
                                                    for (BodegaVO bodegaVO : bodegaDAO.listar()) {

                                                %>                                        
                                                <option   class="form-control"
                                                          value="<%=bodegaVO.getBodegaId()%>"><%=bodegaVO.getNombreBodega()%></option>

                                                <%}
                                                } else {%>
                                                <option>Seleccione...</option>
                                                <%
                                                    BodegaDAO bodegaDAO = new BodegaDAO();
                                                    for (BodegaVO bodegaVO : bodegaDAO.listar()) {

                                                %>
                                                <option   class="form-control"
                                                          value="<%=bodegaVO.getBodegaId()%>"><%=bodegaVO.getNombreBodega()%></option>


                                                <%}%>
                                                <%}%>


                                            </select>

                                        </div>                                                                                                 

                                        <div class="form-group- form-group- ">
                                            <label style="text-align: left;" for="textProductoPrecioVenta"> Precio de Venta* </label>

                                            <input type="number" name="textProductoPrecioVenta"  
                                                   <%
                                                       if (productoEditarVO
                                                               != null) {
                                                   %> 
                                                   value="<%=productoEditarVO.getProductoPrecioVenta()%>" 
                                                   <%}%>                                           
                                                   id="telefono_cli" class="form-control" required>
                                        </div>
                                        <div class="form-group- form-group- ">
                                            <label style="text-align: left;" for="textProductoPrecioCompra"> Precio de Compra* </label>

                                            <input type="number" name="textProductoPrecioCompra"  
                                                   <%
                                                       if (productoEditarVO
                                                               != null) {
                                                   %> 
                                                   value="<%=productoEditarVO.getProductoPrecioCompra()%>" 
                                                   <%}%>                                           
                                                   id="telefono_cli" class="form-control" required>
                                        </div>

                                        <div class="form-group- form-group- ">
                                            <label style="text-align: left;" for="textProductoStock"> Stock* </label>

                                            <input type="number" name="textProductoStock"  
                                                   <%
                                                       if (productoEditarVO
                                                               != null) {
                                                   %> 
                                                   value="<%=productoEditarVO.getStock()%>" 
                                                   <%}%>                                           
                                                   id="telefono_cli" class="form-control" required>
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
                                                <th>NOMBRE PRODUCTO</th>
                                                <th>CATEGORÍA</th>
                                                <th>BODEGA</th>
                                                <th>PRECIO VENTA</th>
                                                <th>PRECIO COMPRA</th> 
                                                <th>STOCK</th>
                                                <th></th>                                         

                                            </tr>
                                        </thead>    

                                        <tbody> 

                                            <%
                                                ProductoVO productoVO = new ProductoVO();
                                                ProductoDAO productoDAO = new ProductoDAO();

                                                ArrayList<ProductoVO> listaProductos = productoDAO.listar();

                                                for (int i = 0;
                                                        i < listaProductos.size();
                                                        i++) {

                                                    productoVO = listaProductos.get(i);


                                            %>


                                            <tr>                                     

                                                <td><%=productoVO.getProductoId()%></td>
                                                <td><%=productoVO.getProductoNombre()%></td>
                                                <td><%=productoVO.getIdCategoria()%></td>
                                                <td><%=productoVO.getIdBodega()%></td>
                                                <td><%=productoVO.getProductoPrecioVenta()%></td>
                                                <td><%=productoVO.getProductoPrecioCompra()%></td>
                                                <td><%=productoVO.getStock()%></td>


                                                <td class="btn-group">

                                                    <a class="material-icons" style="color: #2196d0" href="Producto?opcion=Editar&documento=<%=productoVO.getProductoId()%>"  >edit</a>
                                                    <a class="material-icons" style="margin-left: 5px;color: red" href="Producto?opcion=Borrar&documento=<%=productoVO.getProductoId()%>"
                                                       onclick="return confirm('Estás seguro que deseas eliminar el registro?')">delete</a>

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
