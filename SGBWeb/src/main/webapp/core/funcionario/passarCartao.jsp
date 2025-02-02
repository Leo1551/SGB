<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>

        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/passarCartao.css">

    </head>
    <body>
        <%@include file="header.jsp"%>
        <section id="nome-pagina">
            <h2>ENTRADA DO RU</h2>
        </section>

        <div class="container">

            <div class="metade cima">
                <div class="info">
                    <p>Operador(a):</p>
                    <div id="operador">Nome da pessoa</div>
                </div>
                <form action="preCadastro" method="post" enctype="multipart/form-data">
                    <div class="campo">
                        <label>Cartão:</label>
                        <input placeholder="000000" type="number" name="cartao" required>
                    </div>
                </form>
            </div>

            <div class="metade baixo">
                <div class="info">
                    <p>Foto:</p>
                    <br>
                    <img src="../../images/fotos/foto_0.jpg">
                </div>
                <div class="info">
                    <p>Nome:</p>
                    <div id="nome">Nome</div>
                    <br><br>
                    <p>Matrícula:</p>
                    <div id="numMatricula">00000000000</div>
                </div>
                <div class="info">
                    <p>Status do cartão:</p>
                    <div id="statusCartao" class="ativo">ATIVO/INATIVO</div>
                    <br><br>
                    <p>Saldo:</p>
                    <div id="saldo">R$ 000,00</div>
                </div>
            </div>


            <%@include file="../footer.jsp" %>

    </body>
</html>