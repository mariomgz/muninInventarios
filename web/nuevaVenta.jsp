<%-- 
    Document   : registrarVenta
    Created on : 19/04/2021, 01:15:46 PM
    Author     : Beto
--%>



<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloVO.CategoriaVO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.ProductoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="modeloVO.VentaVO"%>
<%@page import="modeloDAO.VentaDAO"%>

<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="template/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styleVertical.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" type="text/css" href="css/styleLogin.css"> 
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>

        <title>Nueva Venta Munin Inventarios</title>
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

                <!--
                <div>
                    <h3>Nueva Venta</h3>
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

                                <form action="Venta" method="post" id="frmVenta">                                   

                                    <div class="form-group d-flex row"> 

                                        <div class=" form-group col-xs-6 col-sm-6 col-md-3 col-lg-4 d-flex">

                                            <!--
                                            <input type="text" name="textId" value="${c.getClienteId()}"
                                                   class="form-control" placeholder="Buscar ID Cliente" >-->
                                            <select  name="textId"  class="form-control">  

                                                <option>Seleccione un Cliente...</option>

                                                <%
                                                    ClienteDAO clienteDAO = new ClienteDAO();
                                                    for (ClienteVO clienteVO : clienteDAO.listar()) {

                                                %>

                                                <option   class="form-control"
                                                          value="<%=clienteVO.getClienteId()%>"><%=clienteVO.getClienteId()%></option>


                                                <%}%>


                                            </select>
                                            <div> 
                                                <button type="submit" name="opcion" id="buscarStock" value="buscarCliente" class="btn btn-outline-info ">Buscar</button>
                                                <!--<div >
                                                    <button class="btn btn-outline-secondary bg-dark text-white" type="text" value="buscarClientes" name="opcion" style="margin-left: 5px">Buscar</button>                                            
                                                </div>-->
                                            </div> 

                                        </div> 

                                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-5 ">
                                            <input type="text" name="textNombre"  placeholder="Nombre Cliente" value="${c.getClienteNombre()} ${c.getClienteApellido()}" class="form-control" readonly >                               
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-5 col-lg-3 ">


                                            <%
                                                Date dNow = new Date();
                                                SimpleDateFormat ft
                                                        = new SimpleDateFormat("MM/dd/yyyy");
                                                String currentDate = ft.format(dNow);
                                            %>
                                            <input type="text" name="textFecha"  value="<%=currentDate%>" class="form-control" readonly="" >
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
                                            <input type="text" name="textProductoNombre" placeholder="" value="${p.getProductoNombre()}" class="form-control" readonly>                                              
                                        </div> 

                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                            <label>Precio:</label>   
                                            <input type="text" name="textProductoPrecioVenta" placeholder="$" value="${p.getProductoPrecioVenta()}" class="form-control" readonly>                                                                                     
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 ">
                                            <label>Cantidad:</label>   
                                            <input type="text" name="textProductoCantidad" placeholder="" value="1" class="form-control">                                                                                     
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-2 col-lg-1">
                                            <label>*Stock:</label>  
                                            <input type="text" name="textProductoStock" id="stock" placeholder="" value="${p.getStock()}" 
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

                    <form action="Venta" method="post" id="frmNuevaVenta">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">



                            <div class="card">
                                <div class="card-body">



                                    <table class="table table-hover table-sm table-responsive-xl">

                                        <thead class="bg-blue text-white text-center">
                                            <tr>
                                                <th>ITEM</th>                                            
                                                <th>CÓDIGO</th>
                                                <th>NOMBRE</th>                                            
                                                <th>PRECIO</th>
                                                <th>CANTIDAD</th>
                                                <th>SUBTOTAL</th>

                                            </tr>
                                        </thead>

                                        <tbody class="text-right">

                                            <c:forEach var="list" items="${lista}">

                                                <tr>
                                                    <td>${list.getItem()}</td>                                                
                                                    <td>${list.getIdProducto()}</td>
                                                    <td>${list.getDescripcionP()}</td>                                                
                                                    <td>$ ${list.getPrecio()}</td>                                                
                                                    <td class="btn-group">
                                                        <input type="hidden" id="idpro" value="${list.getIdProducto()}">
                                                        <input type="number" id="Cantidad" value="${list.getCantidad()}" class="form-control col-md-8 text-center" min="1">
                                                    </td>
                                                    <td>$ ${list.getSubtotal()}</td>

                                                    <td class="btn-group">  

                                                        <!--
                                                        <a href="" class="btn btn-sm bg-blue text-white">Editar</a> 
                                                        -->
                                                        <input type="hidden" id="idp" value="${list.getIdProducto()}">

                                                        <a href="#" id="btnBorrar" class="btn btn-danger btn-sm text-white" style="margin-left: 5px">Borrar</a>

                                                        <!--
                                                       <button id="btnBorrar" class="btn btn-danger btn-sm text-white" style="margin-left: 5px">Borrar</button>
                                                        -->
                                                    </td>

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
                                        <a href="Venta?opcion=limpiarTabla" class="btn btn-light">Cancelar</a> 
                                        <a href="Venta?opcion=GenerarVenta" class="btn btn-success text-white">Generar Venta</a> 


                                    </div>                                
                                </div>
                            </div>


                        </div>

                    </form>




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

        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
                integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>



        <script src="alertifyjs/alertify.js" ></script>          
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/scriptUsuario.js" type="text/javascript"></script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

    </body>
</html>
