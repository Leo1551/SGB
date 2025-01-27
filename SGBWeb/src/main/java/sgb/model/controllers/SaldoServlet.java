package sgb.model.controllers;

import sgb.model.dao.ConectarDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/SaldoServlet", "/main"})
public class SaldoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;
        HttpSession session = request.getSession();

        String matriculaSessaoStr = (String) session.getAttribute("matricula");
        String valorRecargaStr = request.getParameter("recarga");
        Object teste = request.getAttribute("z");

        if (matriculaSessaoStr == null || valorRecargaStr == null) {
            response.getWriter().println("Erro: Matricula ou valor de recarga nao fornecidos.");
            response.getWriter().println(teste);
            response.getWriter().println(valorRecargaStr);
            response.getWriter().println(matriculaSessaoStr);
            return;
        }

        double valorRecarga;
        try {
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
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                double saldoSessao = rs.getDouble("saldo");
                request.setAttribute("saldoSessao", saldoSessao);

                String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
                pstmt = conexao.prepareStatement(updateSql);
                pstmt.setDouble(1, valorRecarga);
                pstmt.setString(2, matriculaSessaoStr);
                pstmt.executeUpdate();

                response.getWriter().println("Recarga realizada com sucesso! Novo saldo: " + (saldoSessao + valorRecarga));
                request.setAttribute("saldoSessao", saldoSessao + valorRecarga);
            } else {
                response.getWriter().println("Erro: Matrícula não encontrada.");
            }
        } /*try {
            if ("pix".equals(selecao)) {
                // Lógica para processamento do pagamento via PIX
                
            } else if ("cartao".equals(selecao)) {
                // Lógica para processamento do pagamento via Cartão
            } else if ("transferencia".equals(selecao)) {
                // Lógica para processamento do pagamento via Transferência
            }
        }*/ catch (Exception e) {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;
        HttpSession session = request.getSession();

        String matriculaSessaoStr = (String) session.getAttribute("matricula");

        if (matriculaSessaoStr == null) {
            response.getWriter().println("Erro: Matrícula não fornecida.");
            response.getWriter().println(matriculaSessaoStr);
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
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                double saldoSessao = rs.getDouble("saldo");
                response.getWriter().println("Seu saldo atual é: " + saldoSessao);
                request.setAttribute("saldoSessao", saldoSessao);
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
    }
}
