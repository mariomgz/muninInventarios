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
import util.Crud;

/**
 *
 * @author Beto
 */
public class BodegaDAO extends Conexion implements Crud{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;     
        
    private String bodegaId="", nombreBodega="", ubicacion="";

    public BodegaDAO() {
    }    
    
    public BodegaDAO(BodegaVO bodegaVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            bodegaId = bodegaVO.getBodegaId();
            nombreBodega = bodegaVO.getNombreBodega();
            ubicacion = bodegaVO.getUbicacion();

        } catch (Exception e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }
    
    public ArrayList<BodegaVO> listar() {

        BodegaVO bodegaVO = null;
        ArrayList<BodegaVO> listaBodega = new ArrayList<>();

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from bodegas";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                bodegaVO = new BodegaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));

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

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into bodegas (nombre_bodega, ubicacion) values (?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, nombreBodega);
            puente.setString(2, ubicacion);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;

    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update bodegas set nombre_bodega=?, ubicacion=? where id_bodega=?";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, nombreBodega);
            puente.setString(2, ubicacion);
            puente.setString(3, bodegaId);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
         try {

            sql = "delete from bodegas where id_bodega=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, bodegaId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }
    
    public BodegaVO consultarId(String idBodega) {

        BodegaVO bodegaVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from bodegas where id_bodega=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idBodega);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                bodegaVO = new BodegaVO(idBodega, mensajero.getString(2),mensajero.getString(3));
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

        return bodegaVO;

    }
    
    public BodegaVO delete(String idBodega) {

        BodegaVO bodegaVO = null;

        try {

            sql = "delete from bodegas where id_bodega=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idBodega);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(BodegaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return bodegaVO;

    }
    
}
