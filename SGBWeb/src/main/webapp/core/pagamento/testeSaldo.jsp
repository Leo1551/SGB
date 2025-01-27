<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sgb.model.dto.Saldo" %>
<%@ page import="sgb.model.dao.SaldoDAO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>User Saldo</title>
</head>
<body>
    <h1>User Saldo</h1>
    <% 
        List<Saldo> saldos = (List<Saldo>) request.getAttribute("saldoSessao");
        if (saldos != null) {
            for (Saldo saldo : saldos) {
    %>
    <form action="SaldoServlet" method="post">
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