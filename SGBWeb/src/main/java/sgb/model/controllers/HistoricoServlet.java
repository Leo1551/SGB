/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sgb.model.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import sgb.model.dao.TransacaoDAO;
import sgb.model.dto.Transacao;

@WebServlet(name = "historico", urlPatterns = {"/historico                                                          "})
public class HistoricoServlet extends HttpServlet {

    private String converteTransacaoParaJSON(Transacao tr) {

        StringBuilder rJson = new StringBuilder();
        rJson.append("{");
        rJson.append("\"tipo\":");
        if (tr.getValor() > 0) {
            rJson.append("\"recarga\",");
        } else {
            rJson.append("\"compra\",");
        }
        rJson.append("\"data\":");
        rJson.append("\"");
        rJson.append(new SimpleDateFormat("MM-dd-yyyy").format(tr.getData()));
        rJson.append("\",");
        rJson.append("\"hora\":");
        rJson.append("\"");
        rJson.append(new SimpleDateFormat("HH:mm").format(tr.getData()));
        rJson.append("\",");
        rJson.append("\"funcionario\":");
        rJson.append("\"");
        rJson.append(tr.getFuncionario());
        rJson.append("\",");
        rJson.append("\"valor\":");
        rJson.append("\"");
        //o valor é guardado como int, com o número de centavos
        rJson.append(tr.getValor());
        rJson.append("\",");
        rJson.append("\"saldoAtual\":");
        rJson.append("\"");
        //o valor é guardado como int, com o número de centavos
        rJson.append(tr.getSaldo());
        rJson.append("\"");
        rJson.append("}");

        return rJson.toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long matricula;
        if (request.getParameter("matricula") == null) {
            response.getWriter().print("Erro: Nenhuma matriucla fornecida");
            return;
        } else {
            matricula = Long.parseLong(request.getParameter("matricula"));
        }
        Transacao[] transacoes = null;
        StringBuilder transacoesJSON = new StringBuilder();
        try {
            transacoes = TransacaoDAO.getTransacoes(matricula);

            //lidar com erro de matricula inexistente 
        } catch (SQLException | ClassNotFoundException ex) {
            response.getWriter().print(ex.getMessage());
            Logger.getLogger(HistoricoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (transacoes != null) {
            transacoesJSON.append("[");
            for (Transacao tr : transacoes) {
                if (tr == null) {
                    break;
                }
                transacoesJSON.append(converteTransacaoParaJSON(tr));
                transacoesJSON.append(",");
            }
            //tira a ultima virgula
            transacoesJSON.delete(transacoesJSON.length() - 1, transacoesJSON.length());
            transacoesJSON.append("]");
            request.setAttribute("transacoes", transacoesJSON.toString());
            request.getRequestDispatcher("/core/historico/historico.jsp").forward(request, response);
        } else {
            response.getWriter().print("Erro: Nenhuma transação com a matricula " + matricula + " encontrada");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
