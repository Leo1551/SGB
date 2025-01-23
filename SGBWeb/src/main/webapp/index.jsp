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
        <header>
            <div id="logo">
                <img src="images/logo.png">
                SGRU - Sistema de Gerenciamento dos Restaurantes Universitários
            </div>
            <nav>
                <ul>
                    <li><a href="../reglog/login.jsp">Voltar</a>
                    <li><a href="">Seu perfil <img id="imgperfil" src="images/user.png"></a>
                </ul>
            </nav>
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
                    <a href="core/reglog/login.jsp">Fazer login</a>
                </div>
            </div>
            <div class="opcao">
                <div class="sou">
                    <h2>
                        SOU GESTOR
                    </h2>
                </div>
                <div class="login">
                    <a href="core/reglog/login.jsp">Fazer login</a>
                </div>
            </div>
            <div class="opcao">
                <div class="sou">
                    <h2>
                        SOU FUNCIONARIO
                    </h2>
                </div>
                <div class="login">
                    <a href="core/reglog/login.jsp">Fazer login</a>
                </div>
            </div>
        </div>

        <%@include file="core/footer.jsp" %>
    </body>
</html>
