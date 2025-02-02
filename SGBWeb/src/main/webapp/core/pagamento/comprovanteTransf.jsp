<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*, java.text.SimpleDateFormat" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sgb.model.dao.ConectarDAO"%>

<%
    // Conexão com o banco
    ConectarDAO con = new ConectarDAO();
    Connection conexao = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // Pegando os dados da sessão e requisição
    String remetente = (String) session.getAttribute("nome");
    String valorRecarga = request.getParameter("recarga");
    String data = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
    String nomeDestinatario = null;
    String matriculaDestinatario = request.getParameter("matriculaDestino");
    String metodoPagamento = request.getParameter("metodoPagamento");

    try {
        // Abrindo conexão com o banco
        conexao = con.conectar();

        // Verifica se a matrícula do destinatário foi informada
        if (matriculaDestinatario != null && !matriculaDestinatario.trim().isEmpty()) {
            // Query para buscar o nome do destinatário com base na matrícula
            String sql = "SELECT nome FROM cadastros WHERE matricula = ?";
            pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, matriculaDestinatario);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Pegando o nome do banco de dados
                nomeDestinatario = rs.getString("nome");

                // Armazena o nome na sessão para ser usado no comprovante
                session.setAttribute("nomeDestinatario", nomeDestinatario);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Fechar conexões
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conexao != null) {
            conexao.close();
        }
    }
    // Remover "R$ " caso já venha formatado
    if (valorRecarga != null && valorRecarga.startsWith("R$")) {
        valorRecarga = valorRecarga.replace("R$", "").trim();
    }

    // Armazenando outros dados na sessão
    session.setAttribute("remetente", remetente);
    session.setAttribute("valor", valorRecarga);
    session.setAttribute("data", data);
%>

<html>
    <head>
        <title>Comprovante de Transação</title>
        <link rel="stylesheet" href="../../css/styleBase.css">
        <link rel="stylesheet" href="../../css/comprovante.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="centralizar">
            <h1>Comprovante de Transação</h1>
            <p><strong>Remetente:</strong> <%= remetente%></p>
            <p><strong>Destinatário:</strong> <%= nomeDestinatario != null ? nomeDestinatario : "Não encontrado"%>
            </p>
            <p><strong>Valor:</strong> R$ <%= valorRecarga%></p>
            <p><strong>Data:</strong> <%= data%></p>
            <br>
        </div>
        <a href="geraPdf.jsp?recarga=<%= valorRecarga%>&metodoPagamento=<%= metodoPagamento%>&matriculaDestinatario=<%= matriculaDestinatario%>" target="_blank">
            <button>Baixar PDF</button>
        </a>

        <%@include file="../footer.jsp" %>
    </body>
</html>
