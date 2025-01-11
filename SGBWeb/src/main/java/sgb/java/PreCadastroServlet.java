package sgb.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import javax.servlet.http.HttpServletResponse;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/preCadastro")
public class PreCadastroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String email = request.getParameter("email");
        long matricula = Long.parseLong(request.getParameter("matricula"));
        String cpf = request.getParameter("cpf");

        try {
            ConexaoBD conexaoBD = new ConexaoBD();
            conexaoBD.inserirPreCadastro(nome, senha, null, email, matricula, cpf);

            response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()) {
                out.println("<h1>Cadastro realizado com sucesso!</h1>");
            }
        } catch (Exception e) {
            response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()) {
                out.println("<h2>Erro ao realizar cadastro: " + e.getMessage() + "</h2>");
            }
        }
    }
}

