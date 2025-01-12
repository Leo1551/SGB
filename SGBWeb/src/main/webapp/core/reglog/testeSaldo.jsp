<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import = "sgb.model.dto.Saldo"%>
<%@page import = "sgb.model.dao.SaldoDAO"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>User Saldo</title>
</head>
<body>
    <h1>User Saldo</h1>
    <% 
        List<Saldo> saldos = (List<Saldo>) request.getAttribute("saldos");
        if(saldos != null) {
            for(Saldo saldo : saldos) {
    %>
    <p>Matricula:<%= saldo.getId()%> Saldo: <%= saldo.getSaldo()%></p>
    <%
        } 
        } else {
    %>
    <p>Nenhum saldo encontrado.</p>
    <%}%>
</html>