/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sgb.model.dto.RecSenha;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author aluno
 */
public class SenhaDAO {
    
    public static String enviarEmail(RecSenha account) throws MessagingException{
        ConectarDAO con = new ConectarDAO();
        
        try{
            
            Connection conexaoBD = con.conectar();
            
            PreparedStatement caixa = conexaoBD.prepareStatement("SELECT `email`, `nome` from cadastros where cpf = ?");
            caixa.setString(1, account.getCpf());
            ResultSet dadosUsuario = caixa.executeQuery();

            
            // parte destinada ao email
            
            String host = "smtp.gmail.com"; 
            String port = "587"; 
            String usuario = "sgbMail@gmail.com"; 
            String senha = "sobble";
            
            Properties props = new Properties();
             
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            
            Session session = Session.getInstance(props, new Authenticator(){
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(usuario, senha);
                }

            });
            
            
            String corpoEmail = 
                      "<html>"
                    +   "<body>"
                    +       "<p>Olá, " + dadosUsuario.getString("nome") +"</p>"
                    +       "<p>Clique neste link abaixo para recuperar a sua senha</p>"
                    +       "<a href=' http://localhost:8090/SGBWeb/core/reglog/atualizaSenha.jsp?cpf=" + account.getCpf() + "'>Clique aqui para recuperar sua senha</a>"
                    +   "</body>"
                    + "</html>";
            
            
            
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuario));    
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dadosUsuario.getString("email")));
            message.setSubject("Recuperação de Senha");
            message.setContent(corpoEmail, "text/html");
            
            
            
            Transport.send(message);
            return "Email enviado com sucesso!";
  

            
           } catch (MessagingException | SQLException ex) {
                Logger.getLogger(SenhaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        return "Email enviado com fracasso";
        
        
        
        
    }
}
