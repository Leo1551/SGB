<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Cadastro" %>

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
            <%
                Integer codigo = Integer.parseInt(request.getParameter("codigo"));
                List<Cadastro> cadastros = ConexaoBD.consultarCadastro(null, null, null, null, null, null, null, codigo, null);
                Cadastro cadastro = cadastros.get(0);
                int id = cadastro.getId();
                String nome = cadastro.getNome();
                long matricula = cadastro.getMatricula();
                String foto = cadastro.getFoto();

                double saldo = cadastro.getSaldo();
                boolean statusCartao = cadastro.getStatusCartao();
                double saldoNovo = saldo;
                double precoBandeco = 3.2;
                
                // esse aqui nao quer funcionar de jeito nenhum, MUDAR DEPOIS
                if (statusCartao) {
                    saldoNovo = saldo - precoBandeco;
                }
                
                ConexaoBD.atualizarCadastro(
                            id,
                            nome,
                            cadastro.getSenha(),
                            foto,
                            cadastro.getEmail(),
                            matricula,
                            cadastro.getCpf(),
                            codigo,
                            statusCartao,
                            saldoNovo
                    );

            %>
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
                    <img src="../../images/fotos/<%= foto%>">
                </div>
                <div class="info">
                    <p>Nome:</p>
                    <div id="nome"><%= nome%></div>
                    <br><br>
                    <p>Matrícula:</p>
                    <div id="numMatricula"><%= matricula%></div>
                </div>
                <div class="info">
                    <p>Status do cartão:</p>
                    <div id="statusCartao" class="ativo"><%= statusCartao %></div>
                    <br><br>
                    <p>Saldo atual:</p>
                    <div id="saldo"><%= saldoNovo %></div>
                </div>
            </div>


            <%@include file="../footer.jsp" %>

    </body>
</html>