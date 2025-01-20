<%-- 
    Document   : RecEmail
    Created on : 22 de dez de 2024, 18:13:31
    Author     : leona
--%>

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
    <title>Document</title>
</head>
<body>
    <%@include file="../header.jsp"%>
    
     <p>Enviaremos um email para a sua conta onde será registrado a sua nova senha</p>
        
    <div id="caixa-login">
        
       
        <form action="" method="post">
            
            <input type="text" name="CPF" placeholder="Digite aqui seu CPF">

            <input type="text" name="novaSenha" placeholder="Nova Senha">
    
            <input type="text" name="confirmaSenha" placeholder="Confirmação da Nova Senha">
    
    
            <input type="submit" value="Alterar">
        </form>
    </div>
    <%@include file="../footer.jsp" %>
</body>
</html>

<%

    // Verificar se o formulário foi enviado
    if ("POST".equalsIgnoreCase(request.getMethod())) {
    
        String cpf = request.getParameter("CPF");
        String novaSenha = request.getParameter("novaSenha");
        String confirmaSenha = request.getParameter("confirmaSenha");

        
        if (novaSenha != null && novaSenha.equals(confirmaSenha)) 
            out.println( SenhaDAO.enviarEmail(new RecSenha(cpf, novaSenha, confirmaSenha)) );
        else 
            out.println("As senhas não coincidem.");
        
    }
%>




%>