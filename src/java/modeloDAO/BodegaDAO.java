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
import modeloVO.BodegaVO;
import util.Conexion;

/**
 *
 * @author Beto
 */
public class BodegaDAO extends Conexion{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;     
        
    private String bodegaId="", nombreBodega="";
    
    public ArrayList<BodegaVO> listar() {

        BodegaVO bodegaVO = null;
        ArrayList<BodegaVO> listaBodega = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from bodegas";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                bodegaVO = new BodegaVO(mensajero.getString(1), mensajero.getString(2));

                listaBodega.add(bodegaVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaBodega;

    }
    
}
