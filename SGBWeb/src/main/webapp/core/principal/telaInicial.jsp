<%-- 
    Document   : inicio
    Created on : 27 de dez de 2024, 00:51:16
    Author     : leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../css/styleBase.css"/>
        <title>SGC - Sistema de Gestão do Bandejão</title>
    </head>
    <body>
        <%@include file="../header.jsp"%>
        
        <%
            if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp");
        // OK meus putos, o negócio é o seguinte, a variável :session: foi settada em reglog/consultaMatricula.jsp
        // O ponto para vocês é: qualquer coisa que deve ser alterada na sessão está na variável :session:
        
        //Implicitamente, as páginas usam a variável :session: para se referirem ao objeto HTTPSession implicitamente
        
        String matricula = (String) session.getAttribute("matricula");
        String senha = (String) session.getAttribute("senha");
        
        //antes de tudo, passem pela tela de login
        %>
        
        
        <!-- adicionem as partes referentes ao que lhe interessam para a tela inícial aqui-->
        <%= matricula + senha%>
        <%@include file="../footer.jsp"%>
    </body>
</html>
