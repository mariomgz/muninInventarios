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
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import modeloVO.VentaVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class VentaDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    int r;
    public String sql;

    public String ventaId = "", idCliente = "", ventaFecha = "", ventaEstado = "";
    public String detalleVentaId = "", productoId = "", detalleVentaEstado = "";
    public Integer cantidad;

    public VentaDAO() {
    }

    public VentaDAO(VentaVO ventaVO) {
        super();

        try {

            conexion = this.obtenerConexion();

        } catch (Exception e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into ventas (id_cliente,fecha,estado) values (?,?, 'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idCliente);
            puente.setString(2, ventaFecha);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update ventas set id_cliente=?,  fecha=? where id_venta=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idCliente);
            puente.setString(2, ventaFecha);
            puente.setString(3, ventaId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "update ventas set estado='Inactivo' where id_venta=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ventaId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public ArrayList<VentaVO> listar() {

        VentaVO ventaVO = null;

        ArrayList<VentaVO> listaVentas = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from ventas";
            //sql = "Select min(id_venta) from ventas";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                listaVentas.add(ventaVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaVentas;

    }

    public VentaVO consultarDocumento(String venta) {

        VentaVO ventaVO = new VentaVO();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from ventas where id_venta=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, venta);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

            }

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return ventaVO;

    }

    public String IdVentas() {

        String idventas = "";

        try {

            conexion = this.obtenerConexion();
            sql = "Select max(id_venta) from ventas";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                idventas = mensajero.getString(1);

            }

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        /*finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }*/

        return idventas;

    }

    public int guardarVenta(VentaVO ve) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into ventas (id_cliente,fecha,monto, estado) values (?,?,?, 'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ve.getIdCliente());
            puente.setString(2, ve.getFecha());
            puente.setDouble(3, ve.getMonto());

            puente.executeUpdate();

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        

        return r;
    }

    public int guardarDetalleVentas(VentaVO detalleVenta) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into detalle_venta (id_venta,id_producto, cantidad, precioVenta) values (?,?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, detalleVenta.getId());
            puente.setString(2, detalleVenta.getIdProducto());
            puente.setInt(3, detalleVenta.getCantidad());
            puente.setDouble(4, detalleVenta.getPrecio());
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        /*finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(VentaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }*/

        return r;
    }

    public class Fechas {

        public void main(String[] args) {

            //Instanciamos el objeto Calendar
            //en fecha obtenemos la fecha y hora del sistema
            Calendar fecha = new GregorianCalendar();

            //Obtenemos el valor del año, mes, día,
            //hora, minuto y segundo del sistema
            //usando el método get y el parámetro correspondiente                                                     
            int año = fecha.get(Calendar.YEAR);
            int mes = fecha.get(Calendar.MONTH);
            int dia = fecha.get(Calendar.DAY_OF_MONTH);

            //Mostramos por pantalla dia/mes/año
            System.out.println("Fecha Actual: " + dia + "/" + (mes + 1) + "/" + año);

        }
    }

}
