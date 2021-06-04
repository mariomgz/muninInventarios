/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.PerfilDAO;
import modeloDAO.UsuarioDAO;
import modeloVO.PerfilVO;
import modeloVO.UsuarioVO;
import modeloVO.VentaVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

    UsuarioVO usuarioVO=new UsuarioVO();
    UsuarioDAO usuarioDAO=new UsuarioDAO();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //1.Recoger Datos
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        String usuId = request.getParameter("textId");
        String usuNombre = request.getParameter("textNombre");
        String usuApellido = request.getParameter("textApellido");
        String usuLogin = request.getParameter("textEmail");
        //String usuEmailConfirmar = request.getParameter("textEmailConfirmar");
        String usuClave = request.getParameter("textClave");
        //String usuClaveConfirmar = request.getParameter("textClaveConfirmar");
        

        //2. Mandar datos al VO
        UsuarioVO usuVO = new UsuarioVO(usuId, usuNombre, usuApellido, usuLogin, usuClave);
        //UsuarioVO usu2VO = new UsuarioVO(usuId, usuClave, usuClave);
        //3. Llamar el DAO y mandarle los datos del VO
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
        //UsuarioDAO usu2DAO = new UsuarioDAO(usu2VO);

        switch (opcion) {

            case 1: //Agregar Registro

                if (usuDAO.crearRegistro()) {
                    
                    String idv = usuarioDAO.IdUsuarios();
                    
                    usuarioVO=new UsuarioVO();
                    usuarioVO.setUsuId(idv);                    
                    
                    usuarioDAO.guardarUsuarioPerfil(usuarioVO);                   
                    

                    request.setAttribute("mensajeExito", "El usuario se registró correctamente");

                } else {
                    request.setAttribute("mensajeError", "El usuario NO se registró correctamente");

                }
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                break;

            case 2: //Actualizar Registro

                if (usuDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "El usuario se actualizó correctamente");

                } else {
                    request.setAttribute("mensajeError", "El usuario NO se actualizó correctamente");
                }
                request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                break;

            case 3: //Inicio de Sesión

                String usuIdSesion = "";

                if (usuDAO.iniciarSesion(usuLogin, usuClave)) {

                    HttpSession miSesion = request.getSession(true);
                    PerfilDAO perfilDAO = new PerfilDAO();

                    ArrayList<PerfilVO> listaPerfiles = perfilDAO.listar(usuLogin, usuClave);
                    PerfilVO perfilVO = new PerfilVO();

                    for (int i = 0; i < listaPerfiles.size(); i++) {

                        perfilVO = listaPerfiles.get(i);
                        usuIdSesion = perfilVO.getUsuarioId();
                    }

                    UsuarioVO datosVO = new UsuarioVO();
                    UsuarioDAO datosDAO = new UsuarioDAO();
                    datosVO = datosDAO.consultarDatos(usuIdSesion);
                    miSesion.setAttribute("datosPersonales", datosVO);

                    miSesion.setAttribute("perfiles", listaPerfiles);
                    usuVO = new UsuarioVO(usuId, usuLogin, usuClave);
                    miSesion.setAttribute("datosUsuario", usuVO);

                    request.getRequestDispatcher("Principal.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "Usuario o clave inválida. ¡Inténtalo de nuevo!");
                    request.getRequestDispatcher("inicioSesion.jsp").forward(request, response);
                }

                break;

            case 4: //Cerrar Sesión

                if (usuDAO.iniciarSesion(usuLogin, usuClave)) {

                    request.getRequestDispatcher("Principal.jsp").forward(request, response);

                } else {

                    request.getRequestDispatcher("inicioSesion.jsp").forward(request, response);
                }

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
