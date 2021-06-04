<%-- 
    Document   : GenerarParametrizadoPDF
    Created on : 29/05/2021, 05:53:59 PM
    Author     : Beto
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.Conexion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File reporte = new File(application.getRealPath("reporteInvParametrizado.jasper"));
            Map<String, Object> parametros = new HashMap<String, Object>();

            String categoria = request.getParameter("categoria");
            parametros.put("categoria", new String(categoria));

            Conexion conexionBD = new Conexion();
            Connection conexion = conexionBD.obtenerConexion();

            byte[] reporteBytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros, conexion);
            response.setContentType("application/pdf");
            response.setContentLength(reporteBytes.length);
            response.setHeader("Content-Disposition", "filename=\"reporte_vehiculos.pdf\";");
            ServletOutputStream salida = response.getOutputStream();
            salida.write(reporteBytes, 0, reporteBytes.length);

            salida.flush();
            salida.close();

        %>
    </body>
</html>
