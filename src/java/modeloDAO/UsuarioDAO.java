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
import java.util.logging.Level;
import java.util.logging.Logger;
import modeloVO.ClienteVO;
import modeloVO.UsuarioVO;
import modeloVO.VentaVO;
import util.Conexion;
import util.Crud;

/**
 *
 * @author Beto
 */
public class UsuarioDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    int r;
    public String sql;

    public String usuId = "", usuNombre = "", usuApellido = "", usuLogin = "", usuClave = "";

    public UsuarioDAO(UsuarioVO usuVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            usuId = usuVO.getUsuId();
            usuNombre = usuVO.usuNombre;
            usuApellido = usuVO.usuApellido;
            usuLogin = usuVO.usuLogin;
            usuClave = usuVO.usuClave;
            

        } catch (Exception e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    public UsuarioDAO() {
        
    }

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into usuarios(nombreUsuario, apellidoUsuario, emailUsuario, claveUsuario) values (?,?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuNombre);
            puente.setString(2, usuApellido);
            puente.setString(3, usuLogin);
            puente.setString(4, usuClave);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update usuario set USULOGIN=?, USUPASSWORD=? where USUID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuLogin);
            puente.setString(2, usuClave);
            puente.setString(3, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;

    }

    @Override
    public boolean borrarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean iniciarSesion(String usuario, String password) {

        try {

            conexion = this.obtenerConexion();
            sql = "select * from usuarios where emailUsuario=? and claveUsuario=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            puente.setString(2, password);
            mensajero = puente.executeQuery();

            if (mensajero.next()) {

                operacion = true;

            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public UsuarioVO consultarDatos(String usuId) {

        UsuarioVO usuVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from usuarios where id_usuario=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuId);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5)
                );
            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return usuVO;

    }
    
    public String IdUsuarios() {

        String idusuarios = "";

        try {

            conexion = this.obtenerConexion();
            sql = "Select max(id_usuario) from usuarios";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                idusuarios = mensajero.getString(1);

            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } 
        /*finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }*/

        return idusuarios;

    }

    public int guardarUsuario(UsuarioVO us) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into usuarios (nombreUsuario,apellidoUsuario,emailUsuario, claveUsuario) values (?,?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, us.getUsuNombre());
            puente.setString(2, us.getUsuApellido());
            puente.setString(3, us.getUsuLogin());
            puente.setString(4, us.getUsuClave());
            
            puente.executeUpdate();

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } 
        /*finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }*/

        return r;
    }

    public int guardarUsuarioPerfil(UsuarioVO usuarioPerfil) {

        try {

            conexion = this.obtenerConexion();
            sql = "insert into usuario_perfil (id_usuario, id_perfil) values (?,2)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuarioPerfil.getUsuId());
           
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } 
        finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return r;
    }


}
