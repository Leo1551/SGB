<%-- 
    Document   : escolha
    Created on : 30 de dez. de 2024, 22:34:22
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC - Sistema de Gestão do Bandejão</title>
        <%@include file="../reglog/css.jsp"%>
        <%@include file="css.jsp"%>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <h1>Selecione o tipo de pagamento</h1>
        <div id="botoes">  
                <button id="cartaoB">PIX</button>
                <button id="cartaoB">CARTÃO</button>
        </div>
        <%@include file="../footer.jsp"%>
    </body>
</html>
