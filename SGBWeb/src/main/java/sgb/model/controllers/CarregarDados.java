package sgb.model.controllers;

import jakarta.servlet.RequestDispatcher;
import sgb.model.dao.ConectarDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

/**
 *
 * @author usuario
 */
@WebServlet(name = "CarregarDados", urlPatterns = {"/CarregarDados"})
public class CarregarDados extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        PreparedStatement pstmt = null;

        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados");
            }

            String sql = "SELECT saldo FROM cadastros WHERE matricula = ?";
            pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, "sua_matricula"); // Substitua pela matrícula desejada
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                double saldo = rs.getDouble("saldo");
                request.setAttribute("saldo", saldo); // Armazena o saldo na requisição
            } else {
                request.setAttribute("erro", "Matrícula não encontrada.");
            }

            // Encaminha a requisição para o JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("core/pagamento/pagamentos.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao acessar o banco de dados: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("core/erro.jsp");
            dispatcher.forward(request, response);
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