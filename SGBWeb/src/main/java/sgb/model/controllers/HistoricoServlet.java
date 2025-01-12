package sgb.model.controllers;

import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import sgb.model.dao.TransacaoDAO;
import sgb.model.dto.Transacao;

@WebServlet("/historico")
public class HistoricoServlet extends HttpServlet {

    private String converteTransacaoParaJSON(Transacao tr) {
        DecimalFormat formatacaoDinheiro = new DecimalFormat("#.##");
        
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long matricula = Long.parseLong(request.getParameter("matricula"));
        Transacao[] transacoes=null;
        try {
            transacoes = TransacaoDAO.getTransacoes(matricula);
            //lidar com erro de matricula inexistente 
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(HistoricoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       request.setAttribute("test", converteTransacaoParaJSON(transacoes[0]));
       request.getRequestDispatcher("/core/historico/historico.jsp").forward(request, response);
    }
}
