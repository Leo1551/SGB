<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Exemplo de JSTL</title>
</head>
<body>
    <h1>Valor a ser impresso</h1>
    
    <c:set var="valor" value="1" />
    
    <p>O valor é: <c:out value="${valor}" /></p>
</body>
</html>