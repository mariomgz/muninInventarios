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
import util.Crud;

/**
 *
 * @author Beto
 */
public class CategoriaDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    public boolean operacion = false;
    public String sql;

    private String categoriaId = "", nombreCategoria = "";

    public CategoriaDAO() {
    }
    
    public CategoriaDAO(CategoriaVO categoriaVO) {
        super();

        try {

            conexion = this.obtenerConexion();
            categoriaId = categoriaVO.getCategoriaId();
            nombreCategoria = categoriaVO.getNombreCategoria();
            
        } catch (Exception e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }

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

    @Override
    public boolean crearRegistro() {
        try {

            sql = "insert into categorias (nombreCategoria) values (?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, nombreCategoria);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update categorias set nombreCategoria=? where id_categoria=?";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, nombreCategoria);
            puente.setString(2, categoriaId);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    @Override
    public boolean borrarRegistro() {
        try {

            sql = "delete from categorias where id_categorias=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, categoriaId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return operacion;
    }

    public CategoriaVO consultarId(String idCat) {

        CategoriaVO categoriaVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "Select * from categorias where id_categoria=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idCat);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                categoriaVO = new CategoriaVO(idCat, mensajero.getString(2));
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

        return categoriaVO;

    }

    public CategoriaVO delete(String idCategoria) {

        CategoriaVO categoriaVO = null;

        try {

            sql = "delete from categorias where id_categorias=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idCategoria);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {

            try {

                this.cerrarConexion();

            } catch (Exception e) {

                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }

        return categoriaVO;

    }

}
