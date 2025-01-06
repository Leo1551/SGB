/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.*;
import java.util.*;
import sgb.model.dto.Login;





public class LoginDAO {
    
    
    public static void verificacaoLogin(Login login){
        
        try{
           Connection conexao = OpenBD.getConnection();
           PreparedStatement caixa = conexao.prepareStatement("SELECT EXISTS(SELECT 1 FROM [NOME DO MEU BANCO DE DADOS COM OS REGISTROS] WHERE matricula = ? AND senha = ?)");
           //abre suporte em lote
           caixa.setString(1, login.getMatricula());
           caixa.setString(2, login.getSenha());

           ResultSet resultado = caixa.executeQuery();
           
            if (resultado.next())
                System.out.println("Usuário válido");
           
        } catch (SQLException e) {
            System.err.println("Erro ao consultar login no banco de dados \n\n\n" + e.getMessage());
        }
    
    }
    
    
}
