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
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/cadastroGestor.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>
        <section id="nome-pagina">
            <h2>EDITAR CADASTROs</h2>
        </section>

        <div id="container">
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
                <tr>
                    <td>1</td>
                    <td>Nome1</td>
                    <td>teste@email.com</td>
                    <td>20231234567</td>
                    <td>10020030045</td>
                    <td><button>#</button></td>
                    <td><button>#</button></td>
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
                        <td><button href="" class="button">Editar</button></td>
                        <td><a href="" class="button">Bloquear</a></td>
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