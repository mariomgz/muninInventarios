<%-- 
    Document   : cliente
    Created on : 14/04/2021, 06:17:20 PM
    Author     : Beto
--%>

<%@page import="modeloVO.CiudadVO"%>
<%@page import="modeloDAO.CiudadDAO"%>
<%@page import="modeloDAO.CategoriaDAO"%>
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
        <link href="alertifyjs/css/alertify.css" rel="stylesheet" type="text/css"/>
        <link href="alertifyjs/css/themes/default.css" rel="stylesheet" type="text/css"/>        

        <title>Clientes Munin Inventarios</title>
    </head>

    <body>
        <div class="container">
            <main>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white">
                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>                                
                        <li class="breadcrumb-item active" aria-current="page">Gestión Clientes</li>
                    </ol>
                </nav>  
                <div>

                    <h3>Gestión Clientes</h3>
                </div>
                <br> 


                <!--
                <form action="Cliente" method="post" autocomplete="off"  onsubmit="return registrar()">
                    <div class="d-flex col-lg-4 ml-auto">
                        <label>Consultar Documento</label>
                        <input type="text" name="textId" class="form-control border-info">
                        <input type="hidden" value="Consultar" name="opcion">
        
                    </div>
        
                </form>
                -->

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

                <div class="d-flex row"> 

                    <!-- Sidebar -->

                    <div class="card col-xs-12 col-sm-12 col-md-12 col-lg-3">

                        <div class="card-body"> 

                            <form action="Cliente" method="post">

                                <div class="form-group- ">
                                    <label style="text-align: left;" for="textTipoDoc"> Tipo de Identificación*</label>

                                    <input type="text" name="textTipoDoc"
                                           <%                                               ClienteVO clienteEditarVO = (ClienteVO) request.getAttribute("datosConsultados");
                                               if (clienteEditarVO != null) {

                                           %> 

                                           value="<%=clienteEditarVO.getClienteTipoDoc()%>"
                                           <%}%>  
                                           id="nombre_cli" required
                                           pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,40}" class="form-control">
                                </div>                                 

                                <div class="form-group- ">
                                    <label style="text-align: left;" for="textId">Número de Identificación*</label>

                                    <input type="number" name="textId" 
                                           <%
                                               if (clienteEditarVO != null) {
                                           %>                                            
                                           value="<%=clienteEditarVO.getClienteId()%>"
                                           <%}%>                                            
                                           id="numerodeIden" required class="form-control">
                                </div>

                                <div class="form-group- form-group- 6">
                                    <label style="text-align: left;" for="textNombre"> Nombre*</label>

                                    <input type="text" name="textNombre" 
                                           <%
                                               if (clienteEditarVO != null) {
                                           %>                                             
                                           value="<%=clienteEditarVO.getClienteNombre()%>"
                                           <%}%>                                           
                                           id="nombre_cli" required
                                           pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,40}" class="form-control">
                                </div> 
                                <div class="form-group- form-group- 6">
                                    <label style="text-align: left;" for="textApellido"> Apellido*</label>

                                    <input type="text" name="textApellido"  
                                           <%
                                               if (clienteEditarVO != null) {
                                           %> 
                                           value="<%=clienteEditarVO.getClienteApellido()%>"  
                                           <%}%> 
                                           id="nombre_cli" required
                                           pattern="[A-Za-zñÑáÁéÉíÍóÓúÚ ]{2,40}" class="form-control">
                                </div> 

                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textCiudad"> Ciudad*</label>

                                    <select  name="textCiudad"  class="form-control"> 


                                        <%
                                            if (clienteEditarVO != null) {
                                        %> 
                                        <option  class="form-control"  value="<%=clienteEditarVO.getClienteCiudad()%>" label="Modificar Ciudad..." > </option>                                           
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
                                    <label style="text-align: left;" for="textDireccion">Dirección*</label>

                                    <input type="text" name="textDireccion" 
                                           <%
                                               if (clienteEditarVO != null) {
                                           %>                                            
                                           value="<%=clienteEditarVO.getClienteDireccion()%>" 
                                           <%}%>                                            
                                           id="direccion_cli" class="form-control" required>
                                </div>

                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textTelefono"> Teléfono* </label>

                                    <input type="number" name="textTelefono"  
                                           <%
                                               if (clienteEditarVO != null) {
                                           %> 
                                           value="<%=clienteEditarVO.getClienteTelefono()%>" 
                                           <%}%>                                           
                                           id="telefono_cli" class="form-control" required>
                                </div>

                                <div class="form-group- form-group- ">
                                    <label style="text-align: left;" for="textEmail">Correo*:</label>
                                </div>
                                <div class="form-group- form-group- ">
                                    <input type="email" name="textEmail"
                                           <%
                                               if (clienteEditarVO != null) {
                                           %>                                            
                                           value="<%=clienteEditarVO.getClienteEmail()%>"
                                           <%}%>  
                                           id="correo" required
                                           class="form-control">
                                </div> 

                                <br>                             

                                <input type="submit" name="opcion" value="Agregar"class="btn btn-info">                                
                                <button id="ejecutar" type="submit" name="opcion" value="Actualizar"class="btn btn-success">Actualizar</button>

                            </form>

                        </div> 

                    </div>

                    <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-9"> 

                        <form action="Cliente" method="post" id="frmCliente">

                            <table class="table table-hover table-sm table-responsive-xl" id="tablax">

                                <thead class="thead-light">
                                    <tr>                                        
                                        <th>ID</th>                                        
                                        <th>NOMBRE</th>
                                        <th>APELLIDO</th>
                                        <th>CIUDAD</th> 
                                        <th>TELÉFONO</th>                                        
                                        <th>EMAIL</th>
                                        <th></th>
                                    </tr>
                                </thead>    

                                <tbody> 

                                    <%
                                        ClienteVO clienteVO = new ClienteVO();
                                        ClienteDAO clienteDAO = new ClienteDAO();

                                        ArrayList<ClienteVO> listaClientes = clienteDAO.listar();

                                        for (int i = 0; i < listaClientes.size(); i++) {

                                            clienteVO = listaClientes.get(i);


                                    %>


                                    <tr>                                     

                                        <td><%=clienteVO.getClienteId()%></td>
                                        <td><%=clienteVO.getClienteNombre()%></td>
                                        <td><%=clienteVO.getClienteApellido()%></td>
                                        <td><%=clienteVO.getClienteCiudad()%></td>  
                                        <td><%=clienteVO.getClienteTelefono()%></td>                                        
                                        <td><%=clienteVO.getClienteEmail()%></td> 

                                        <td class="btn-group">

                                            <a type="submit"class="material-icons" style="color: #2196d0" href="Cliente?opcion=Editar&documento=<%=clienteVO.getClienteId()%>" 
                                               id="borrar">edit</a>
                                            <a class="material-icons" style="margin-left: 5px; color: red" href="Cliente?opcion=Borrar&documento=<%=clienteVO.getClienteId()%> " 
                                               onclick="return confirm('Estás seguro que deseas eliminar el registro?')" >delete</a>

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
<script src="alertifyjs/alertify.js" ></script>
<script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
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

