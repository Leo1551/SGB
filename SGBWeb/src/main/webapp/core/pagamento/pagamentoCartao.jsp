<%@page import="java.util.Locale.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;

        String matriculaSessaoStr = (String) session.getAttribute("matricula");
        String valorRecargaStr = (String) request.getParameter("recarga");
        String nomeTitular = request.getParameter("nomeTitular");
        String numCartao = request.getParameter("numCartao");
        String valCartao = request.getParameter("valCartao");
        String cvv = request.getParameter("cvv");

        String[] semFormatacao = valorRecargaStr.split(" ");

        if (matriculaSessaoStr == null || valorRecargaStr == null) {
            response.getWriter().println("Erro: Matricula ou valor de recarga nao fornecidos.");
            return;
        }
        
        double valorRecarga;
        try {
            valorRecarga = Double.parseDouble(semFormatacao[1]);
        } catch (NumberFormatException e) {
            response.getWriter().println("Erro: Valor de recarga inválido.");
            return;
        }

        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados");
            }

            // Atualiza o saldo
            String sql = "SELECT saldo FROM cadastros WHERE matricula = ?";
            pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, matriculaSessaoStr);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                double saldoSessao = rs.getDouble("saldo");

                String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
                pstmt = conexao.prepareStatement(updateSql);
                pstmt.setDouble(1, valorRecarga);
                pstmt.setString(2, matriculaSessaoStr);
                pstmt.executeUpdate();

                response.getWriter().println("Recarga realizada com sucesso! Novo saldo: " + (saldoSessao + valorRecarga));

                // Insere os dados na tabela cartoes
                String insertSql = "INSERT INTO cartoes (nomeTitular, numCartao, valCartao, cvv, saldo) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conexao.prepareStatement(insertSql);
                pstmt.setString(1, matriculaSessaoStr);
                pstmt.setString(2, nomeTitular);
                pstmt.setString(3, numCartao);
                pstmt.setString(4, valCartao);
                pstmt.setString(5, cvv);
                pstmt.setDouble(6, valorRecarga);
                pstmt.executeUpdate();

                response.getWriter().println("Dados do cartão armazenados com sucesso.");
            } else {
                response.getWriter().println("Erro: Matrícula não encontrada.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erro: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
        response.sendRedirect("comprovante.jsp");
        %>
    </body>
</html>