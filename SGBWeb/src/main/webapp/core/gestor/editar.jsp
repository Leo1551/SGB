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
        <!-- css -->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/editarBloquear.css">
    </head>
    <body>
        <%@include file="headerGestor.jsp" %>

        <section id="nome-pagina">
            <h2>EDITAR CADASTRO</h2>
        </section>

        <div class="container">
            <%
                String idParam = request.getParameter("id");
                String mensagem = "";

                if (request.getMethod().equalsIgnoreCase("POST")) {
                    try {
                        Integer id = Integer.parseInt(request.getParameter("id"));
                        String novoNome = request.getParameter("novoNome");
                        String novoEmail = request.getParameter("novoEmail");
                        String novaMatricula = request.getParameter("novaMatricula");
                        String novoCpf = request.getParameter("novoCpf");

                        List<Cadastro> cadastros = ConexaoBD.consultarCadastro(id, null, null, null, null, null, null, null, null);
                        if (cadastros != null && !cadastros.isEmpty()) {
                            Cadastro cadastro = cadastros.get(0);

                            String nomeFinal = (novoNome == null || novoNome.isEmpty()) ? cadastro.getNome() : novoNome;
                            String emailFinal = (novoEmail == null || novoEmail.isEmpty()) ? cadastro.getEmail() : novoEmail;
                            long matriculaFinal = (novaMatricula == null || novaMatricula.isEmpty()) ? cadastro.getMatricula() : Long.parseLong(novaMatricula);
                            String cpfFinal = (novoCpf == null || novoCpf.isEmpty()) ? cadastro.getCpf() : novoCpf;

                            ConexaoBD.atualizarCadastro(
                                    id,
                                    nomeFinal,
                                    cadastro.getSenha(),
                                    cadastro.getFoto(),
                                    emailFinal,
                                    matriculaFinal,
                                    cpfFinal,
                                    cadastro.getCodigoCartao(),
                                    cadastro.getStatusCartao()
                            );

                            mensagem = "Cadastro atualizado com sucesso!";
                        } else {
                            mensagem = "Cadastro não encontrado.";
                        }
                    } catch (Exception e) {
                        mensagem = "Erro ao processar a solicitação: " + e.getMessage();
                    }
                }

                // Exibe os dados do cadastro para edição
                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        Integer id = Integer.parseInt(idParam);

                        // Consulta os dados do cadastro
                        List<Cadastro> cadastros = ConexaoBD.consultarCadastro(id, null, null, null, null, null, null, null, null);

                        if (cadastros != null && !cadastros.isEmpty()) {
                            Cadastro cadastro = cadastros.get(0);

                            String nome = cadastro.getNome();
                            String email = cadastro.getEmail();
                            long matricula = cadastro.getMatricula();
                            String cpf = cadastro.getCpf();
                            String foto = cadastro.getFoto();
            %>

            <div class="divisao">
                <img id="foto" src="<%= foto%>" alt="Foto do usuário">
                <p><%= mensagem%></p>
            </div>
            <div class="divisao">
                <div class="subdivisoes">
                    <div class="info">
                        <p>Nome:</p>
                        <div id="saldo"><%= nome%></div>
                    </div>
                </div>
                <div class="subdivisoes">
                    <div class="info">
                        <p>Email:</p>
                        <div id="saldo"><%= email%></div>
                    </div>
                </div>
                <div class="subdivisoes">
                    <div class="info">
                        <p>Matrícula:</p>
                        <div id="saldo"><%= matricula%></div>
                    </div>
                </div>
                <div class="subdivisoes">
                    <div class="info">
                        <p>CPF:</p>
                        <div id="saldo"><%= cpf%></div>
                    </div>
                </div>
                <div class="subdivisoes">
                    <div class="botao" id="hidden">
                        <button type="submit">Salvar</button>
                    </div>
                </div>
            </div>

            <div class="divisao">
                <form method="POST" action="editar.jsp?id=<%=id%>">
                    <input type="hidden" name="id" value="<%= id%>">

                    <div class="subdivisoes">
                        <div class="campo">
                            <label>Novo nome:</label>
                            <input type="text" name="novoNome" placeholder="<%= nome%>">
                        </div>
                    </div>
                    <div class="subdivisoes">
                        <div class="campo">
                            <label>Novo email:</label>
                            <input type="email" name="novoEmail" placeholder="<%= email%>">
                        </div>
                    </div>
                    <div class="subdivisoes">
                        <div class="campo">
                            <label>Nova matrícula:</label>
                            <input type="text" name="novaMatricula" placeholder="<%= matricula%>">
                        </div>
                    </div>
                    <div class="subdivisoes">
                        <div class="campo">
                            <label>Novo CPF:</label>
                            <input type="text" name="novoCpf" placeholder="<%= cpf%>">
                        </div>
                    </div>
                    <div class="subdivisoes">
                        <div class="botao">
                            <button type="submit">Salvar</button>
                        </div>
                    </div>
                </form>
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
