/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author aluno
 */
public class OpenBD {
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/sgb";
    private static final String usuario = "root";
    private static final String senha = "";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }
    
    public  Connection getConnectionComDriver() throws SQLException, ClassNotFoundException {
        Class.forName(driver);
        return DriverManager.getConnection(url, usuario, senha);
    }
}
