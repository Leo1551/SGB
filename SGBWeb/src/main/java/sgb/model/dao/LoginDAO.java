/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.*;
import sgb.model.dto.Login;



public class LoginDAO {
    
    
    public static boolean verificacaoLogin(Login login){
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        try{
           conexao = con.conectar();
           if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
           }
           PreparedStatement caixa = conexao.prepareStatement("SELECT EXISTS(SELECT 1 FROM cadastros WHERE matricula = ? AND senha = ?)");
           //abre suporte em lote
           caixa.setString(1, login.getMatricula());
           caixa.setString(2, login.getSenha());

           ResultSet resultado = caixa.executeQuery();
           Boolean existe = false;
           
          
               existe = resultado.getBoolean(1);
           
           return  existe;
             
        } catch (SQLException e) {

            System.err.println("Erro ao consultar login no banco de dados \n\n\n" + e.getMessage());
            return false;
        }

      
    
    }
}
    
    

