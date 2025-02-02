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
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import sgb.model.dao.TransacaoDAO;
import sgb.model.dto.Transacao;
import sgb.model.dao.SaldoDAO;

@WebServlet(name = "historico", urlPatterns = {"/historico"})
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
        String atributoMatricula;
        int mes;
        HttpSession sessao = request.getSession(true);
        atributoMatricula = (String) sessao.getAttribute("matricula");
        if (atributoMatricula == null || atributoMatricula.equals("")) {
            request.setAttribute("mensagemErro", "Nenhuma matricula salva");
            request.getRequestDispatcher("/core/erro.jsp").forward(request, response);
            return;
        } else {
            matricula = Long.parseLong(atributoMatricula);

        }
        if (request.getParameter("mes") == null || request.getParameter("mes").equals("")) {
            //pegar o mes
            java.util.Date data = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(data);
            mes = cal.get(Calendar.MONTH) + 1;
        } else {
            mes = Integer.parseInt(request.getParameter("mes"));
        }
        Transacao[] transacoes = null;
        StringBuilder transacoesJSON = new StringBuilder();
        try {
            java.util.Date data = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(data);
            int anoAtual = cal.get(Calendar.YEAR);
            int mesAtual = cal.get(Calendar.MONTH) + 1;
            Date dataInicial;
            Date dataFinal;
            if (mes > mesAtual) {
                //os meses aqui contam janeiro=0,fevereiro=1...dezembro=11
                //enquanto a variavel mes considera janeiro=1,fevereiro=2...dezembro=12
                //por isso o -1
                dataInicial = new GregorianCalendar(anoAtual - 1, mes - 1, 1).getTime();
                dataFinal = new GregorianCalendar(anoAtual - 1, mes, 1).getTime();
            } else {
                //os meses aqui contam janeiro=0,fevereiro=1...dezembro=11
                //enquanto a variavel mes considera janeiro=1,fevereiro=2...dezembro=12
                //por isso o -1
                dataInicial = new GregorianCalendar(anoAtual, mes - 1, 1).getTime();
                dataFinal = new GregorianCalendar(anoAtual, mes, 1).getTime();
            }
            transacoes = TransacaoDAO.getTransacoes(matricula, dataInicial, dataFinal);
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagemErro", ex.getMessage());
            request.getRequestDispatcher("/core/erro.jsp").forward(request, response);
        }

        if (transacoes != null && transacoes[0] != null) {
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
        } else {
            transacoesJSON.append("{}");
        }
        request.setAttribute("transacoesP", transacoesJSON.toString());
        request.setAttribute("mesP", mes);
        try {
            request.setAttribute("saldoP", SaldoDAO.getSaldo(matricula));
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensagemErro", "A matricula " + matricula + " não esta vinculada a nenhum saldo");
            request.getRequestDispatcher("/core/erro.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/core/historico/historico.jsp").forward(request, response);

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
