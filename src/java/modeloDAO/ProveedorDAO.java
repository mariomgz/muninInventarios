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
import modeloVO.ProveedorVO;
import java.util.logging.Level;
import java.util.logging.Logger;
import modeloVO.ClienteVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class ProveedorDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;
    int r;

    public String proveedorId = "", nombreProveedor = "", ciudadProveedor = "", direccionProveedor = "",
            telefonoProveedor = "", emailProveedor = "", estadoProveedor = "";

    public ProveedorDAO() {
    }

    public ProveedorDAO(ProveedorVO proveedorVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            proveedorId = proveedorVO.proveedorId;
            nombreProveedor = proveedorVO.nombreProveedor;
            ciudadProveedor = proveedorVO.ciudadProveedor;
            direccionProveedor = proveedorVO.direccionProveedor;
            telefonoProveedor = proveedorVO.telefonoProveedor;
            emailProveedor = proveedorVO.emailProveedor;
            estadoProveedor = proveedorVO.estadoProveedor;

        } catch (Exception e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into proveedores (id_proveedor,nombreProveedor,ciudadProveedor, direccionProveedor, telefonoProveedor,"
                    + "emailProveedor,estado) "
                    + "values (?,?,?,?,?,?,'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proveedorId);
            puente.setString(2, nombreProveedor);
            puente.setString(3, ciudadProveedor);
            puente.setString(4, direccionProveedor);
            puente.setString(5, telefonoProveedor);
            puente.setString(6, emailProveedor);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update proveedores set nombreProveedor=?, ciudadProveedor=?,direccionProveedor=?, "
                    + "telefonoProveedor=?, emailProveedor=? where id_proveedor=?";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, nombreProveedor);
            puente.setString(2, ciudadProveedor);
            puente.setString(3, direccionProveedor);
            puente.setString(4, telefonoProveedor);
            puente.setString(5, emailProveedor);
            puente.setString(6, proveedorId);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "update proveedores set estado='Inactivo' where id_proveedor=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proveedorId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public ArrayList<ProveedorVO> listar() {

        ProveedorVO proveedorVO = null;
        ArrayList<ProveedorVO> listaProveedores = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            //sql = "Select * from clientes where estado='activo'";
            sql = "SELECT\n"
                    + "    proveedores.id_proveedor,\n"
                    + "    proveedores.nombreProveedor,\n"
                    + "    municipios.nombre,\n"
                    + "    proveedores.direccionProveedor,\n"
                    + "    proveedores.telefonoProveedor,\n"
                    + "    proveedores.emailProveedor,  \n"
                    + "    proveedores.estado  \n"
                    + "FROM\n"
                    + "    proveedores\n"
                    + "INNER JOIN municipios ON municipios.id = proveedores.ciudadProveedor\n"
                    + "WHERE\n"
                    + "    estado='activo' and municipios.codigo='1'";

            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                proveedorVO = new ProveedorVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7));

                listaProveedores.add(proveedorVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaProveedores;

    }

    public ProveedorVO consultarId(String documento) {

        ProveedorVO proveedorVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from proveedores where id_proveedor=? and estado='activo'";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                proveedorVO = new ProveedorVO(documento, mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7));
            }

        } catch (SQLException e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return proveedorVO;

    }

    public ProveedorVO delete(String documento) {

        ProveedorVO proveedorVO = null;

        try {

            sql = "update proveedores set estado='Inactivo' where id_proveedor=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return proveedorVO;

    }

}
