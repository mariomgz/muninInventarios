/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.BodegaDAO;
import modeloVO.BodegaVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "BodegaControlador", urlPatterns = {"/Bodega"})
public class BodegaControlador extends HttpServlet {

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

        String bodegaId = request.getParameter("textBodegaId");
        String nombreBodega = request.getParameter("textBodegaNombre");
        String ubicacion = request.getParameter("textUbicacion");

        //2. Mandar datos al VO
        BodegaVO bodegaVO = new BodegaVO(bodegaId, nombreBodega, ubicacion);
        //3. Llamar el DAO y mandarle los datos del VO
        BodegaDAO bodegasDAO = new BodegaDAO(bodegaVO);

        switch (opcion) {

            case "Agregar": //Crear Registro

                if (bodegasDAO.crearRegistro()) {

                    request.setAttribute("mensajeExito", "Registro Exitoso");

                } else {
                    request.setAttribute("mensajeError", "La Bodega NO se registró correctamente");

                }
                request.getRequestDispatcher("bodega.jsp").forward(request, response);
                break;

            case "Actualizar": //Actualizar Registro

                if (bodegasDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "La bodega se actualizó correctamente");

                } else {
                    request.setAttribute("mensajeError", "La bodega NO se actualizó correctamente");

                }
                request.getRequestDispatcher("bodega.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento                               

                bodegaVO = bodegasDAO.consultarId(bodegaId);

                if (bodegaVO != null) {

                    request.setAttribute("datosConsultados", bodegaVO);
                    request.getRequestDispatcher("bodega.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La bodega NO existe");
                }
                request.getRequestDispatcher("bodega.jsp").forward(request, response);
                break;

            case "Borrar": //Borrar Registro

                String ideBorrar = request.getParameter("bodegaId");
                bodegaVO = bodegasDAO.delete(ideBorrar);

                if (bodegaVO == null) {

                    request.setAttribute("mensajeExito", "La bodega se borró correctamente");

                } else {

                    request.setAttribute("mensajeError", "La bodega NO se eliminó");
                }
                request.getRequestDispatcher("bodega.jsp").forward(request, response);
                break;

            case "Editar": //Botón Editar  

                String ide = request.getParameter("bodegaId");
                bodegaVO = bodegasDAO.consultarId(ide);

                if (bodegaVO != null) {

                    request.setAttribute("datosConsultados", bodegaVO);
                    request.getRequestDispatcher("bodega.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El bodega NO existe");
                }
                request.getRequestDispatcher("bodega.jsp").forward(request, response);
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
