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
            if (session != null) {
                session.invalidate();
                session = null;
            } // sempre que redirecionado à tela inícial, finaliza a sessão

        %>


        <header>
            <div id="logo">
                <img src="../../images/logo.png">
                SGRU - Sistema de Gerenciamento dos Restaurantes Universitários
            </div>
            <nav>
                <ul>
                    <li><a href="../aluno/cadastroAluno.jsp">Cadastro</a>
                    
                        <!-- quando criar o link, coloque essas linhas de código-->
                        <!-- if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp"); -->
                </ul>
            </nav>
        </header>


        <section id="nome-pagina">
            <h2>LOGIN - ALUNO</h2>
        </section>

        <div id="caixa-login">
            <h1>Sistema de Gestão do Bandejão - Aluno</h1>

            <form action="consultaMatricula.jsp" method="post">
                <input type="text" name="matricula" placeholder="Número de matricula">
                <!-- número de matricula-->
                <input type="password" name="senha" placeholder="Senha">
                <!--Senha-->

                <input type="submit" value="Entrar">
            </form>

            <a href="recEmail.jsp">Esqueci minha senha</a>
            <!--implementar site para recuperação de senha-->
        </div> 




        <%@include file="../footer.jsp"%>
        
    </body>
</html>


