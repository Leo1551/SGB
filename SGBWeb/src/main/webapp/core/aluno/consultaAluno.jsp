<!-- consultaAluno.jsp -->>

<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="sgb.model.dto.Login" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="java.io.*, jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultando dados...</title>
    </head>
    <body>
        <h1>Aguarde enquanto verificamos os dados</h1>

        <%
            ConexaoBD c = new ConexaoBD();
            
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String email = request.getParameter("email");
            long matricula = Long.parseLong(request.getParameter("matricula"));
            String cpf = request.getParameter("cpf");
            
            // pegar o nome do arquivo da foto( " foto_[numero].png/jpeg " )
            Part arquivo = request.getPart("foto"); 
            String nomeArquivo = arquivo.getSubmittedFileName();

            String extensao = ".";
            
            if (nomeArquivo.endsWith(".png")) {
                extensao = ".png";
            } else if (nomeArquivo.endsWith(".jpeg") || nomeArquivo.endsWith(".jpg")) {
                extensao = ".jpeg";
            }
            
            String fotoNome = "foto_" + c.getProximoNumeroFoto() + extensao;
            
            String uploadDir = application.getRealPath("/core/images/uploads");
            String caminhoDestino = uploadDir + File.separator + fotoNome;
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                 dir.mkdirs();
            }

            arquivo.write(caminhoDestino);
            out.println("Arquivo enviado com sucesso: " + fotoNome);


        %>
        
        <!-- Imprime o resultado -->
        <%= c.inserirPreCadastro(nome, senha, fotoNome, email, matricula, cpf)  %>
        <img src="<%= request.getContextPath() %>/core/images/uploads/<%= fotoNome%>" alt="Foto" />

    </body>
</html>