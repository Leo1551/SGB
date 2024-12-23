<%-- 
    Document   : RecEmail
    Created on : 22 de dez de 2024, 18:13:31
    Author     : leona
--%>

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
    <div id="caixa-login">
        <form action="" method="post">

            <input type="text" name="novaSenha" placeholder="Nova Senha">
    
            <input type="text" name="confirmaSenha" placeholder="Confirmação da Nova Senha">
    
    
            <input type="submit" value="Alterar">
        </form>
    </div>
    <%@include file="../footer.jsp" %>
</body>
</html>