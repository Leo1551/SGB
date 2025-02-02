<%-- 
    Document   : comprovanteCartao
    Created on : 2 de fev. de 2025, 17:40:01
    Author     : usuario
--%>
<%-- 
    Document   : comprovante
    Created on : 13 de jan. de 2025, 19:39:01
    Author     : usuario
--%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*, java.text.SimpleDateFormat" %>
<%@page import="java.sql.Connection"%>
<%

    String remetente = (String) session.getAttribute("nome");
    String valorRecarga = (String) request.getParameter("recarga");
    String data = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
    String instituto = "Centro Federal de Educação Tecnológica";
    String metodoPagamento = request.getParameter("metodoPagamento");

    session.setAttribute("remetente", remetente);
    session.setAttribute("valor", valorRecarga);
    session.setAttribute("data", data);
%>

<html>
    <head>
        <title>Comprovante de Transação</title>
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/comprovante.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="centralizar">
            <h1>Comprovante de Transação</h1>
            <p><strong>Remetente:</strong> <%= remetente%></p>
            <p><strong>Destinatário:</strong> <%= instituto%></p>
            <p><strong>Valor:</strong><%=valorRecarga%></p>
            <p><strong>Data:</strong> <%= data%></p>
            <br>
            <div>    
                <a href="geraPdf.jsp?recarga=<%= valorRecarga%>&metodoPagamento=<%= metodoPagamento%>" target="_blank">
                    <button>Baixar PDF</button>
                </a>
                <%@include file="../footer.jsp" %>
                </body>
                </html>



