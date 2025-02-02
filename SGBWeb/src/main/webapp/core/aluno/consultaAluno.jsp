<%@ page import="java.io.*, java.util.*, jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Login" %>

<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SGRU</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/styleBase.css">
        <link rel="stylesheet" href="css/consultaAluno.css">
    </head>
    <body>
        <header>
                <div id="logo">
                    <img src="images/logo.png">
                    SGRU - Sistema de Gerenciamento dos Restaurantes Universitários
                </div>
        </header>

        <section id="nome-pagina">
            <h2>CADASTRO CONCLUIDO</h2>
        </section>

        <div class="container">
            <div class="opcao">
                <div class="titulo">
                    <h2>
                        <%= request.getAttribute("resultado") %>
                    </h2>
                </div>
                <div class="descricao">
                    <p>
                        Por favor, aguarde até que o gestor acadêmico aprove seu cadastro.
                    </p>
                </div>
                <div class="ir">
                    <a href="index.jsp">Sair</a>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

    </body>
</html>