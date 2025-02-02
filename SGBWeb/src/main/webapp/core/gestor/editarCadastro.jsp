<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %> 
<%@ page import="sgb.model.dto.PreCadastro" %> 
<%@ page import="sgb.model.dto.Cadastro" %> 

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <!--css-->
        <link rel="stylesheet" href="../../css/cadastroGestor.css">
        <link rel="stylesheet" href="../../css/styleBase.css">
    </head>
    <body>
        <%@include file="headerGestor.jsp" %>
        <section id="nome-pagina">
            <h2>EDITAR/BLOQUEAR CADASTROS</h2>
        </section>

        <div class="container">
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Matrícula</th>
                    <th>CPF</th>
                    <th>EDITAR</th>
                    <th>BLOQUEAR</th>
                </tr>
                <%
                    List<Cadastro> cadastros = ConexaoBD.consultarCadastro(null, null, null, null, null, null, null, null, null);

                    if (cadastros != null && !cadastros.isEmpty()) {
                        for (Cadastro cadastro : cadastros) {
                %>
                <tr>
                    <td><%= cadastro.getId()%></td>
                    <td><%= cadastro.getNome()%></td>
                    <td><%= cadastro.getEmail()%></td>
                    <td><%= cadastro.getMatricula()%></td>
                    <td><%= cadastro.getCpf()%></td>
                    <td><a href="editar.jsp?id=<%= cadastro.getId()%>" class="button" id="editar">Editar</a></td>
                    <td><a href="bloquear.jsp?id=<%= cadastro.getId()%>" class="button" id="bloquear">Bloquear</a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">Nenhum cadastro encontrado.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <%@include file="../footer.jsp" %>


    </body>
</html>