<%-- 
    Document   : inicio
    Created on : 27 de dez de 2024, 00:51:16
    Author     : leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../css/styleBase.css"/>
        <title>SGC - Sistema de Gestão do Bandejão</title>
    </head>
    <body>
        <%@include file="../header.jsp"%>
        
        
        
        
        <!-- adicionem as partes referentes ao que lhe interessam para a tela inícial aqui-->
        <%= matricula + senha%>
        <form action="../pagamento/escolha.jsp" method="post">
            <input type="hidden" name="matricula" value="<%= matricula %>"/>
            <input type="submit" value="Realizar recarga"/>
        </form>
        <%@include file="../footer.jsp"%>
    </body>
</html>
