<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <%@include file="header.jsp"%>
        <section id="nome-pagina">
            <h2>PÁGINA INICIAL - FUNCIONARIO</h2>
        </section>

        <div class="container">
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        ENTRADA DO RU
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Faz o usuário passar o cartão na porta do RU.
                    </p>
                    <p>
                        Vê o saldo atual e informações sobre o usuário.
                    </p>
                </div>
                <div class="ir">
                    <a href="passarCartao.jsp">Ver cartão</a>
                </div>
            </div>
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        INSERIR CARDÁPIO
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Inserir os itens do cardápio do RU do mês atual.
                    </p>
                    <p>
                        Edita erros do cardápio e atualiza os itens.
                    </p>
                </div>
                <div class="ir">
                    <a href="../cardapio/addMenu.jsp">Inserir</a>
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