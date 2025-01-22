<!-- consultaAluno.jsp -->>

<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="sgb.model.dto.Login" %>
<%@ page import="sgb.java.ConexaoBD" %>
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
         String nome = request.getParameter("nome");
         String senha = request.getParameter("senha");
         String foto = "foto_21.png";
         String email = request.getParameter("email");
         long matricula = 12345678901L;
         String cpf = request.getParameter("cpf");
         
ConexaoBD c = new ConexaoBD();
        %>
        <%= c.inserirPreCadastro(nome, senha, foto, email, matricula, cpf) %>

    </body>
</html>
