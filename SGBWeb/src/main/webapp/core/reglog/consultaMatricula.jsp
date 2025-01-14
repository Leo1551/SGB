<%-- 
    Document   : consultaMatricula
    Created on : 6 de jan. de 2025, 07:30:17
    Author     : aluno
--%>

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
        
            if(LoginDAO.verificacaoLogin(new Login(matricula, senha))){
                
                HttpSession sessao = request.getSession(true); // se não houver sessão, cria
                //passagem de params para a página inícial
                sessao.setAttribute("matricula", matricula);
                sessao.setAttribute("senha", senha);
                
                
                response.sendRedirect("../principal/telaInicial.jsp");
            }
            else
                response.sendRedirect("login.jsp");
      
        %>

  
    </body>
</html>
//0910lopess123%#*