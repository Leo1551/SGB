<%-- 
    Document   : header
    Created on : 2 de fev. de 2025, 15:49:57
    Author     : usuario
--%>
<header>
    <div id="logo">
        <img src="../../images/logo.png">
        SGRU - Sistema de Gerenciamento dos Restaurantes Universit�rios
    </div>
    <nav>
        <ul>
            <li><a href="pagamentos.jsp">Voltar</a>
            <li><a href="perfilAluno.jsp?id=1">Seu perfil <img id="imgperfil" src="../../images/user.png"></a>
                <!-- MUDAR  -->
            <li><a href="../../index.jsp">Sair</a>
               <!-- quando criar o link, coloque essas linhas de c�digo-->
               <!-- if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp"); -->
        </ul>
    </nav>
</header>