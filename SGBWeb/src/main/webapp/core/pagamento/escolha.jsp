<%-- 
    Document   : escolha
    Created on : 30 de dez. de 2024, 22:34:22
    Author     : Bruno
--%>
<%@ page import="sgb.model.dto.Saldo" %>
<%@ page import="sgb.model.dao.SaldoDAO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGC - Sistema de Gestão do Bandejão</title>
        <%@include file="../reglog/css.jsp"%>
        <%@include file="css.jsp"%>
        <script src="${pageContext.request.contextPath}/js/modal.js"></script>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <h1>Selecione o tipo de pagamento</h1>
        <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="${pageContext.request.contextPath}/SaldoServlet" method="get">
                <h2>Selecione o tipo de pagamento</h2>
                <div id="botoes">  
                    <div id="Bpix">
                        <button type="submit" class="botao-pagamento" name="tipoPagamento" value="PIX">PIX</button>
                    </div>
                    <div id="Bcartao">
                        <button type="submit" class="botao-pagamento" name="tipoPagamento" value="CARTÃO">CARTÃO</button>
                    </div>
                    <div id="Btransf">
                        <button type="submit" class="botao-pagamento" name="tipoPagamento" value="TRANSFERENCIA">TRANSFERÊNCIA</button>
                    </div>    
                </div>          
            </form>
        </div>
    </div>
        <%@include file="../footer.jsp"%>
    </body>
</html>