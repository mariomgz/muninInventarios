<%-- 
    Document   : proveedor
    Created on : 18/05/2021, 12:50:41 PM
    Author     : Beto
--%>

<%@page import="modeloVO.CiudadVO"%>
<%@page import="modeloDAO.CiudadDAO"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="modeloVO.ProveedorVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.ClienteVO"%>

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
        <title>Proveedor Munin Inventarios</title>
    </head>

    <body>
        <div class="container">
            <main>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Gestión Proveedores</li>
                    </ol>
                </nav>

                <div>
                    <h3>Gestión Proveedores</h3>
                </div>
                <br> 

                <form action="Proveedor" method="post" autocomplete="off">
                    <div class="d-flex col-lg-4 ml-auto">
                        <label>Consultar NIT</label>
                        <input type="text" name="textProveedorId" class="form-control border-info">
                        <input type="hidden" value="Consultar" name="opcion">

                    </div>

                </form>

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

                            <form action="Proveedor" method="post">

                                <div class="form-group- ">

                                    <label style="text-align: left;" for="textProveedorId"> NIT de Proveedor*</label>
                                    <input type="number" name="textProveedorId" 

                                           <%
                                               ProveedorVO proveedorEditarVO = (ProveedorVO) request.getAttribute("datosConsultados");
                                               if (proveedorEditarVO != null) {

                                           %> 

                                           value="<%=proveedorEditarVO.getProveedorId()%>"
                                           <%}%>
                                           id="id_proveedor" required pattern="{2,40}" class="form-control">
                                </div> 
                                <div class="form-group- form-group- 6">
                                    <label style="text-align: left;" for="textProveedorName"> Nombre de Proveedor*</label>
                                    <input type="text" name="textProveedorName" 
                                           <%
                                               if (proveedorEditarVO != null) {

                                           %> 

                                           value="<%=proveedorEditarVO.getNombreProveedor()%>"
                                           <%}%>


                                           id="nombre_proveedor" required pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,30}" class="form-control">
                                </div> 
                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textProveedorCiudadd"> Ciudad*</label>

                                    <select  name="textProveedorCiudad"  class="form-control"> 


                                        <%
                                            if (proveedorEditarVO != null) {
                                        %> 
                                        <option  class="form-control"  value="<%=proveedorEditarVO.getCiudadProveedor()%>" label="Modificar Ciudad..." > </option>                                           
                                        <%
                                            CiudadDAO ciudadDAO = new CiudadDAO();
                                            for (CiudadVO ciudadVO : ciudadDAO.listar()) {

                                        %> 
                                        <option   class="form-control"
                                                  value="<%=ciudadVO.getCiudadId()%>"><%=ciudadVO.getNombreCiudad()%></option>
                                        <%}
                                        } else {%>
                                        <option>Seleccione...</option>
                                        <%
                                            CiudadDAO ciudadDAO = new CiudadDAO();
                                            for (CiudadVO ciudadVO : ciudadDAO.listar()) {

                                        %>
                                        <option   class="form-control"
                                                  value="<%=ciudadVO.getCiudadId()%>"><%=ciudadVO.getNombreCiudad()%></option>


                                        <%}%>
                                        <%}%>

                                    </select>
                                </div>

                                <div class="form-groupg- form-group- ">
                                    <label style="text-align: left;" for="textProveedorDireccion"> Dirección de Proveedor*</label>
                                    <input type="text" name="textProveedorDireccion" 
                                           <%
                                               if (proveedorEditarVO != null) {

                                           %> 

                                           value="<%=proveedorEditarVO.getDireccionProveedor()%>"
                                           <%}%>

                                           id="direccion_proveedor" required pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,50}" class="form-control">

                                </div>
                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textProveedorTel"> Teléfono de Proveedor*</label>
                                    <input type="tel" name="textProveedorTel" id="tel_cliente" 
                                           <%
                                               if (proveedorEditarVO != null) {

                                           %> 

                                           value="<%=proveedorEditarVO.getTelefonoProveedor()%>"
                                           <%}%>

                                           required pattern="{2,15}" class="form-control">
                                </div>
                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textProveedorEmail">Correo*:</label>
                                </div>
                                <div class="form-group- form-group- ">
                                    <input type="email" name="textProveedorEmail"
                                           <%
                                               if (proveedorEditarVO != null) {
                                           %>                                            
                                           value="<%=proveedorEditarVO.getEmailProveedor()%>"
                                           <%}%>  
                                           id="correo" required
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

                            <table class="table table-hover table-sm table-responsive-xl">

                                <thead class="thead-light">
                                    <tr>                                        
                                        <th>ID</th>                                        
                                        <th>NOMBRE</th>
                                        <th>CIUDAD</th>
                                        <th>TELÉFONO</th>                                        
                                        <th>EMAIL</th>
                                    </tr>
                                </thead>    

                                <tbody> 

                                    <%
                                        ProveedorVO proveedorVO = new ProveedorVO();
                                        ProveedorDAO proveedorDAO = new ProveedorDAO();

                                        ArrayList<ProveedorVO> listaProveedor = proveedorDAO.listar();

                                        for (int i = 0; i < listaProveedor.size(); i++) {

                                            proveedorVO = listaProveedor.get(i);


                                    %>


                                    <tr>                                     

                                        <td><%=proveedorVO.getProveedorId()%></td>
                                        <td><%=proveedorVO.getNombreProveedor()%></td>
                                        <td><%=proveedorVO.getCiudadProveedor()%></td>
                                        <td><%=proveedorVO.getTelefonoProveedor()%></td>                                                                               
                                        <td><%=proveedorVO.getEmailProveedor()%></td>                                         

                                        <td class="btn-group">

                                            <a class="btn btn-sm bg-blue text-white" href="Proveedor?opcion=Editar&documento=<%=proveedorVO.getProveedorId()%>"  >Editar</a>
                                            <a class="btn btn-danger btn-sm text-white" style="margin-left: 5px" href="Proveedor?opcion=Borrar&documento=<%=proveedorVO.getProveedorId()%>"
                                               onclick="return confirm('Estás seguro que deseas eliminar el registro?')">Borrar</a>

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



<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</html>
