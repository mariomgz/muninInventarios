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
import modeloVO.CiudadVO;
import util.Conexion;

/**
 *
 * @author Beto
 */
public class CiudadDAO extends Conexion{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;       
    
    private String ciudadId="", departamentoId="", codigoCiudad="", nombreCiudad="";
    
    public ArrayList<CiudadVO> listar() {

        CiudadVO ciudadVO = null;
        ArrayList<CiudadVO> listaCiudad= new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from municipios where codigo='1' order by nombre asc";            
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                ciudadVO = new CiudadVO(mensajero.getString(1), mensajero.getString(2), 
                        mensajero.getString(3), mensajero.getString(4));

                listaCiudad.add(ciudadVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(CiudadDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CiudadDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return listaCiudad;

    }
    
}
