<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../css/styleBase.css" />
    <link rel="stylesheet" href="../../css/desbloqueio.css" />
    <title>SGC - Sistema de Gestão do Bandejão</title>
  </head>
  <body>
    <%@include file="../header.jsp" %>

    <div id="caixa-login">
      <h1>Desbloqueio de cartão</h1>

      <form action="" method="post">
        <input type="number" name="" id="" placeholder="Código do cartão" />
        <input type="text" name="" id="" placeholder="Senha" />
        <input type="submit" value="Desbloquear cartão" />
      </form>
    </div>
    <%@include file="../footer.jsp"%>
  </body>
</html>