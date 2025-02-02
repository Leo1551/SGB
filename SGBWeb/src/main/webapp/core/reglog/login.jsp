<%-- 
    Document   : Login
    Created on : 22 de dez de 2024, 16:46:52
    Author     : leona
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <%@include file="css.jsp"%>
        <title>SGC - Sistema de Gestão do Bandejão</title>
    </head>
    <body>

        <%
            String metodoLogin = request.getParameter("login");
            int index = Integer.parseInt(metodoLogin) - 1;
            String[] cargo = {"Aluno", "Gestor", "Caixa"};
        %>


        <header>
            <div id="logo">
                <img src="../../images/logo.png">
                SGRU - Sistema de Gerenciamento dos Restaurantes Universitários
            </div>
            <nav>
                <ul>
                    <li><a href="../aluno/cadastroAluno.jsp">Cadastrar-me</a>

                        <!-- quando criar o link, coloque essas linhas de código-->
                        <!-- if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp"); -->
                </ul>
            </nav>
        </header>


        <section id="nome-pagina">
            <h2>LOGIN - <%= cargo[index].toUpperCase()%>:</h2>
        </section>

        <div id="caixa-login">
            <h1>Sistema de Gestão do Bandejão - <%= cargo[index]%></h1>

            <form action="consultaMatricula.jsp?met=<%= metodoLogin%>" method="post">
                <input type="text" name="matricula" placeholder="Identificação">
                <!-- número de matricula-->
                <input type="password" name="senha" placeholder="Senha">
                <!--Senha-->

                <input type="submit" value="Entrar">
            </form>

            <a href="recEmail.jsp">Esqueci minha senha</a>
            <!--implementar site para recuperação de senha-->
        </div> 
                
                
                
        <% int erro = Integer.parseInt(request.getParameter("erro"));
                if (erro == 1) {%>
        <%=  "<center><div id='erro'> Sua carteirinha foi bloqueada!<br><br>Procure um gestor para resolver esse problema.</div> </center>"%>
        <% }%>

        <style>
            #erro {
                background-color: #f8d7da;  /* Cor de fundo vermelho claro para erro */
                color: #721c24;  /* Cor do texto (vermelho escuro) */
                border: 1px solid #f5c6cb;  /* Borda de cor mais clara, semelhante ao fundo */
                border-radius: 5px;  /* Bordas arredondadas */
                padding: 15px;  /* Espaçamento interno */
                margin: 20px auto;  /* Margem para afastar da parte superior e centralizar */
                width: 80%;  /* Largura de 80% da tela */
                max-width: 600px;  /* Largura máxima de 600px */
                font-size: 16px;  /* Tamanho da fonte */
                text-align: center;  /* Alinhar o texto ao centro */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);  /* Sombra suave */
            }

            /* Caso queira adicionar um ícone de erro (opcional) */
            #erro::before {
                content: "⚠️";  /* Ícone de alerta */
                margin-right: 10px;
                font-size: 20px;  /* Tamanho do ícone */
            }
        </style>
        <%@include file="../footer.jsp"%>

    </body>
</html>


