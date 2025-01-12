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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SaldoDAO con = new SaldoDAO();
        Connection conexao = null;
        Statement stmt = null;
        List<Saldo> saldos = new ArrayList<>();
        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            stmt = conexao.createStatement();
            String sql = "SELECT matricula, saldo FROM saldos";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                long matricula = rs.getInt("matricula");
                double saldo = rs.getDouble("saldo");
                saldos.add(new Saldo(matricula, saldo));
            }
            request.setAttribute("saldos", saldos);
            request.getRequestDispatcher("core/reglog/testeSaldo.jsp").forward(request, response);
            //request.getRequestDispatcher("../testeSaldo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro: " + e.getMessage());
            request.setAttribute("mensagemErro", e.getMessage());
            request.getRequestDispatcher("core/erro.jsp").forward(request, response);
        } finally {
            // Fechar recursos
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
                if(conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
                
            }
        }
    }
}