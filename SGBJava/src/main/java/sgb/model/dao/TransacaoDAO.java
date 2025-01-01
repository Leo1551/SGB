/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.*;

/**
 *
 * @author viotr
 */
public class TransacaoDAO {

    private static String url = "jdbc:mysql://localhost:3306/sgb";
    private static String usuario = "root";
    private static String senha = "";
    private Connection conexao;

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }

    public TransacaoDAO() throws SQLException {
        try (Connection conexao = getConnection();) {
        } catch (SQLException e) {
            System.out.println("Erro ao inicializar a conexão ao instanciar um objeto TransacaoDAO: " + e.getMessage());
        }
    }
}
