<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Exemplo de JSTL</title>
</head>
<body>
    <h1>Lista de Nomes</h1>
    
    <c:set var="nomes" value="${['Alice', 'Bob', 'Carlos', 'Diana']}" />
    
    <ul>
        <c:forEach var="nome" items="${nomes}">
            <li>${nome}</li>
        </c:forEach>
    </ul>
</body>
</html>