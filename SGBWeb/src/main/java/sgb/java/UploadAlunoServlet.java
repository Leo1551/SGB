package sgb.java;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import sgb.java.ConexaoBD;

@WebServlet("/uploadAluno")  
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class UploadAlunoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConexaoBD c = new ConexaoBD();

        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String email = request.getParameter("email");
        String matriculaStr = request.getParameter("matricula");
        String cpf = request.getParameter("cpf");
        String fotoNome = "";

        long matricula = 0;
        if (matriculaStr != null && !matriculaStr.isEmpty()) {
            try {
                matricula = Long.parseLong(matriculaStr);
            } catch (NumberFormatException e) {
                response.getWriter().println("<p style='color:red;'>Erro: Número de matrícula inválido.</p>");
                return;
            }
        }

        Part fotoPart = request.getPart("foto");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            String nomeArquivo = fotoPart.getSubmittedFileName();
            String extensao = ".png"; // por padrao
            if (nomeArquivo.endsWith(".jpg") || nomeArquivo.endsWith(".jpeg")) {
                extensao = ".jpeg";
            }

            fotoNome = "foto_" + c.getProximoNumeroFoto() + extensao;

            String uploadDir = getServletContext().getRealPath("/core/images/uploads");
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String caminhoDestino = uploadDir + File.separator + fotoNome;
            fotoPart.write(caminhoDestino);
        }

        String resultado = c.inserirPreCadastro(nome, senha, fotoNome, email, matricula, cpf);

        request.setAttribute("resultado", resultado);
        request.setAttribute("fotoNome", fotoNome);
        request.getRequestDispatcher("/core/aluno/consultaAluno.jsp").forward(request, response);
    }
}
