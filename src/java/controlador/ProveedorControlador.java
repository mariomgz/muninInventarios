/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.ProveedorDAO;
import modeloVO.ProveedorVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "ProveedorControlador", urlPatterns = {"/Proveedor"})
public class ProveedorControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String opcion = request.getParameter("opcion");

        String Idproveedor = request.getParameter("textProveedorId");
        String nombreProveedor = request.getParameter("textProveedorName");
        String ciudadProveedor = request.getParameter("textProveedorCiudad");
        String direccionProveedor = request.getParameter("textProveedorDireccion");
        String telefonoProveedor = request.getParameter("textProveedorTel");
        String emailProveedor = request.getParameter("textProveedorEmail");
        String estadoProveedor = request.getParameter("textProveedorEstado");

        //2. Mandar datos al VO
        ProveedorVO proveedorVO = new ProveedorVO(Idproveedor, nombreProveedor, ciudadProveedor, direccionProveedor, telefonoProveedor, emailProveedor, estadoProveedor);
        //3. Llamar el DAO y mandarle los datos del VO
        ProveedorDAO proveedorDAO = new ProveedorDAO(proveedorVO);

        switch (opcion) {

            case "Agregar": //Crear Registro

                if (proveedorDAO.crearRegistro()) {

                    request.setAttribute("mensajeExito", "Registro Exitoso");

                } else {
                    request.setAttribute("mensajeError", "El proveedor NO se registró correctamente");

                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            case "Actualizar": //Actualizar Registro

                if (proveedorDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "El proveedor se actualizó correctamente");

                } else {
                    request.setAttribute("mensajeError", "El proveedor NO se actualizó correctamente");

                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento                               

                proveedorVO = proveedorDAO.consultarId(Idproveedor);

                if (proveedorVO != null) {

                    request.setAttribute("datosConsultados", proveedorVO);
                    request.getRequestDispatcher("proveedor.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El Proveedor NO existe");
                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            case "ConsultarEliminar": //Consultar Documento para Eliminar

                proveedorVO = proveedorDAO.consultarId(Idproveedor);

                if (proveedorVO != null) {

                    request.setAttribute("datosConsultados", proveedorVO);
                    request.getRequestDispatcher("borrarProveedor.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El proveedor NO existe");
                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            case "Borrar": //Borrar Registro

                String ideBorrar = request.getParameter("documento");
                proveedorVO = proveedorDAO.delete(ideBorrar);

                if (proveedorVO == null) {

                    request.setAttribute("mensajeExito", "El proveedor se borró correctamente");

                } else {

                    request.setAttribute("mensajeError", "El proveedor NO se eliminó");
                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            case "ConsultarVentas": //Consultar Proveedor en Vista Ventas

                proveedorVO = proveedorDAO.consultarId(Idproveedor);

                if (proveedorVO != null) {

                    request.setAttribute("datosConsultadosProveedor", proveedorVO);

                    //request.getRequestDispatcher("registrarVenta.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El proveedor NO existe");
                }
                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);
                break;

            case "Listar": //Listar

                List lista = proveedorDAO.listar();
                request.setAttribute("proveedores", lista);

                break;

            case "Editar": //Botón Editar  

                String ide = request.getParameter("documento");
                proveedorVO = proveedorDAO.consultarId(ide);

                if (proveedorVO != null) {

                    request.setAttribute("datosConsultados", proveedorVO);
                    request.getRequestDispatcher("proveedor.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El proveedor NO existe");
                }
                request.getRequestDispatcher("proveedor.jsp").forward(request, response);
                break;

            default:

                throw new AssertionError();

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
