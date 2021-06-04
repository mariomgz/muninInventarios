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
import modeloVO.CategoriaVO;
import util.Conexion;

/**
 *
 * @author Beto
 */
public class CategoriaDAO extends Conexion{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;    
    
    private String categoriaId="", nombreCategoria="";

    public ArrayList<CategoriaVO> listar() {

        CategoriaVO categoriaVO = null;
        ArrayList<CategoriaVO> listaCategoria = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from categorias";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                categoriaVO = new CategoriaVO(mensajero.getString(1), mensajero.getString(2));

                listaCategoria.add(categoriaVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaCategoria;

    }

}
