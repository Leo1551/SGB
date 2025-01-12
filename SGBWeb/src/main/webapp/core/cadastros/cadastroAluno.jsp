<%--
    Document   : cadastroAluno
    Created on : 11 de jan. de 2025, 09:07:50
    Author     : izaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <!--css-->
        <%@include file="../css.jsp"%>
        <link rel="stylesheet" href="../../css/cadastroAluno.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>
        <h1>Pré-Cadastro</h1>
        <section id="nome-pagina">
            <h2>PRÉ CADASTRO</h2>
        </section>

        <form action="preCadastro" method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="metade parte-esquerda">
                    <div class="campo">
                        <label>Nome:</label>
                        <input placeholder="Digite seu nome completo" type="text" name="nome" required>
                    </div>

                    <div class="campo">
                        <label>Número de matrícula:</label>
                        <input placeholder="00000000000" type="number" name="numeroMatricula" required>
                    </div>

                    <div class="campo">
                        <label>CPF:</label>
                        <input placeholder="000.000.000-00" name="cpf" required>
                    </div>

                    <div class="campo">
                        <label>Foto 3x4:</label>
                        <div id="campo-foto">
                            <img id="previewImagem" src="3x4.jpeg" />
                            <label for="uploadArquivo" class="custom-file-upload">
                                ANEXAR ARQUIVO
                            </label>
                            <input id="uploadArquivo" type="file" onchange="carregarArquivo(event)"/>
                        </div>
                    </div>
                </div>

                <div class="metade parte-direita">
                    <div class="campo">
                        <label>Email:</label>
                        <input placeholder="Digite seu email" type="email" name="email" required>
                    </div>

                    <div class="campo">
                        <label for="senha">Senha:</label>
                        <input type="password" id="senha" oninput="verificarSenha()" oninput="validarSenha()"
                               placeholder="Digite sua senha">
                        <div id="requisitosSenha">
                            <p>Sua senha precisa ter:</p>
                            <ul>
                                <li id="oitoCaracteres" class="invalido">Pelo menos 8 caracteres</li>
                                <li id="contémNumero" class="invalido">Pelo menos um número</li>
                                <li id="contémMaiuscula" class="invalido">Pelo menos uma letra maiúscula</li>
                                <li id="contémCaractereEspecial" class="invalido">Pelo menos um caractere especial</li>
                            </ul>
                        </div>
                    </div>

                    <div class="campo">
                        <label>Confirmar senha:</label>
                        <input placeholder="Digite sua senha" id="confirmarSenha" oninput="validarSenha()" type="password">
                        <p id="senhaValida" class="invalido">As senhas devem ser iguais</p>
                    </div>

                    <button type="submit">ENVIAR</button>
                </div>
            </div>
        </form>
        <%@include file="../footer.jsp" %>
        
        <!--js-->
        <link rel="stylesheet" href="../../../js/cadastroAluno.js">
    </body>
</html>

