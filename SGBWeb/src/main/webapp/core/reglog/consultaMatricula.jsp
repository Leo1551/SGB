<%-- 
    Document   : consultaMatricula
    Created on : 6 de jan. de 2025, 07:30:17
    Author     : aluno
--%>

<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="sgb.model.dto.Login" %>
<%@ page import="sgb.model.dao.LoginDAO" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultando dados...</title>
    </head>
    <body>
        <h1>Aguarde enquanto verificamos os dados</h1>
        
        <%
         String matricula = request.getParameter("matricula");
         String senha = request.getParameter("senha");
        /*
        if()
            response.sendRedirect("../principal/telaInicial.jsp");
        else
            response.sendRedirect("login.jsp");
        */
        %>

        <%= LoginDAO.verificacaoLogin(new Login(matricula, senha)) %>

    </body>
</html>
