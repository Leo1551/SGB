<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %> 
<%@ page import="sgb.model.dto.PreCadastro" %> 

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
        <%@include file="../header.jsp"%>
        <section id="nome-pagina">
            <h2>APROVAR PRÉ CADASTROs</h2>
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
                    <th>APROVAR</th>
                </tr>
                <%
                    List<PreCadastro> precadastros = ConexaoBD.consultarPreCadastro(null, null, null, null, null, null, null);

                    if (precadastros != null && !precadastros.isEmpty()) {
                        for (PreCadastro cadastro : precadastros) {
                %>
                <tr>
                    <td><%= cadastro.getId()%></td>
                    <td><%= cadastro.getNome()%></td>
                    <td><%= cadastro.getEmail()%></td>
                    <td><%= cadastro.getMatricula()%></td>
                    <td><%= cadastro.getCpf()%></td>
                    <td><a href="editar?id=<%= cadastro.getId()%>" class="button" id="editar">Editar</a></td>
                    <td><a href="aprovar?id=<%= cadastro.getId()%>" class="button" id="aprovar">Aprovar</a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">Nenhum pré-cadastro encontrado.</td>
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

