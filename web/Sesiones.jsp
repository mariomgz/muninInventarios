<%-- 
    Document   : Sesiones
    Created on : 8/05/2021, 03:00:22 PM
    Author     : Beto
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  HttpSession miSesion = (HttpSession) request.getSession();
    String nombre = "";
    String email = "";

    if (miSesion.getAttribute("datosUsuario") == null) {

        request.getRequestDispatcher("inicioSesion.jsp").forward(request, response);

    } else {

        UsuarioVO usuVO = (UsuarioVO) miSesion.getAttribute("datosUsuario");
        nombre = usuVO.getUsuNombre();
        email = usuVO.getUsuLogin();
    }

%>

<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache,no-store, must-revalidate");
    response.setDateHeader("Expires", 0);

%>
<html>
    <head>
        
        
    </head>
    <body>
        
    </body>
</html>
