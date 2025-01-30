<!-- consultaAluno.jsp -->

<%@ page import="java.io.*, java.util.*, jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Login" %>

<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultando dados...</title>
    </head>
    <body>
        <h1>Aguarde enquanto verificamos os dados</h1>

        <p><%= request.getAttribute("resultado") %></p>

        <c:if test="${not empty fotoNome}">
            <img src="<%= request.getContextPath() %>/core/images/uploads/${fotoNome}" alt="Foto do Aluno" />
        </c:if>


</body>
</html>