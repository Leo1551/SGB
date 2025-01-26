/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sgb.model.dto.RecSenha;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author aluno
 */
public class SenhaDAO {
    
    public static String enviarEmail(RecSenha account) throws MessagingException{
        ConectarDAO con = new ConectarDAO();
        
        try{
            
            Connection conexaoBD = con.conectar();
            
            PreparedStatement caixa = conexaoBD.prepareStatement("SELECT `email`, `nome` from cadastros where matricula = ?");
            caixa.setString(1, account.getMatricula());
            ResultSet dadosUsuario = caixa.executeQuery();
            if (!dadosUsuario.next()) return account.getMatricula();
            //202478904
            // parte destinada ao email
           
            String host = "smtp.gmail.com"; 
            String port = "587"; 
            String usuario = "sgru2008@gmail.com"; 
            String senha = "qdjm sktw ubmv ckmv";
            
            Properties props = new Properties();
            
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.imaps.sasl.mechanisms", "XOAUTH2");

            
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
                    +       "<p>Clique neste link para recuperar a sua senha</p>"
                    +       "<a href=' http://localhost:8080/SGBWeb/core/reglog/atualizaSenha.jsp?matricula=" + account.getMatricula() + "&senha=" + account.getNovaSenha() + "'>Clique aqui para recuperar sua senha</a>"
                    +   "</body>"
                    + "</html>";
            
            
            
            
                
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuario));    
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dadosUsuario.getString("email")));
            message.setSubject("Recuperação de Senha");
            message.setContent(corpoEmail, "text/html");
           
            Transport.send(message);
            return "Email enviado com sucesso! Leia-o.";
            
            
           } catch (Exception ex) {
                return ex.getMessage();
            }
        
        
        
        
        
        
    }
}
