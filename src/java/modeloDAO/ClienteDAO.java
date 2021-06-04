
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import modeloVO.ClienteVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class ClienteDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;
    int r;

    //ClienteVO c = new ClienteVO();
    public String clienteId = "", clienteTipoDoc = "", clienteNombre = "", clienteApellido = "", clienteCiudad = "",
            clienteDireccion = "", clienteTelefono = "", clienteEmail = "", clienteEstado = "";

    public ClienteDAO() {
    }

    public ClienteDAO(ClienteVO clienteVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            clienteId = clienteVO.clienteId;
            clienteTipoDoc = clienteVO.clienteTipoDoc;
            clienteNombre = clienteVO.clienteNombre;
            clienteApellido = clienteVO.clienteApellido;
            clienteCiudad = clienteVO.clienteCiudad;
            clienteDireccion = clienteVO.clienteDireccion;
            clienteTelefono = clienteVO.clienteTelefono;
            clienteEmail = clienteVO.clienteEmail;

        } catch (Exception e) {

            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into clientes (id_cliente,tipoDocumento,nombreCliente,apellidoCliente,ciudadCliente,"
                    + "direccionCliente,telefonoCliente,emailCliente,estado) "
                    + "values (?,?,?,?,?,?,?,?,'Activo')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, clienteId);
            puente.setString(2, clienteTipoDoc);
            puente.setString(3, clienteNombre);
            puente.setString(4, clienteApellido);
            puente.setString(5, clienteCiudad);
            puente.setString(6, clienteDireccion);
            puente.setString(7, clienteTelefono);
            puente.setString(8, clienteEmail);

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

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update clientes set tipoDocumento=?, nombreCliente=?, apellidoCliente=?,"
                    + "ciudadCliente=?,direccionCliente=?, telefonoCliente=?,  emailCliente=? where id_cliente=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, clienteTipoDoc);
            puente.setString(2, clienteNombre);
            puente.setString(3, clienteApellido);
            puente.setString(4, clienteCiudad);
            puente.setString(5, clienteDireccion);
            puente.setString(6, clienteTelefono);
            puente.setString(7, clienteEmail);
            puente.setString(8, clienteId);
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

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "update clientes set estado='Inactivo' where id_cliente=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, clienteId);
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

    public ArrayList<ClienteVO> listar() {

        ClienteVO clienteVO = null;
        ArrayList<ClienteVO> listaClientes = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            //sql = "Select * from clientes where estado='activo'";
            sql = "SELECT\n"
                    + "    clientes.id_cliente,\n"
                    + "    clientes.tipoDocumento,\n"
                    + "    clientes.nombreCliente,\n"
                    + "    clientes.apellidoCliente,\n"
                    + "    municipios.nombre,\n"
                    + "    clientes.direccionCliente,\n"
                    + "    clientes.telefonoCliente,\n"
                    + "    clientes.emailCliente,  \n"
                    + "    clientes.estado  \n"
                    + "FROM\n"
                    + "    clientes\n"
                    + "INNER JOIN municipios ON municipios.id = clientes.ciudadCliente\n"
                    + "WHERE\n"
                    + "    estado='activo' and municipios.codigo='1'";

            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                clienteVO = new ClienteVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));

                listaClientes.add(clienteVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaClientes;

    }

    public ClienteVO consultarId(String documento) {

        ClienteVO clienteVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from clientes where id_cliente=? and estado='activo'";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                clienteVO = new ClienteVO(documento, mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));
            }

        } catch (SQLException e) {

            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return clienteVO;

    }

    public ClienteVO delete(String documento) {

        ClienteVO clienteVO = null;

        try {

            sql = "update clientes set estado='Inactivo' where id_cliente=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
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

        return clienteVO;

    }
        

}
