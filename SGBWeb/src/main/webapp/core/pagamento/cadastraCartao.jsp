<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%
    
    ConectarDAO con = new ConectarDAO();
    Connection conexao = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    
    String nomeTitular = request.getParameter("nomeTitular");
    String numCartao = request.getParameter("numCartao");
    String valCartao = request.getParameter("valCartao");
    String cvv = request.getParameter("cvv");
    double recarga = Double.parseDouble(request.getParameter("recarga")); 

    try {
        
        conexao = con.conectar();
        if (conexao == null) {
            throw new SQLException("Falha ao conectar ao banco de dados");
        }

        
        String checkSql = "SELECT * FROM cartoes WHERE numCartao = ?";
        pstmt = conexao.prepareStatement(checkSql);
        pstmt.setString(1, numCartao);
        rs = pstmt.executeQuery();

        
        if (rs.next()) {
            response.sendRedirect("pagamentoCartao.jsp");
        } else {
            
            String insertSql = "INSERT INTO cartoes (nomeTitular, numCartao, valCartao, cvv, recarga) VALUES (?, ?, ?, ?, ?)";
            pstmt = conexao.prepareStatement(insertSql);
            pstmt.setString(1, nomeTitular);
            pstmt.setString(2, numCartao);
            pstmt.setString(3, valCartao);
            pstmt.setString(4, cvv);
            pstmt.setDouble(5, 500.00); 

            
            pstmt.executeUpdate();

            
            response.sendRedirect("pagamentoCartao.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.getWriter().println("Erro ao inserir dados do cartão: " + e.getMessage());
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