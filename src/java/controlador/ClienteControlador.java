/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import modeloDAO.ClienteDAO;
import modeloVO.ClienteVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/Cliente"})
public class ClienteControlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //1.Recoger Datos
        String opcion = request.getParameter("opcion");

        String clienteId = request.getParameter("textId");
        String clienteTipoDoc = request.getParameter("textTipoDoc");
        String clienteNombre = request.getParameter("textNombre");
        String clienteApellido = request.getParameter("textApellido");
        String clienteCiudad = request.getParameter("textCiudad");
        String clienteDireccion = request.getParameter("textDireccion");
        String clienteTelefono = request.getParameter("textTelefono");
        String ClienteEmail = request.getParameter("textEmail");
        String ClienteEstado = request.getParameter("textEstado");

        //2. Mandar datos al VO
        ClienteVO clienteVO = new ClienteVO(clienteId, clienteTipoDoc, clienteNombre, clienteApellido, clienteCiudad, clienteDireccion, clienteTelefono, ClienteEmail, ClienteEstado);
        //3. Llamar el DAO y mandarle los datos del VO
        ClienteDAO clienteDAO = new ClienteDAO(clienteVO);

        switch (opcion) {

            case "Agregar": //Agregar Registro

                if (clienteDAO.crearRegistro()) {

                    request.setAttribute("mensajeExito", "Registro Exitoso");

                } else {
                    request.setAttribute("mensajeError", "El cliente NO se registr?? correctamente");

                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                break;

            case "Actualizar": //Actualizar Registro  

                if (clienteDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "El cliente se actualiz?? correctamente");

                } else {
                    request.setAttribute("mensajeError", "El cliente NO se actualiz?? correctamente");
                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento                               

                clienteVO = clienteDAO.consultarId(clienteId);

                if (clienteVO != null) {

                    request.setAttribute("datosConsultados", clienteVO);
                    request.getRequestDispatcher("cliente.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El cliente NO existe");
                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                break;

            case "ConsultarEliminar": //Consultar Documento para Eliminar

                clienteVO = clienteDAO.consultarId(clienteId);

                if (clienteVO != null) {

                    request.setAttribute("datosConsultados", clienteVO);
                    request.getRequestDispatcher("borrarCliente.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El cliente NO existe");
                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                break;

            case "Borrar": //Borrar Registro

                String ideBorrar = request.getParameter("documento");
                clienteVO = clienteDAO.delete(ideBorrar);

                if (clienteVO == null) {

                    request.setAttribute("mensajeExito", "El cliente se borr?? correctamente");

                } else {

                    request.setAttribute("mensajeError", "El cliente NO se elimin??");
                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                break;

            case "ConsultarVentas": //Consultar Cliente en Vista Ventas

                clienteVO = clienteDAO.consultarId(clienteId);

                if (clienteVO != null) {

                    request.setAttribute("datosConsultadosCliente", clienteVO);

                    //request.getRequestDispatcher("registrarVenta.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El cliente NO existe");
                }
                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);
                break;

            case "Listar": //Listar

                List lista = clienteDAO.listar();
                request.setAttribute("clientes", lista);

                break;

            case "Editar": //Bot??n Editar  

                String ide = request.getParameter("documento");
                clienteVO = clienteDAO.consultarId(ide);

                if (clienteVO != null) {

                    request.setAttribute("datosConsultados", clienteVO);
                    request.getRequestDispatcher("cliente.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El cliente NO existe");
                }
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
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
