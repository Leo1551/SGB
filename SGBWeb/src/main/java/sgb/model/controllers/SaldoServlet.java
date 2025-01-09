package sgb.model.controllers;

import sgb.model.dao.SaldoDAO;
import sgb.model.dto.Saldo;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
@WebServlet("/getSaldo")
public class SaldoServlet extends HttpServlet {
    private SaldoDAO saldoDAO;

    @Override
    public void init() {
        saldoDAO = new SaldoDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long idUsuario = Long.valueOf(request.getParameter("id"));
            Saldo saldo = saldoDAO.getSaldoId(idUsuario);
            if (saldo != null) {
                request.setAttribute("saldo", saldo);
            } else {
                request.setAttribute("errorMessage", "Nenhum saldo encontrado para o ID fornecido.");
            }
            request.getRequestDispatcher("teste.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "ID inválido.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
 } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ocorreu um erro ao buscar o saldo.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}