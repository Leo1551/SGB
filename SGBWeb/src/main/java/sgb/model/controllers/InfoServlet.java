/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sgb.model.controllers;

import sgb.model.dao.ConectarDAO;
import sgb.model.dto.Cadastro;
import java.sql.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author usuario
 */
@WebServlet(name = "InfoServlet", urlPatterns = {"/InfoServlet"})
public class InfoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectarDAO con = new ConectarDAO();
        Connection conexao = null;
        Statement stmt = null;
        HttpSession session = request.getSession();
        List<Cadastro> matriculas = new ArrayList<>();
        try {
            conexao = con.conectar();
            if (conexao == null) {
                throw new SQLException("Falha ao conectar ao banco de dados.");
            }
            stmt = conexao.createStatement();
            String sql = "SELECT nome, matricula FROM cadastros";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Long matricula = rs.getLong("matricula");
                String nome = rs.getString("matricula");
                //matriculas.add(new Cadastro(matricula, nome));
            }
            session.setAttribute("infos", matriculas);
            response.sendRedirect("SaldoServlet");
            //request.getRequestDIspatcher("").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro: " + e.getMessage());
            request.setAttribute("mensagemErro", e.getMessage());
            request.getRequestDispatcher("core/erro.jsp").forward(request, response);
        } finally {
            // Fechar recursos
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
}
