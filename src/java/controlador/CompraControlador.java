/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modeloDAO.CompraDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.ProveedorDAO;
import modeloVO.CompraVO;
import modeloVO.ProductoVO;
import modeloVO.ProveedorVO;

/**
 *
 * @author Beto
 */
@WebServlet(name = "CompraControlador", urlPatterns = {"/Compra"})
public class CompraControlador extends HttpServlet {

    //ClienteDAO cDAO = new ClienteDAO();
    ProveedorVO proveedor = new ProveedorVO();

    //ProductoDAO pDAO = new ProductoDAO();
    ProductoVO producto = new ProductoVO();

    CompraDAO compraDAO = new CompraDAO();
    ArrayList<CompraVO> listaCompras = new ArrayList<>();

    int item;
    String cod;
    String descripcion;
    double precioCompra;
    int cantidad;
    double subtotal;
    double totalPagar;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    String fechaComoCadena = sdf.format(new Date());
    String stock;

    CompraVO compraVO = new CompraVO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String opcion = request.getParameter("opcion");

        ProveedorDAO prDAO = new ProveedorDAO();
        ProductoDAO pDAO = new ProductoDAO();

        switch (opcion) {
            case "buscarProveedor":
                listaCompras.clear();
                String proveedorId = request.getParameter("textProveedorId");
                proveedor.setProveedorId(proveedorId);
                proveedor = prDAO.consultarId(proveedorId);
                request.setAttribute("proveedor", proveedor);

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                break;

            case "buscarProducto":
                String productoId = request.getParameter("textProductoId");
                producto.setProductoId(productoId);
                producto = pDAO.consultarP(productoId);
                request.setAttribute("proveedor", proveedor);
                request.setAttribute("producto", producto);
                request.setAttribute("lista", listaCompras);
                request.setAttribute("totalpagar", totalPagar);

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                break;

            case "Agregar": //Agregar Venta a la lista
                request.setAttribute("proveedor", proveedor);

                stock = request.getParameter("textProductoStock");

                totalPagar = 0;
                item = item + 1;
                cod = producto.getProductoId();
                descripcion = request.getParameter("textProductoNombre");
                precioCompra = Double.parseDouble(request.getParameter("textProductoPrecioCompra"));
                cantidad = Integer.parseInt(request.getParameter("textProductoCantidad"));
                subtotal = precioCompra * cantidad;

                compraVO = new CompraVO();

                compraVO.setItem(item);
                compraVO.setIdProducto(cod);
                compraVO.setDescripcionP(descripcion);
                compraVO.setPrecio(precioCompra);
                compraVO.setCantidad(cantidad);
                compraVO.setSubtotal(subtotal);
                compraVO.setFecha(fechaComoCadena);

                listaCompras.add(compraVO);
                
                for (int i = 0; i < listaCompras.size(); i++) {
                    totalPagar = totalPagar + listaCompras.get(i).getSubtotal();
                }

                request.setAttribute("totalpagar", totalPagar);
                request.setAttribute("lista", listaCompras);

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                break;

            case "GenerarCompra": //Agregar Venta

                //Actualizar Stock
                if (listaCompras != null) {
                    for (int i = 0; i < listaCompras.size(); i++) {

                        //ProductoVO pr = new ProductoVO();
                        int stockP = Integer.parseInt(producto.getStock());
                        int cant = listaCompras.get(i).getCantidad();
                        int idproducto = Integer.parseInt(listaCompras.get(i).getIdProducto());
                        ProductoDAO aO = new ProductoDAO();

                        aO.consultarP(Integer.toString(idproducto));
                        int sac = stockP + cant;
                        pDAO.actualizarStock(idproducto, sac);

                    }

                    request.setAttribute("mensajeExito", "Compra registrada correctamente");

                } else {

                    request.setAttribute("mensajeError", "La compra NO se registró correctamente");
                }

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                //Guardar Compra 
                compraVO.setIdProveedor(proveedor.getProveedorId());
                compraVO.setFecha(fechaComoCadena);
                compraVO.setMonto(totalPagar);
                compraDAO.guardarCompra(compraVO);

                //Guardar Detalle Ventas
                int idv = Integer.parseInt(compraDAO.IdCompras());

                for (int i = 0; i < listaCompras.size(); i++) {

                    compraVO = new CompraVO();
                    compraVO.setId(idv);
                    compraVO.setIdProducto(listaCompras.get(i).getIdProducto());
                    compraVO.setCantidad(listaCompras.get(i).getCantidad());
                    compraVO.setPrecio(listaCompras.get(i).getPrecio());

                    compraDAO.guardarDetalleCompras(compraVO);

                }

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                break;

            case "Borrar": //Borrar Registro

                int idProducto = Integer.parseInt(request.getParameter("idp"));

                for (int i = 0; i < listaCompras.size(); i++) {

                    if (Integer.parseInt(listaCompras.get(i).getIdProducto()) == idProducto) {
                        listaCompras.remove(i);
                    }
                }
                break;

            case "ActualizarCantidad": //Actualizar Cantidad

                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("Cantidad"));

                for (int i = 0; i < listaCompras.size(); i++) {

                    if (Integer.parseInt(listaCompras.get(i).getIdProducto()) == idpro) {
                        listaCompras.get(i).setCantidad(cant);
                        double st = listaCompras.get(i).getPrecio() * cant;
                        listaCompras.get(i).setSubtotal(st);
                    }
                }
                break;

            case "ListaTemporal1": //Lista Temporal

                totalPagar = 0.0;
                request.setAttribute("lista", listaCompras);

                for (int i = 0; i < listaCompras.size(); i++) {

                    totalPagar = totalPagar + listaCompras.get(i).getSubtotal();
                }
                request.setAttribute("totalpagar", totalPagar);
                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);

                break;

            case "limpiarTabla":

                listaCompras.clear();

            default:

                request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);
        }

        request.getRequestDispatcher("nuevaCompra.jsp").forward(request, response);
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
