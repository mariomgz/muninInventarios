<%-- 
    Document   : nuevaCompra
    Created on : 28/05/2021, 12:07:41 PM
    Author     : Beto
--%>

<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.ProductoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="modeloVO.CompraVO"%>
<%@page import="modeloDAO.CompraDAO"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="modeloVO.ProveedorVO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Nueva Compra Munin Inventarios</title>
    </head>
    <body>
        <div class="container">
            <main>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Nueva Compra</li>
                    </ol>
                </nav>
                <!--
                <div>
                    <h3>Nueva Compra</h3>
                </div>-->

                <div class="container">
                    <%                                    if (request.getAttribute(
                                "mensajeError") != null) {
                    %>
                    <div style="color: red;">
                        ${mensajeError}</div>
                        <% } else {%> 
                    <div style="color: #2196d0;">
                        ${mensajeExito}</div>
                        <%}%>  
                </div>

                <br> 

                <div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                      
                        <div class="card">
                            <div class="card-body">

                                <form action="Compra" method="post" id="frmCompra">                                   

                                    <div class="form-group d-flex row"> 

                                        <div class=" form-group col-xs-6 col-sm-6 col-md-3 col-lg-4 d-flex">

                                            <!--
                                            <input type="text" name="textId" value="${proveedor.getProveedorId()}"
                                                   class="form-control" placeholder="Buscar ID Cliente" >-->
                                            <select  name="textProveedorId"  class="form-control">  

                                                <option>Seleccione un Proveedor...</option>

                                                <%
                                                    ProveedorDAO proveedorDAO = new ProveedorDAO();
                                                    for (ProveedorVO proveedorVO : proveedorDAO.listar()) {

                                                %>

                                                <option   class="form-control"
                                                          value="<%=proveedorVO.getProveedorId()%>"><%=proveedorVO.getProveedorId()%></option>


                                                <%}%>


                                            </select>
                                            <div> 
                                                <button type="submit" name="opcion" id="buscarStock" value="buscarProveedor" class="btn btn-outline-info ">Buscar</button>
                                                <!--<div >
                                                    <button class="btn btn-outline-secondary bg-dark text-white" type="text" value="buscarClientes" name="opcion" style="margin-left: 5px">Buscar</button>                                            
                                                </div>-->
                                            </div> 

                                        </div> 

                                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-5 ">
                                            <input type="text" name="textNombre"  placeholder="Nombre Proveedor" value="${proveedor.getNombreProveedor()}" class="form-control" readonly >                               
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-5 col-lg-3 ">
                                            <input type="date" name="textFecha" class="form-control" >                               
                                        </div>                                        

                                    </div> 



                                    <div class="form-group d-flex row">

                                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-4 d-flex" style="margin-top: 30px">
                                            <!--
                                            <input type="text" name="textProductoId" value="${p.getProductoId()}"
                                                   class="form-control" placeholder="Buscar ID Producto" aria-label="Recipient's username" aria-describedby="basic-addon2" id="btnPrueba">-->
                                            <select  name="textProductoId"  class="form-control">  

                                                <option>Seleccione un Producto...</option>

                                                <%
                                                    ProductoDAO productoDAO = new ProductoDAO();
                                                    for (ProductoVO productoVO : productoDAO.listar()) {

                                                %>

                                                <option   class="form-control"
                                                          value="<%=productoVO.getProductoId()%>"><%=productoVO.getProductoNombre()%></option>


                                                <%}%>


                                            </select>

                                            <div> 
                                                <button type="submit" name="opcion" value="buscarProducto" class="btn btn-outline-info ">Buscar</button>
                                                <!--<div >
                                                    <button class="btn btn-outline-secondary bg-dark text-white" type="text" value="buscarClientes" name="opcion" style="margin-left: 5px">Buscar</button>                                            
                                                </div>-->
                                            </div> 
                                        </div>                                       

                                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                            <label>Nombre Producto:</label>  
                                            <input type="text" name="textProductoNombre" placeholder="" value="${producto.getProductoNombre()}" class="form-control" readonly>                                              
                                        </div> 

                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                            <label>Precio:</label>   
                                            <input type="text" name="textProductoPrecioCompra" placeholder="$" value="${producto.getProductoPrecioCompra()}" class="form-control" readonly>                                                                                     
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                            <label>Cantidad:</label>   
                                            <input type="text" name="textProductoCantidad" placeholder="" value="1" class="form-control">                                                                                     
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-1">
                                            <label>*Stock:</label>  
                                            <input type="text" name="textProductoStock" id="stock" placeholder="" value="${producto.getStock()}" 
                                                   class="form-control" readonly>                                            
                                        </div>

                                    </div> 


                                    <div class="input-group-append">

                                        <button type="submit" name="opcion" value="Agregar" 
                                                class="btn btn-outline-info ">Agregar</button>

                                        <!--
                                        <button class="btn btn-outline-secondary bg-info text-white" type="text" value="Agregar" name="opcion">Agregar Venta</button>
                                        -->
                                    </div>


                                </form>                          

                            </div>                            

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">



                        <div class="card">
                            <div class="card-body">



                                <table class="table table-hover table-sm table-responsive-xl table-bordered">

                                    <thead class="bg-blue text-white">
                                        <tr>
                                            <th>ITEM</th>                                            
                                            <th>ID PROD</th>
                                            <th>NOMBRE</th>                                            
                                            <th>P.COMPRA</th>
                                            <th>CANTIDAD</th>
                                            <th>SUBTOTAL</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                    <c:forEach var="list" items="${lista}">

                                        <tr>
                                            <td>${list.getItem()}</td>                                                
                                            <td>${list.getIdProducto()}</td>
                                            <td>${list.getDescripcionP()}</td>                                                
                                            <td>$ ${list.getPrecio()}</td>
                                            <td>${list.getCantidad()}</td>
                                            <td>$ ${list.getSubtotal()}</td>

                                            <!--<td class="btn-group">                                                   
                                                
                                                <a class="btn btn-danger btn-sm text-white" style="margin-left: 5px">Borrar</a>                                                    
                                                <a href="Venta?opcion=borrarFila" class="btn btn-danger btn-sm text-white">Cancelar</a> 
                                            </td>-->

                                        </tr>


                                    </c:forEach>                                        


                                    </tbody>

                                </table>



                            </div>

                            <div class="card-footer d-flex bg-white">

                                <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 ml-auto">
                                    <input type="text" name="textTotal" value="$ ${totalpagar}" class="form-control">
                                </div>
                            </div>
                            <div class="card-footer d-flex bg-white">
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 ml-auto">
                                    <!--<input type="reset" name="opcion" value="Cancelar" class="btn btn-danger">                                    

                                    -->
                                    <a href="Compra?opcion=limpiarTabla" class="btn btn-light">Cancelar</a> 
                                    <a href="Compra?opcion=GenerarCompra" class="btn btn-success text-white">Generar Compra</a> 


                                </div>                                
                            </div>
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

        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="template/jquery.min.js"></script>
        <script src="template/bootstrap.bundle.min.js"></script>

        <script src="js/scriptUsuario.js" type="text/javascript"></script>
        <script src="alertifyjs/alertify.js" ></script>          
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>



        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
