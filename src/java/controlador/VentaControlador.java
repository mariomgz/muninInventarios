/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modeloDAO.ClienteDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.VentaDAO;
import modeloVO.ClienteVO;
import modeloVO.ProductoVO;
import modeloVO.VentaVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "VentaControlador", urlPatterns = {"/Venta"})
public class VentaControlador extends HttpServlet {

    //ClienteDAO cDAO = new ClienteDAO();
    ClienteVO c = new ClienteVO();

    //ProductoDAO pDAO = new ProductoDAO();
    ProductoVO p = new ProductoVO();

    VentaDAO ventaDAO = new VentaDAO();
    ArrayList<VentaVO> listaVentas = new ArrayList<>();

    int item;
    String cod;
    String descripcion;
    double precio;
    int cantidad;
    double subtotal;
    double totalPagar;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    String fechaComoCadena = sdf.format(new Date());
    String stock;

    VentaVO ventaVO = new VentaVO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String opcion = request.getParameter("opcion");

        ClienteDAO cDAO = new ClienteDAO();
        ProductoDAO pDAO = new ProductoDAO();

        switch (opcion) {

            case "buscarCliente":
                listaVentas.clear();
                String clienteId = request.getParameter("textId");
                c.setClienteId(clienteId);
                c = cDAO.consultarId(clienteId);
                request.setAttribute("c", c);

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                break;

            case "buscarProducto":
                String productoId = request.getParameter("textProductoId");
                p.setProductoId(productoId);
                p = pDAO.consultarP(productoId);
                request.setAttribute("c", c);
                request.setAttribute("p", p);
                request.setAttribute("lista", listaVentas);
                request.setAttribute("totalpagar", totalPagar);

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                break;

            case "Agregar": //Agregar Venta a la lista
                request.setAttribute("c", c);

                stock = request.getParameter("textProductoStock");

                totalPagar = 0;
                item = item + 1;
                cod = p.getProductoId();
                descripcion = request.getParameter("textProductoNombre");
                precio = Double.parseDouble(request.getParameter("textProductoPrecioVenta"));
                cantidad = Integer.parseInt(request.getParameter("textProductoCantidad"));
                subtotal = precio * cantidad;

                //fecha=request.getParameter("textFecha");
                ventaVO = new VentaVO();

                ventaVO.setItem(item);
                ventaVO.setIdProducto(cod);
                ventaVO.setDescripcionP(descripcion);
                ventaVO.setPrecio(precio);
                ventaVO.setCantidad(cantidad);
                ventaVO.setSubtotal(subtotal);
                ventaVO.setFecha(fechaComoCadena);

                if (Integer.parseInt(stock) > 0) {

                    listaVentas.add(ventaVO);
                    for (int i = 0; i < listaVentas.size(); i++) {
                        totalPagar = totalPagar + listaVentas.get(i).getSubtotal();
                    }

                    request.setAttribute("totalpagar", totalPagar);
                    request.setAttribute("lista", listaVentas);

                } else {
                    request.setAttribute("lista", listaVentas);
                    request.setAttribute("mensajeError", "No hay existencia del producto");
                }

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                break;

            case "GenerarVenta": //Agregar Venta

                if (listaVentas != null) {
                    //Actualizar Stock
                    for (int i = 0; i < listaVentas.size(); i++) {

                        //ProductoVO pr = new ProductoVO();
                        int stockP = Integer.parseInt(p.getStock());
                        int cant = listaVentas.get(i).getCantidad();
                        int idproducto = Integer.parseInt(listaVentas.get(i).getIdProducto());
                        ProductoDAO aO = new ProductoDAO();

                        aO.consultarP(Integer.toString(idproducto));
                        int sac = stockP - cant;
                        pDAO.actualizarStock(idproducto, sac);

                    }

                    request.setAttribute("mensajeExito", "Venta registrada correctamente");

                } else {

                    request.setAttribute("mensajeError", "La venta NO se registró correctamente");
                }

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                //Guardar Venta  
                ventaVO.setIdCliente(c.getClienteId());
                ventaVO.setFecha(fechaComoCadena);
                ventaVO.setMonto(totalPagar);
                ventaDAO.guardarVenta(ventaVO);

                //Guardar Detalle Ventas
                int idv = Integer.parseInt(ventaDAO.IdVentas());

                for (int i = 0; i < listaVentas.size(); i++) {

                    ventaVO = new VentaVO();
                    ventaVO.setId(idv);
                    ventaVO.setIdProducto(listaVentas.get(i).getIdProducto());
                    ventaVO.setCantidad(listaVentas.get(i).getCantidad());
                    ventaVO.setPrecio(listaVentas.get(i).getPrecio());

                    ventaDAO.guardarDetalleVentas(ventaVO);

                }

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                break;

            /*case "Actualizar": //Actualizar Registro

                if (ventaDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "La venta se actualizó correctamente");

                } else {
                    request.setAttribute("mensajeError", "La venta NO se actualizó correctamente");
                }
                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);
                break;

            case "Consultar": //Consultar Documento

                ventaVO = ventaDAO.consultarDocumento(ventaId);

                if (ventaVO != null) {

                    request.setAttribute("datosConsultados", ventaVO);
                    request.getRequestDispatcher("registrarVenta.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La venta NO existe");
                }
                request.getRequestDispatcher("registrarVenta.jsp").forward(request, response);
                break;

            case "ConsultarEliminar": //Consultar Documento para Eliminar

                ventaVO = ventaDAO.consultarDocumento(clienteId);

                if (ventaVO != null) {

                    request.setAttribute("datosConsultados", ventaVO);
                    request.getRequestDispatcher("eliminarVenta.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La venta NO existe");
                }
                request.getRequestDispatcher("venta.jsp").forward(request, response);
                break;*/
            case "Borrar": //Borrar Registro

                int idProducto = Integer.parseInt(request.getParameter("idp"));

                for (int i = 0; i < listaVentas.size(); i++) {

                    if (Integer.parseInt(listaVentas.get(i).getIdProducto()) == idProducto) {
                        listaVentas.remove(i);
                    }
                }
                break;

            case "ActualizarCantidad": //Actualizar Cantidad

                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("Cantidad"));

                for (int i = 0; i < listaVentas.size(); i++) {

                    if (Integer.parseInt(listaVentas.get(i).getIdProducto()) == idpro) {
                        listaVentas.get(i).setCantidad(cant);
                        double st = listaVentas.get(i).getPrecio() * cant;
                        listaVentas.get(i).setSubtotal(st);
                    }
                }
                break;

            case "ListaTemporal": //Lista Temporal
                                
                totalPagar = 0.0;
                request.setAttribute("lista", listaVentas);                

                for (int i = 0; i < listaVentas.size(); i++) {

                    totalPagar = totalPagar + listaVentas.get(i).getSubtotal();
                }
                request.setAttribute("totalpagar", totalPagar);
                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

                break;

            case "limpiarTabla":

                listaVentas.clear();

            default:

                request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

            //hrow new AssertionError();
        }

        request.getRequestDispatcher("nuevaVenta.jsp").forward(request, response);

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
