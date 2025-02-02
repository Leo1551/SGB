<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Cadastro" %>
<%@ page import="sgb.model.dto.PreCadastro" %>
<%@ page import="java.io.IOException" %>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGRU</title>
        <!-- css -->
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/paginaInicial.css">
    </head>
    <body>
        <%@include file="headerGestor.jsp" %>

        <section id="nome-pagina">
            <h2>APROVAR PRE-CADASTRO</h2>
        </section>

        <div class="container">

            <%
                String idParam = request.getParameter("id");
                int id = Integer.parseInt(idParam);
                ConexaoBD.aprovarPreCadastro(id);
            %>
            
            <div class="opcao">
                <div class="sou">
                    <h2>
                        CADASTRO APROVADO COM SUCESSO
                    </h2>
                </div>
                <div class="login">
                    <a href="criarCadastro.jsp">Voltar</a>
                </div>
            </div>
        
        </div>

        <%@include file="../footer.jsp" %>
    </body>
</html>

</html>
