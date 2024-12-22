<%-- 
    Document   : recSenha
    Created on : 22 de dez de 2024, 18:17:02
    Author     : leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>SGC - Sistema de Gestão do Bandejão</title>
    <link rel="stylesheet" href="/Style/styleBase.css">
    <link rel="stylesheet" href="form.css">
</head>
<body>
    <%@include file="../header.jsp" %>
    <div id="caixa-login">
        <h1>Sistema de Gestão do Bandejão</h1>

        <form action="" method="post">
            <input type="text" name="id" placeholder="Número de matricula">
            <!-- número de matricula-->
            <input type="submit" value="Enviar Email de Recuperação">
        </form>


    </div>

    <%@include file="../footer.jsp" %>
</body>
</html>