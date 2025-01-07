<%-- 
    Document   : consultaMatricula
    Created on : 6 de jan. de 2025, 07:30:17
    Author     : aluno
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="sgb.model.dto.Login" %>
<%@ page import="sgb.model.dao.LoginDAO" %>

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
                  
        if(LoginDAO.verificacaoLogin(new Login(matricula, senha)))
            response.sendRedirect("../principal/telaInicial.jsp");
        response.sendRedirect("login.jsp");
         
        %>
    </body>
</html>