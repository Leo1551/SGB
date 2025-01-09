<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import = "sgb.model.dto.Saldo"%>
<%@page import = "sgb.model.dao.SaldoDAO"%>
<html>
<head>
    <title>User Saldo</title>
</head>
<body>
    <h1>User Saldo</h1>
    <%
        Saldo saldo = (Saldo) request.getAttribute("saldo");
        if (saldo != null) {
    %>
        <p>ID: <%= saldo.getId() %></p>
        <p>Saldo: <%= saldo.getSaldo() %></p>
    <%
        } else {
    %>
        <p>Nenhum ID ou usuario encontrado.</p>
    <%
        }
    %>
</body>
</html>