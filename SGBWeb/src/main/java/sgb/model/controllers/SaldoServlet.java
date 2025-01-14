package sgb.model.controllers;

import sgb.model.dao.ConectarDAO;
import sgb.model.dto.Saldo;
import sgb.model.controllers.InfoServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;

/**
 *
 * @author usuario
 */
@WebServlet(urlPatterns = {"/SaldoServlet", "/main"})
public class SaldoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        Statement stmt = null;
        HttpSession session = request.getSession();

        List<Saldo> saldos = new ArrayList<>();
        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            stmt = conexao.createStatement();
            String sql = "SELECT matricula,saldo FROM cadastros";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                long matricula = rs.getLong("matricula");
                double saldo = rs.getDouble("saldo");
                
                saldos.add(new Saldo(matricula, saldo));
            }
            request.setAttribute("saldoInfos", saldos);
            request.getRequestDispatcher("core/pagamento/testeSaldo.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro: " + e.getMessage());
            request.setAttribute("mensagemErro", e.getMessage());
            request.getRequestDispatcher("core/erro.jsp").forward(request, response);
        } finally {
            
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long matriculaDestino = Long.parseLong(request.getParameter("matriculaDestino"));
        double valorTransferencia = Double.parseDouble(request.getParameter("valorTransferencia"));
        
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;
        HttpSession session = request.getSession();
        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            
            String matriculaOrigem = (String) session.getAttribute("matricula");
            String selectSQL = "SELECT saldo FROM cadastros WHERE matricula = ?";
            pstmt = conexao.prepareStatement(selectSQL);
            pstmt.setString(1, matriculaOrigem);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                double saldoOrigem = rs.getDouble("saldo");

                
                if (saldoOrigem >= valorTransferencia) {
                    
                    String updateOrigemSQL = "UPDATE saldos SET saldo = saldo - ? WHERE matricula = ?";
                    pstmt = conexao.prepareStatement(updateOrigemSQL);
                    pstmt.setDouble(1, valorTransferencia);
                    pstmt.setString(2, matriculaOrigem);
                    pstmt.executeUpdate();

                    
                    String updateDestinoSQL = "UPDATE saldos SET saldo = saldo + ? WHERE matricula = ?";
                    pstmt = conexao.prepareStatement(updateDestinoSQL);
                    pstmt.setDouble(1, valorTransferencia);
                    pstmt.setLong(2, matriculaDestino);
                    pstmt.executeUpdate();

                    response.getWriter().println("Transferência realizada com sucesso!");
                } else {
                    response.getWriter().println("Saldo insuficiente para a transferência.");
                }
            } else {
                response.getWriter().println("Matrícula de origem não encontrada.");
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
    }
}

/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        long matricula = Long.parseLong(request.getParameter("matricula"));
        double saldo = Double.parseDouble(request.getParameter("saldo"));

        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;

        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            String insertSQL = "INSERT INTO saldos (matricula, nome) SELECT matricula, nome FROM cadastros";
            pstmt = conexao.prepareStatement(insertSQL);
            pstmt.setLong(1, matricula);
            pstmt.setDouble(2, saldo);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().println("Saldo inserido com sucesso!");
            } else {
                response.getWriter().println("Erro ao inserir saldo.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erro: " + e.getMessage());
        } finally {
            
            try {
                if (pstmt != null) pstmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }*/
