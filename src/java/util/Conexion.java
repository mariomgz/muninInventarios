/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Beto
 */
public class Conexion {
    
    public String driver, user, password, bd, urlBd;
    public Connection conexion;
    
    public Conexion() {

        driver = "com.mysql.jdbc.Driver";
        user = "munin";
        password = "munin*123";
        bd = "munininventarios_v1_26mar21";
        urlBd = "jdbc:mysql://localhost:3306/" + bd;

        try {

            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlBd, user, password);
            System.out.println("Conexion Correcta");

        } catch (Exception e) {

            System.out.println("Error al conectarse" + e.toString());
        }

    }
    
    public Connection obtenerConexion() {

        return conexion;

    }

    public Connection cerrarConexion() throws SQLException {

        conexion.close();
        conexion = null;
        return conexion;
    }

    public static void main(String[] args) {

        new Conexion();

    }
    
}
