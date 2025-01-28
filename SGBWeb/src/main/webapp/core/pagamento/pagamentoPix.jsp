<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%
    ConectarDAO con = new ConectarDAO();
    Connection conexao = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String matriculaSessaoStr = (String) session.getAttribute("matricula");
    String valorRecargaStr = request.getParameter("recarga");

    if (matriculaSessaoStr == null || valorRecargaStr == null) {
        response.getWriter().println("Erro: Matrícula ou valor de recarga não fornecidos.");
        return;
    }

    double valorRecarga;
    try {
    
        valorRecargaStr = valorRecargaStr.replace("R$", "").replace(",", ".").trim();
        valorRecarga = Double.parseDouble(valorRecargaStr);
    } catch (NumberFormatException e) {
        response.getWriter().println("Erro: Valor de recarga inválido.");
        return;
    }

    try {
        conexao = con.conectar();
        if (conexao == null) {
            throw new SQLException("Falha ao conectar ao banco de dados");
        }

    
        String sql = "SELECT saldo FROM cadastros WHERE matricula = ?";
        pstmt = conexao.prepareStatement(sql);
        pstmt.setString(1, matriculaSessaoStr);
        rs = pstmt.executeQuery();

        if (rs.next()) {

        
            String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
            pstmt = conexao.prepareStatement(updateSql);
            pstmt.setDouble(1, valorRecarga);
            pstmt.setString(2, matriculaSessaoStr);
            pstmt.executeUpdate();
        } else {
            throw new SQLException("Usuário não encontrado.");
        }

    
        sql = "SELECT saldo FROM pixInstituicao WHERE id = 1";
        pstmt = conexao.prepareStatement(sql);
        rs = pstmt.executeQuery();

        if (rs.next()) {
        
            String updateSql = "UPDATE pixInstituicao SET saldo = saldo + ? WHERE id = 1";
            pstmt = conexao.prepareStatement(updateSql);
            pstmt.setDouble(1, valorRecarga);
            pstmt.executeUpdate();
        } else {
            throw new SQLException("Instituição não encontrada.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Erro: " + e.getMessage());
        return;
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
