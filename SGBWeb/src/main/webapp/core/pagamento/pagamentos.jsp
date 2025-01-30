<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <%@include file="../sessao.jsp" %>
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
        <%
            String chavePix = "";
            try {
                ConectarDAO con = new ConectarDAO();
                Connection conexao = con.conectar();
                Double saldoSessao;

                // Buscar chavePix
                String sql = "SELECT chavePix FROM pixInstituicao";
                PreparedStatement stmt = conexao.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    chavePix = rs.getString("chavePix");
                }

                // Fechar recursos
                rs.close();
                stmt.close();
                conexao.close();

            } catch (Exception e) {
                e.printStackTrace();
                chavePix = "Erro ao buscar a chave PIX.";
            }
        %>
        
        
        <div class="container">
            <div class="metade parte-esquerda">
                <!--<form action="preCadastro" method="post" enctype="multipart/form-data">-->
                <form id="pagamentoForm" method="post">

                    <div class="campo">
                        <label>Valor da recarga:</label>
                        <input type="text" id="recarga" name="recarga" oninput="formatarMoeda(this)" placeholder="R$ 0,00"
                               required>
                    </div>

                </form>

                <div class="info">
                    <p>Status do cartão:</p>
                    <div id="status" class="ativo">ATIVO</div>
                </div>

                <div class="info">
                    <p>Saldo: R$ </p>
                    <div id="saldo">
                        <%=session.getAttribute("saldo")%>
                    </div>
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
                        <p>Chave pix (CNPJ): <%=chavePix%></p>
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
                            <input placeholder="000000" type="number" id="matriculaDesti" name="matriculaDesti">
                        </div>

                        <div class="info">
                            <p>Status do cartão:</p>
                            <div id="status" class="ativo">ATIVO</div>
                        </div>

                        <div class="info">
                            <p>Saldo:</p>
                            <div id="saldo">
                                <%= "R$" + saldo%>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" onclick="selec()">CONFIRMAR PAGAMENTO</button>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

        <script type="text/javascript"><%@include file="/js/pagamentos.js" %></script>
    </body>
</html>