/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modeloVO.ProductoVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class ProductoDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    public boolean operacion = false;
    public String sql;
    int r;

    //ProductoVO p = new ProductoVO();
    public String productoId = "", productoNombre = "", idCategoria = "", idBodega = "", productoPrecioVenta = "", productoPrecioCompra = "",
            stock = "", estadoProducto = "";

    public ProductoDAO() {
    }

    public ProductoDAO(ProductoVO productoVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            productoId = productoVO.getProductoId();
            productoNombre = productoVO.productoNombre;
            idCategoria = productoVO.idCategoria;
            idBodega = productoVO.idBodega;
            productoPrecioVenta = productoVO.productoPrecioVenta;
            productoPrecioCompra = productoVO.productoPrecioCompra;
            stock = productoVO.getStock();
            estadoProducto = productoVO.estadoProducto;

        } catch (Exception e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into productos (nombreProducto, id_categoria,  "
                    + "id_bodega, precioVenta, precioCompra, stock, estado) "
                    + "values (?,?,?,?,?,?,'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, productoNombre);
            puente.setString(2, idCategoria);
            puente.setString(3, idBodega);
            puente.setString(4, productoPrecioVenta);
            puente.setString(5, productoPrecioCompra);
            puente.setString(6, stock);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {

        sql = "update productos set nombreProducto=?,id_categoria=?, id_bodega=?,  "
                + " precioVenta=?, precioCompra=?, stock=?  where id_producto=?";

        try {

            puente = conexion.prepareStatement(sql);
            puente.setString(1, productoNombre);
            puente.setString(2, idCategoria);
            puente.setString(3, idBodega);
            puente.setString(4, productoPrecioVenta);
            puente.setString(5, productoPrecioCompra);
            puente.setString(6, stock);
            puente.setString(7, productoId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "update productos set estado='Inactivo' where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, productoId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public ArrayList<ProductoVO> listar() {

        ProductoVO productoVO = null;

        ArrayList<ProductoVO> listaProductos = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            //sql = "Select * from productos where estado='activo'";
            sql = "SELECT\n"
                    + "    productos.id_producto,\n"
                    + "    productos.nombreProducto,\n"
                    + "    categorias.nombreCategoria,\n"
                    + "    bodegas.nombre_bodega,\n"
                    + "    productos.precioVenta,\n"
                    + "    productos.precioCompra,\n"
                    + "    productos.stock,  \n"
                    + "    productos.estado  \n"
                    + "FROM\n"
                    + "    productos\n"
                    + "INNER JOIN categorias ON categorias.id_categoria = productos.id_categoria\n"
                    + "INNER JOIN bodegas ON bodegas.id_bodega = productos.id_bodega\n"
                    + "WHERE\n"
                    + "    estado='activo'";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                productoVO = new ProductoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8));

                listaProductos.add(productoVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaProductos;

    }

    public ProductoVO consultarP(String documento) {

        ProductoVO productoVO = null;

        try {

            conexion = this.obtenerConexion();
            //sql = "Select * from productos where id_producto=? and estado='activo'";
            sql="SELECT\n"
                    + "    productos.id_producto,\n"
                    + "    productos.nombreProducto,\n"
                    + "    categorias.id_categoria,\n"
                    + "    bodegas.id_bodega,\n"
                    + "    productos.precioVenta,\n"
                    + "    productos.precioCompra,\n"
                    + "    productos.stock,  \n"
                    + "    productos.estado  \n"
                    + "FROM\n"
                    + "    productos\n"
                    + "INNER JOIN categorias ON categorias.id_categoria = productos.id_categoria\n"
                    + "INNER JOIN bodegas ON bodegas.id_bodega = productos.id_bodega\n"
                    + "WHERE\n"
                    + " id_producto=? and  estado='activo'";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                productoVO = new ProductoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8));

            }

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return productoVO;

    }

    public int actualizarStock(int id, int stock) {

        sql = "update productos set stock=? where id_producto=?";
        try {

            conexion = this.obtenerConexion();
            //sql = "update productos set stock=? where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, stock);
            puente.setInt(2, id);
            puente.executeUpdate();

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        /*finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }*/

        return r;

    }

    public ProductoVO delete(String documento) {

        ProductoVO productoVO = null;

        try {

            sql = "update productos set estado='Inactivo' where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return productoVO;

    }

}
