<%-- 
    Document   : RecEmail
    Created on : 22 de dez de 2024, 18:13:31
    Author     : leona
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@page import="sgb.model.dao.SenhaDAO"%>
<%@page import="sgb.model.dto.RecSenha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!--css-->
    <%@include file="css.jsp"%>
    <title>SGRU</title>
</head>
<body>
    <%@include file="../header.jsp"%>
    
     <h1>Enviaremos um email para a sua conta onde será registrado a sua nova senha</h1>
        
    <div id="caixa-login">
        
       
        <form action="" method="post">
            
            <input type="text" name="matricula" placeholder="Número de matricula">

            <input type="text" name="novaSenha" placeholder="Nova Senha">
    
            <input type="text" name="confirmaSenha" placeholder="Confirmação da Nova Senha">
    
    
            <input type="submit" value="Alterar">
        </form>
        202478904
    </div>
    <%@include file="../footer.jsp" %>
</body>
</html>

<%
    ConectarDAO con = new ConectarDAO();
    Connection conexaoBD = con.conectar();
    PreparedStatement caixa = conexaoBD.prepareStatement("SELECT `senha` from cadastros where matricula = ?");
    // Verificar se o formulário foi enviado
    if ("POST".equalsIgnoreCase(request.getMethod())) {
    
        String matricula = request.getParameter("matricula");
        String novaSenha = request.getParameter("novaSenha");
        String confirmaSenha = request.getParameter("confirmaSenha");
        caixa.setString(1, matricula);
        
        ResultSet dados = caixa.executeQuery();
        
            
        
        
            if ( dados.next() && novaSenha.equals(dados.getString(1)))
                out.println("<h1><center>Essa era a sua senha anterior.</center></h1>");
            else
                if (novaSenha != null && novaSenha.equals(confirmaSenha))
                    out.println( "<h1><center>" + SenhaDAO.enviarEmail(new RecSenha(matricula, novaSenha, confirmaSenha))+ "</center></h1>" );
                else 
                    out.println("<h1><center>As senhas não coincidem.</center></h1>");
        
    }
%>
