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
import modeloDAO.CategoriaDAO;
import modeloVO.CategoriaVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "CategoriaControlador", urlPatterns = {"/Categoria"})
public class CategoriaControlador extends HttpServlet {

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

        String IdCategoria = request.getParameter("textCategoriaId");
        String nombreCategoria = request.getParameter("textCategoriaNombre");

        //2. Mandar datos al VO
        CategoriaVO categoriaVO = new CategoriaVO(IdCategoria, nombreCategoria);
        //3. Llamar el DAO y mandarle los datos del VO
        CategoriaDAO categoriaDAO = new CategoriaDAO(categoriaVO);

        switch (opcion) {

            case "Agregar": //Crear Registro

                if (categoriaDAO.crearRegistro()) {

                    request.setAttribute("mensajeExito", "Registro Exitoso");

                } else {
                    request.setAttribute("mensajeError", "La Categoria NO se registró correctamente");

                }
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
                break;

            case "Actualizar": //Actualizar Registro

                if (categoriaDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "Actualización Exitosa");

                } else {
                    request.setAttribute("mensajeError", "La Categoria NO se actualizó correctamente");

                }
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento                               

                categoriaVO = categoriaDAO.consultarId(IdCategoria);

                if (categoriaVO != null) {

                    request.setAttribute("datosConsultados", categoriaVO);
                    request.getRequestDispatcher("categoria.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La Categoria NO existe");
                }
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
                break;

            case "Borrar": //Borrar Registro

                String ideBorrar = request.getParameter("documento");
                categoriaVO = categoriaDAO.delete(ideBorrar);

                if (categoriaVO == null) {

                    request.setAttribute("mensajeExito", "La Categoria se borró correctamente");

                } else {

                    request.setAttribute("mensajeError", "La Categoria NO se eliminó");
                }
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
                break;

            case "Editar": //Botón Editar  

                String ide = request.getParameter("documento");
                categoriaVO = categoriaDAO.consultarId(ide);

                if (categoriaVO != null) {

                    request.setAttribute("datosConsultados", categoriaVO);
                    request.getRequestDispatcher("categoria.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La categoría NO existe");
                }
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
                break;
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
