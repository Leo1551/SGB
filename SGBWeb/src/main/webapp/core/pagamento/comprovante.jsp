<%-- 
    Document   : comprovante
    Created on : 13 de jan. de 2025, 19:39:01
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Recarga efetuada com sucesso</h1>
        <% 
            request.getAttribute("recarga");
        %>
    </body>
</html>
