/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.java;
import java.sql.*;

/**
 *
 * @author Bruno
 */
public class SaldoBD {
    private static String url = "jdbc:mysql://localhost:3306/saldo";
    private static String user = "root";
    private static String senha = "";
    
    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, senha);
    }
    
}
