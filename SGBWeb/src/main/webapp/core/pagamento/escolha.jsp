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
        <script> var pageContext = {
                    request: 
                    {
                        contextPath: '<%= request.getContextPath()%>'
                    }
                };
        </script>
        <script src="${pageContext.request.contextPath}/js/modal.js"></script>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <h1>Selecione o tipo de pagamento</h1>
        <div class="botoes">
            <!-- Botões para abrir o modal -->
            <button onclick="openModal('PIX')">PIX</button>
            <button onclick="openModal('CARTAO')">CARTÃO</button>
            <button onclick="openModal('TRANSFERÊNCIA')">TRANSFERÊNCIA</button>
        </div>

        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2 id="modal-title"></h2>
                <div id="modal-content"></div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>
    </body>
</html>