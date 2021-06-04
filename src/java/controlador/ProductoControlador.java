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
import modeloDAO.ProductoDAO;
import modeloVO.ProductoVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "ProductoControlador", urlPatterns = {"/Producto"})
public class ProductoControlador extends HttpServlet {

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

        //1.Recoger Datos
        String productoId = request.getParameter("textProductoId");
        String productoNombre = request.getParameter("textProductoNombre");
        String idCategoria = request.getParameter("textIdCategoria");
        String idBodega = request.getParameter("textIdBodega");
        String productoPrecioVenta = request.getParameter("textProductoPrecioVenta");
        String productoPrecioCompra = request.getParameter("textProductoPrecioCompra");
        String stock = request.getParameter("textProductoStock");
        String productoEstado = request.getParameter("textEstado");

        //2. Mandar datos al VO
        ProductoVO productoVO = new ProductoVO(productoId, productoNombre, idCategoria, idBodega, productoPrecioVenta,productoPrecioCompra, stock, productoEstado);
        //3. Llamar el DAO y mandarle los datos del VO
        ProductoDAO productoDAO = new ProductoDAO(productoVO);

        switch (opcion) {

            case "Agregar": //Agregar Registro

                if (productoDAO.crearRegistro()) {

                    request.setAttribute("mensajeExito", "Registro Exitoso");

                } else {
                    request.setAttribute("mensajeError", "El producto NO se registró correctamente");

                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;

            case "Actualizar": //Actualizar Registro  

                if (productoDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "El producto se actualizó correctamente");

                } else {
                    request.setAttribute("mensajeError", "El producto NO se actualizó correctamente");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento  

                productoVO = productoDAO.consultarP(productoId);

                if (productoVO != null) {

                    request.setAttribute("datosConsultados", productoVO);
                    request.getRequestDispatcher("producto.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El producto NO existe");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;

            case "ConsultarEliminar": //Consultar Documento para Eliminar

                productoVO = productoDAO.consultarP(productoId);

                if (productoVO != null) {

                    request.setAttribute("datosConsultados", productoVO);
                    request.getRequestDispatcher("borrarProducto.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El producto NO existe");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;

            case "Borrar": //Borrar Registro

                String ideBorrar = request.getParameter("documento");
                productoVO = productoDAO.delete(ideBorrar);

                if (productoVO== null) {

                    request.setAttribute("mensajeExito", "El producto se borró correctamente");

                } else {
                    request.setAttribute("mensajeError", "El producto NO se eliminó");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;

            case "Editar": //Botón Editar  

                String ide = request.getParameter("documento");
                productoVO = productoDAO.consultarP(ide);

                if (productoVO != null) {

                    request.setAttribute("datosConsultados", productoVO);
                    request.getRequestDispatcher("producto.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El producto NO existe");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
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
