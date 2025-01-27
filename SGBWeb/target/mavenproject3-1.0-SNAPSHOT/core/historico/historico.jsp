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
        <%@include file="../header.jsp" %>
        <section id="avisos">
            <strong>Saldo Atual:</strong> &nbsp R$ ${ String.format("%.2f", saldo)}
        </section>
        <section id="pageContent">
            <aside id="months-container">
            </aside>
            <main role="main" id="historicoMain">
                <div id="historico"></div>
            </main>
        </section>
        
        <%@include file="../footer.jsp"%>

        <script>
        var transacoesBrutas =${transacoes};
        var mesParam =${mes};
        </script>
        <script type="text/javascript" charset="ISO-8859-1"><%@include file="/js/historico.js"  %></script>
    </body>

</html>
