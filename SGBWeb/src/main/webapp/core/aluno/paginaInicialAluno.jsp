

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    
    <%@include file="../sessao.jsp" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <!--css-->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/paginaInicial.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section id="nome-pagina">
            <h2>PÁGINA INICIAL - ALUNO</h2>
        </section>

        <div class="container">
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        CONSULTAR SALDO
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Ver o saldo atual do aluno.
                    </p>
                    <p>
                        Ver descrição detalhada das transações feitas pelo aluno no período de um ano.
                    </p>
                </div>
                <div class="ir">
                    <a href="../../historico">Ver saldo</a>
                </div>
            </div>
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        CONSULTAR CARDÁPIO
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Consultar o delicioso cardápio do restaurante para os próximos dias.
                    </p>
                    <p>
                        Procurar informações desse cardápio.
                    </p>
                </div>
                <div class="ir">
                    <a href="../cardapio/visualizarCardapio.jsp">Ver cardápio</a>
                </div>
            </div>
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        RECARREGAR CARTÃO
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Faz recarga de saldo para os usuários do RU.
                    </p>
                    <p>
                        Emite comprovante das recargas.
                    </p>
                </div>
                <div class="ir">
                    <a href="../pagamento/pagamentos.jsp">Recarregar</a>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

    </body>
</html>