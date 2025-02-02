<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Cadastro" %>
<%@ page import="sgb.model.dto.Funcionario" %>

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
            <h2>PERFIL - GESTOR</h2>
        </section>

        <div class="container">
            <%
                String idParam = request.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    int idFuncionario = Integer.parseInt(idParam);
                    String mensagem = "";

                    Funcionario funcionario = ConexaoBD.buscarFuncionario(idFuncionario);

                    String nome = funcionario.getNome();
                    String email = funcionario.getEmail();
                    String cpf = funcionario.getCpf();

            %>

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
                        <p>CPF:</p>
                        <div id="saldo"><%= cpf%></div>
                    </div>
                </div>
            </div>


            <%
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
