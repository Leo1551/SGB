<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <!--css-->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/pagamentos.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>
        <section id="nome-pagina">
            <h2>PAGAMENTOS</h2>
        </section>

        <div class="container">
            <div class="metade parte-esquerda">
                <form action="preCadastro" method="post" enctype="multipart/form-data">
                    <div class="campo">
                        <label>Cartão:</label>
                        <input placeholder="000000" type="number" name="cartao" required>
                    </div>

                    <div class="campo">
                        <label>Valor da recarga:</label>
                        <input type="text" id="dinheiro" name="dinheiro" oninput="formatarMoeda(this)" placeholder="R$ 0,00"
                               required>
                    </div>
                </form>

                <div class="info">
                    <p>Status do cartão:</p>
                    <div id="status" class="ativo">ATIVO</div>
                </div>

                <div class="info">
                    <p>Saldo:</p>
                    <div id="saldo">R$ 12,50</div>
                </div>

            </div>

            <div class="metade parte-direita">
                <div class="botoes-container">
                    <button class="botao" onclick="mostrarOpcao('pix')">PIX</button>
                    <button class="botao" onclick="mostrarOpcao('cartao')">Cartão</button>
                    <button class="botao" onclick="mostrarOpcao('transferencia')">Transferência</button>
                </div>
                <div>
                    <div id="pix" class="opcao">
                        <h2>Pagamento via PIX</h2>
                        <p>Chave pix (CNPJ): xxxxxxxxxxx</p>
                        <button>Gerar código PIX</button>
                    </div>

                    <div id="cartao" class="opcao">
                        <h2>Pagamento via Cartão</h2>
                        <p>Insira os dados do cartão para realizar o pagamento.</p>
                        <label>Nome do titular:</label>
                        <input type="text" id="nome-titular" name="nome-titular" placeholder="Nome completo">

                        <label>Número do cartão:</label>
                        <input type="text" id="num-cartao" name="num-cartao" placeholder="0000 0000 0000 0000">

                        <div class="linha-cartao">
                            <div>
                                <label>Validade do cartão:</label>
                                <input type="text" id="validade-cartao" name="num-cartao" placeholder="mm/aa">
                            </div>
                            <div>
                                <label>Código de segurança:</label>
                                <input type="text" id="seguranca-cartao" name="num-cartao" placeholder="000">
                            </div>
                        </div>
                    </div>

                    <div id="transferencia" class="opcao">
                        <h2>Pagamento via Transferência</h2>
                        <p>Transfira o valor para a conta informada abaixo.</p>

                        <div class="campo">
                            <label>Cartão:</label>
                            <input placeholder="000000" type="number">
                        </div>

                        <div class="info">
                            <p>Status do cartão:</p>
                            <div id="status" class="ativo">ATIVO</div>
                        </div>

                        <div class="info">
                            <p>Saldo:</p>
                            <div id="saldo">R$ 12,50</div>
                        </div>
                    </div>
                </div>
                <button>CONFIRMAR PAGAMENTO</button>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

        <script type="text/javascript"><%@include file="/js/pagamentos.js" %></script>
    </body>
</html>