<%@page contentType="text/html" pageEncoding="ISO-8859-1" buffer="16kb"%>
<!doctype htm/l/>
<html lang="en" class="no-js">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="canonical" href="https://html5-templates.com/" />
    <title>SGRU</title>
    <meta name="description" content="Simple HTML5 Page layout template with header, footer, sidebar etc.">
    <style><%@include file="/css/styleBase.css"%></style>
    <style><%@include file="/css/historico.css"%></style>
</head>

<body>
	<header>
		<div id="logo"><img src="./images/logo.png">SGRU - Sistema de Gerenciamento dos Restaurantes Universit�rios</div>
		<nav>  
			<ul>
				<li><a href="">Voltar</a>
				<li><a href="">Seu perfil <img id="imgperfil" src="./images/user.png"></a>
			</ul>
		</nav>
	</header>
	<section id="avisos">
	</section>
    <h1>
        ${test}
    </h1>
	<section id="pageContent">
		<aside id="months-container">
		</aside>
		<main role="main" id="historicoMain">
			<div id="historico"></div>
		</main>
	</section>
	<footer>
		<p>SIGAA | Diretoria de Tecnologia da Informa��o - DTI - (31) 3319-7000 | Copyright � 2006-2024 - UFRN - vm-sig-app-08.ditic.sgi.cefetmg.br.inst8 - v4.12.14cefet154</p>
	</footer>

    <script>
        var transacoesBrutas=${transacoes};
        var mesParam=${mes};
    </script>
    <script type="text/javascript" charset="ISO-8859-1"><%@include file="/js/historico.js"  %></script>
</body>

</html>
