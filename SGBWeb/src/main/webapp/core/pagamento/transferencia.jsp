<%-- 
    Document   : transferencia
    Created on : 12 de jan. de 2025, 22:54:19
    Author     : Bruno
--%>
<%@ page import="sgb.model.dto.Saldo" %>
<%@ page import="sgb.model.dao.ConectarDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConectarDAO con = new ConectarDAO();
    Connection conexao = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String matriculaSessaoStr = (String) session.getAttribute("matricula");
    String valorRecargaStr = request.getParameter("recarga");
    String matriculaDestinatario = request.getParameter("matriculaDestino");
    double saldoSessao;
    if (matriculaSessaoStr == null || valorRecargaStr == null || matriculaDestinatario == null) {
        response.getWriter().println("Erro: Matrícula ou valor de recarga não fornecidos.");
        return;
    }
    if(matriculaSessaoStr == matriculaDestinatario) {
        response.getWriter().println("Erro: Não é possível adicionar crédito a si mesmo");
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
            saldoSessao = rs.getDouble("saldo");
            if (saldoSessao < valorRecarga) {
                response.getWriter().println("Erro: Valor de saldo insuficiente.");
            } else {
                String updateSql = "UPDATE cadastros SET saldo = saldo - ? WHERE matricula = ?";
                pstmt = conexao.prepareStatement(updateSql);
                pstmt.setDouble(1, valorRecarga);
                pstmt.setString(2, matriculaSessaoStr);
                pstmt.executeUpdate();
            }
        } else {
            throw new SQLException("Usuário não encontrado.");
        }
        
        sql = "SELECT saldo FROM cadastros WHERE matricula = ?";
        pstmt = conexao.prepareStatement(sql);
        pstmt.setString(1, matriculaDestinatario);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
            pstmt = conexao.prepareStatement(updateSql);
            pstmt.setDouble(1, valorRecarga);
            pstmt.setString(2, matriculaDestinatario);
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
            if (rs != null) {
                rs.close();
            }
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

%>
