<%-- 
    Document   : envioEmail
    Created on : 20 de jan. de 2025, 08:14:34
    Author     : aluno
--%>

<%@page import="sgb.java.HashMD5"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="sgb.model.dao.SenhaDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Estamos atualizando sua senha, aguarde...</h1>
        
        
        
        <%
            ConectarDAO con = new ConectarDAO();
            Connection conexaoBD = con.conectar();
            
            PreparedStatement caixa = conexaoBD.prepareStatement("UPDATE cadastros SET senha= ? WHERE matricula = ?");
            caixa.setString(1, HashMD5.criptografar(request.getParameter("senha")));
            caixa.setString(2, request.getParameter("matricula"));
            caixa.executeUpdate();
            
            
            
            
            
            if (caixa.executeUpdate() > 0) 
                response.sendRedirect("login.jsp");
            else     
                response.sendRedirect("../erro.jsp");
            
            
        
        
        
        
        
        
        %>
        
        
        <p>Quando estiver pronto você será redirecionado para a tela inícial</p>
    </body>
</html>