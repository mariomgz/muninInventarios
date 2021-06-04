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
import modeloVO.PerfilVO;
import util.Conexion;

/**
 *
 * @author Beto
 */
public class PerfilDAO extends Conexion {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;

    public ArrayList<PerfilVO> listar(String usuario, String clave) {

        PerfilVO perfilVO = null;
        ArrayList<PerfilVO> listaPerfiles = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            //sql = "SELECT nombrePerfil FROM usuarios, perfiles WHERE emailUsuario=? AND claveUsuario=?";
            sql = "SELECT\n"
                    + "    usuarios.id_usuario,\n"
                    + "    perfiles.nombrePerfil\n"
                    + "FROM\n"
                    + "    perfiles\n"
                    + "INNER JOIN usuario_perfil ON perfiles.id_perfil = usuario_perfil.id_perfil\n"
                    + "INNER JOIN usuarios ON usuario_perfil.id_usuario = usuarios.id_usuario\n"
                    + "WHERE\n"
                    + "    usuarios.emailUsuario=? AND usuarios.claveUsuario = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            puente.setString(2, clave);

            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                perfilVO = new PerfilVO(mensajero.getString(2), mensajero.getString(1));

                listaPerfiles.add(perfilVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(PerfilDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(PerfilDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaPerfiles;

    }

}
