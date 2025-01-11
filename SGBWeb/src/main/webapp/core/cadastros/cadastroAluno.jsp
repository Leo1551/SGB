<%-- 
    Document   : cadastroAluno
    Created on : 11 de jan. de 2025, 09:07:50
    Author     : izaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pré-Cadastro</title>
    </head>
    <body>
        <h1>Pré-Cadastro</h1>
        <form action="preCadastro" method="post" enctype="multipart/form-data">
            
            <label>Nome:</label>
            <input type="text" name="nome" required><br>
            
            <label>Senha:</label>
            <input type="password" name="senha" required><br>
            
            <label>Email:</label>
            <input type="email" name="email" required><br>
            
            <label>Matrícula:</label>
            <input type="number" name="matricula" required><br>
            
            <label>CPF:</label>
            <input type="text" name="cpf" required><br>
            
            <label>Foto:</label>
            <input type="file" name="foto" required><br><br>
            
            <button type="submit">Enviar</button>
        </form>
    </body>
</html>
