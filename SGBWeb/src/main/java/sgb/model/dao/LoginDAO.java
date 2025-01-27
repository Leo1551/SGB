package sgb.model.dao;

import java.sql.*;
import sgb.model.dto.Login;
//Favor NÃO alterar esse maldito login :)
public class LoginDAO {
    
    public static boolean verificacaoLogin(Login login) {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement caixa = null;
        ResultSet resultado = null; 
        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            
           
            
            caixa = conexao.prepareStatement("SELECT EXISTS(SELECT 1 FROM cadastros WHERE matricula = ? AND senha = ?)");
            caixa.setString(1, login.getMatricula());
            caixa.setString(2, login.getSenha());
            
            resultado = caixa.executeQuery();
            
            
            if (resultado.next()) {
                return resultado.getBoolean(1);
            } else {
                return false; 
            }
        } catch (SQLException e) {
            System.err.println("Erro ao consultar login no banco de dados \n\n\n" + e.getMessage());
            return false;
        } finally {
            
            try {
                if (resultado != null) resultado.close();
                if (caixa != null) caixa.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                System.err.println("Erro ao fechar recursos: " + e.getMessage());
            }
        }
        
    }
}