<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Cadastro" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGRU</title>
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/cadastroGestor.css">
        <link rel="stylesheet" href="../../css/editarBloquear.css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <section id="nome-pagina">
            <h2>EDITAR CADASTRO</h2>
        </section>

        <div class="container">
            <%
                String idParam = request.getParameter("id");
                String mensagem = "";

                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        Integer id = Integer.parseInt(idParam);

                        List<Cadastro> cadastros = ConexaoBD.consultarCadastro(id, null, null, null, null, null, null, null, null);

                        if (cadastros != null && !cadastros.isEmpty()) {
                            Cadastro cadastro = cadastros.get(0);

                            String nome = cadastro.getNome();
                            String email = cadastro.getEmail();
                            long matricula = cadastro.getMatricula();
                            String cpf = cadastro.getCpf();
                            String foto = cadastro.getFoto();
                            int codigoCartao = cadastro.getCodigoCartao();
                            Boolean statusCartao = cadastro.getStatusCartao();
            %>

            <div class="divisao">
                <img id="foto" src="../../images/fotos/<%= foto %>" alt="Foto do Aluno" />
                <br><p><%= foto %></p>
            </div>
            
            <div class="divisao">
                    <div class="subdivisoes">
                        <div class="info">
                            <p>Nome:</p>
                            <div id="saldo"><%= nome%></div>
                        </div>
                    </div><br><br>
                    <div class="subdivisoes">
                        <div class="info">
                            <p>Email:</p>
                            <div id="saldo"><%= email%></div>
                        </div>
                    </div><br><br>
                    <div class="subdivisoes">
                        <div class="info">
                            <p>Matrícula:</p>
                            <div id="saldo"><%= matricula%></div>
                        </div>
                    </div>
            </div>

            <div class="divisao">
                    <div class="subdivisoes">
                        <div class="info">
                            <p>CPF:</p>
                            <div id="saldo"><%= cpf%></div>
                        </div>
                    </div><br><br>
                    <div class="subdivisoes">
                        <div class="info">
                            <p>Código do cartão:</p>
                            <div id="saldo"><%= codigoCartao%></div>
                        </div>
                    </div><br><br>
                    <div class="subdivisoes">
                        <div class="info">
                            <p>Status do cartão:</p>
                            <% if (statusCartao){
                            %>
                            <div id="saldo" class="ativo">Ativo</div>
                            <% } else {
                            %>
                            <div id="saldo" class="inativo">Inativo</div>
                            <% }
                            %>
                        </div>
                    </div>
            </div>

            <%
            } else {
            %>
            <p>Nenhum cadastro encontrado com o ID informado.</p>
            <%
                }
            } catch (NumberFormatException e) {
            %>
            <p>Erro: ID inválido. Certifique-se de que é um número válido.</p>
            <%
                }
            } else {
            %>
            <p>Por favor, informe um ID válido.</p>
            <%
                }
            %>
        </div>

        <%@include file="../footer.jsp" %>
    </body>
</html>
