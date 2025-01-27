package sgb.model.dao;

import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(login.getSenha().getBytes());
            
            String criptoSenha = DatatypeConverter.printHexBinary(md5.digest()).toUpperCase();
            
            caixa = conexao.prepareStatement("SELECT EXISTS(SELECT 1 FROM cadastros WHERE matricula = ? AND senha = ?)");
            caixa.setString(1, login.getMatricula());
            caixa.setString(2, criptoSenha);
            
            resultado = caixa.executeQuery();
            
            
            if (resultado.next()) {
                return resultado.getBoolean(1);
            } else {
                return false; 
            }
        } catch (SQLException e) {
            System.err.println("Erro ao consultar login no banco de dados \n\n\n" + e.getMessage());
            return false;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
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