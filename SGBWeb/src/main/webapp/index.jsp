<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGRU</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/styleBase.css">
        <link rel="stylesheet" href="css/paginaInicial.css">
    </head>
    <body>

        <%
            if (session != null) {
                session.invalidate();
                session = null;
            } // sempre que redirecionado à tela inícial, finaliza a sessão
%>
        <header>
                <div id="logo">
                    <img src="images/logo.png">
                    SGRU - Sistema de Gerenciamento dos Restaurantes Universitários
                </div>
        </header>

        <section id="nome-pagina">
            <h2>PÁGINA PRINCIPAL</h2>
        </section>

        <div class="container">
            <div class="opcao">
                <div class="sou">
                    <h2>
                        SOU ALUNO
                    </h2>
                </div>
                <div class="login">
                    <a href="core/reglog/login.jsp?login=1&erro=-1">Fazer login</a>
                </div>
            </div>
            <div class="opcao">
                <div class="sou">
                    <h2>
                        SOU GESTOR
                    </h2>
                </div>
                <div class="login">
                    <a href="core/reglog/login.jsp?login=2&erro=-1">Fazer login</a>
                </div>
            </div>
            <div class="opcao">
                <div class="sou">
                    <h2>
                        SOU FUNCIONARIO
                    </h2>
                </div>
                <div class="login">
                    <a href="core/reglog/login.jsp?login=3&erro=-1">Fazer login</a>
                </div>
            </div>
        </div>

        <%@include file="core/footer.jsp" %>
    </body>
</html>
