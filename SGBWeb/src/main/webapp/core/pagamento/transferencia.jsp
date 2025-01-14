<%-- 
    Document   : transferencia
    Created on : 12 de jan. de 2025, 22:54:19
    Author     : Bruno
--%>
<%@ page import="sgb.model.dto.Saldo" %>
<%@ page import="sgb.model.dao.SaldoDAO" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% List<Saldo> saldos = (List<Saldo>) request.getAttribute("saldoInfos");
            if (saldos != null) {
                for (Saldo saldo : saldos) {
        %>    
        <form action="SaldoServlet" method="post">    
            <input type="hidden" name="matriculaOrigem" value="<%= saldo.getMatricula() %>"> <!-- Matrícula atual -->
            <label>Saldo Atual: <%= saldo.getSaldo() %></label>
            <br>
            <label for="matriculaDestino">Transferir para Matrícula:</label>
            <input type="text" name="matriculaDestino" placeholder="Nova Matrícula" required>
            <br>
            <label for="valorTransferencia">Valor a Transferir:</label>
            <input type="text" name="valorTransferencia" placeholder="Valor" required>
            <br>
            <input type="submit" value="Transferir Saldo">
        </form>    
        <%
            } 
        } else {
    %>
    <p>Nenhum saldo encontrado.</p>
    <% } %>
    </body>
</html>
