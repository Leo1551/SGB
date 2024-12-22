<%-- 
    Document   : registro
    Created on : 22 de dez de 2024, 18:19:54
    Author     : leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> SCG - Sistema de Gestão do Bandejão</title>
    <link rel="stylesheet" href="/Style/styleBase.css">
    <link rel="stylesheet" href="form.css">
</head>
<body>
    
    <div id="caixa-login">
        <h1>Sistema de Gestão do Bandejão</h1>

        <form action="" method="post">
            <input type="text" name="nome"  placeholder="Nome ">
            <!--Nome do aluno-->
            <input type="text" name="id"  placeholder="Número de matricula">
            <!-- número de matricula-->
            <input type="password" name="senha"  placeholder="Senha de registro">
            <!--Senha de registro-->

            <input type="email" name="email" placeholder="Email de recuperação">
            <!--Email-->
            
          
            <input type="submit" value="Registrar">
        </form>

    </div>

</body>
</html>