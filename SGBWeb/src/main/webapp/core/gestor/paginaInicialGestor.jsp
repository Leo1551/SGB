<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
            if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp");
        // OK meus putos, o negócio é o seguinte, a variável :session: foi settada em reglog/consultaMatricula.jsp
        // O ponto para vocês é: qualquer coisa que deve ser alterada na sessão está na variável :session:
        
        //Implicitamente, as páginas usam a variável :session: para se referirem ao objeto HTTPSession implicitamente
        
        String matricula = (String) session.getAttribute("matricula");
        String senha = (String) session.getAttribute("senha");
        
        //antes de tudo, passem pela tela de login
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <!--css-->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/paginaInicial.css">
    </head>
    <body>
        <%@include file="headerGestor.jsp"%>
        <section id="nome-pagina">
            <h2>PÁGINA INICIAL - GESTOR</h2>
        </section>

        <div class="container">
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        CRIAR CADASTROS
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Criar cadastros com base nos pré cadastros feitos pelos alunos.
                    </p>
                    <p>
                        Editar dados antes de aprovar.
                    </p>
                </div>
                <div class="ir">
                    <a href="criarCadastro.jsp">Criar</a>
                </div>
            </div>
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        EDITAR CADASTROS
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Editar nome, número de matrícula, cpf, email e foto.
                    </p>
                    <p>
                        Bloquear/desbloquear cartão em caso de perda.
                    </p>
                </div>
                <div class="ir">
                    <a href="editarCadastro.jsp">Editar</a>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

    </body>
</html>