package sgb.model.controllers;

import sgb.model.dao.SaldoDAO;
import sgb.model.dto.Saldo;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

/**
 *
 * @author usuario
 */
@WebServlet(urlPatterns = {"/SaldoServlet", "/main"})
public class SaldoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String url = "jdbc:mysql://localhost:3306/sgb";
    private String usuario = "root";
    private String senha = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conexao = null;
        Statement stmt = null;
        List<Saldo> saldos = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection(url, usuario, senha);
            stmt = conexao.createStatement(); // Inicializando o Statement
            String sql = "SELECT id, saldo FROM cadastros";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                int saldo = rs.getInt("saldo");
                saldos.add(new Saldo(id, saldo));
            }
            request.setAttribute("saldos", saldos);
            request.getRequestDispatcher("/core/testeSaldo.jsp").forward(request, response);
            //request.getRequestDispatcher("../testeSaldo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ocorreu um erro ao buscar o saldo.");
            request.getRequestDispatcher("../core/erro.jsp").forward(request, response);
        } finally {
            // Fechar recursos
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}