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
import modeloVO.CompraVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class CompraDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    int r;
    public String sql;

    public String CompraId = "", idProveedor = "", CompraFecha = "", CompraEstado = "";
    public String detalleCompraId = "", productoId = "", detalleCompraEstado = "";
    public Integer cantidad;

    public CompraDAO() {
    }

    public CompraDAO(CompraVO CompraVO) {
        super();

        try {

            conexion = this.obtenerConexion();

        } catch (Exception e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into compras (id_proveedor,fecha,estado) values (?,?, 'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idProveedor);
            puente.setString(2, CompraFecha);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update compras set id_proveedor=?, fecha=? where id_compra=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idProveedor);
            puente.setString(2, CompraFecha);
            puente.setString(3, CompraId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "update compras set estado='Inactivo' where id_compra=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, CompraId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public ArrayList<CompraVO> listar() {

        CompraVO compraVO = null;

        ArrayList<CompraVO> listaCompras = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from compras";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                listaCompras.add(compraVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaCompras;
    }

    public String IdCompras() {

        String idcompras = "";

        try {

            conexion = this.obtenerConexion();
            sql = "Select max(id_compra) from compras";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                idcompras = mensajero.getString(1);

            }

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        }

        return idcompras;

    }

    public int guardarCompra(CompraVO cvo) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into compras (id_proveedor,fecha,monto, estado) values (?,?,?, 'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, cvo.getIdProveedor());
            puente.setString(2, cvo.getFecha());
            puente.setDouble(3, cvo.getMonto());

            puente.executeUpdate();

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        }

        return r;
    }

    public int guardarDetalleCompras(CompraVO detalleCompras) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into detalle_compra (id_compra,id_producto, cantidad, precioCompra) values (?,?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, detalleCompras.getId());
            puente.setString(2, detalleCompras.getIdProducto());
            puente.setInt(3, detalleCompras.getCantidad());
            puente.setDouble(4, detalleCompras.getPrecio());
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return r;
    }

}
