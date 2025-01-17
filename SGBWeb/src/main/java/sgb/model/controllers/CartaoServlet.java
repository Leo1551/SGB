package sgb.model.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import sgb.model.dto.Cartao;
import sgb.model.dao.ConectarDAO;

@WebServlet(name = "Cartao", urlPatterns = {"/Cartao"})
public class CartaoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Long numCartao = Long.parseLong(request.getParameter("numeroCartao"));
            String senha = request.getParameter("senhaCartao");
            Integer codigo = Integer.parseInt(request.getParameter("codigoCartao"));
            String validadeStr = request.getParameter("validadeCartao");
            
            YearMonth validade = YearMonth.parse(validadeStr, DateTimeFormatter.ofPattern("MMyyyy"));

            
            Cartao cartao = new Cartao(numCartao, codigo, senha);

            ConectarDAO con = new ConectarDAO();
            try (Connection conexao = con.conectar()) {
                String sql = "INSERT INTO cartoes (num_cartao, codigo, senha) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                    stmt.setLong(1, cartao.getNumCartao());
                    stmt.setInt(2, cartao.getCodigo());
                    //stmt.setString(3, cartao.getValidade().toString()); 
                    stmt.setString(3, cartao.getSenha());
                    stmt.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Erro ao inserir os dados: " + e.getMessage());
            }

            
            response.sendRedirect("core/principal/telaInicial.jsp"); 
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para processar dados do cartão";
    }
}