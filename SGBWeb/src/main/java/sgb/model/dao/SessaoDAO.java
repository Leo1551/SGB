package sgb.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Leonardo
 */
public class SessaoDAO {

    public static ResultSet querySQL(String query, String[] dados) throws SQLException {
        
            ConectarDAO con = new ConectarDAO();
            Connection conexaoBD = con.conectar();
            PreparedStatement caixa = conexaoBD.prepareStatement(query);

            for (int i = 0; i < dados.length; i++) {
                caixa.setString((i + 1), dados[i]);
            }

            ResultSet cargoBD = caixa.executeQuery();

            cargoBD.next();

            return cargoBD;

    }

}
