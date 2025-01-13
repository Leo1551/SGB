<%-- 
    Document   : escolha
    Created on : 30 de dez. de 2024, 22:34:22
    Author     : Bruno
--%>
<%@ page import="sgb.model.dto.Saldo" %>
<%@ page import="sgb.model.dao.SaldoDAO" %>
<%@page import="java.util.List" %>
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
                            <form action="${pageContext.request.contextPath}/SaldoServlet" method="get">
            <div id="botoes">  
                <button type="submit" class="botao-pagamento" name="tipoPagamento" value="PIX">PIX</button>
                <button type="submit" class="botao-pagamento" name="tipoPagamento" value="CARTÃO">CARTÃO</button>
            </div>          
        </form>
        <%@include file="../footer.jsp"%>
    </body>
</html>