<%-- 
    Document   : consultaMatricula
    Created on : 6 de jan. de 2025, 07:30:17
    Author     : aluno
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="sgb.model.dao.SessaoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@page import="sgb.java.HashMD5"%>
<%@ page import="sgb.model.dto.Login" %>
<%@ page import="sgb.model.dao.LoginDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultando dados...</title>
    </head>
    <body>
        <h1>Aguarde enquanto verificamos os dados</h1>

        <%
            String matricula = request.getParameter("matricula");
            matricula = matricula.replaceAll("\\.", "");
            String senha = request.getParameter("senha");
            String metodo = request.getParameter("met");

            senha = HashMD5.criptografar(senha);

            //cria sessão
            HttpSession sessao = request.getSession(true); // se não houver sessão, cria
            //passagem de parametros gerais para a página inícial
            sessao.setAttribute("matricula", matricula);
            sessao.setAttribute("senha", senha);

            switch (metodo) {

                case "1":
                    if (LoginDAO.verificacaoLogin(new Login(matricula, senha), "cadastros", "matricula")) {

                        String[] dados = {matricula};

                        try {
                            ResultSet dadosAluno = SessaoDAO.querySQL("SELECT `nome`, `email`, `foto`, `statusCartao`, `cpf` from cadastros where matricula = ?", dados);

                            int statusCartao = Integer.parseInt(dadosAluno.getString(4));

                            if (statusCartao == 0) {
                                response.sendRedirect("login.jsp?login=1&erro=1");
                                return;
                            }

                            sessao.setAttribute("nome", dadosAluno.getString(1));
                            sessao.setAttribute("email", dadosAluno.getString(2));
                            sessao.setAttribute("foto", dadosAluno.getString(3));
                            sessao.setAttribute("statusCartao", statusCartao);
                            sessao.setAttribute("cpf", dadosAluno.getString(5));

                            response.sendRedirect("../aluno/paginaInicialAluno.jsp");
                        } catch (SQLException e) {
                            out.print("erro ao pegar dados do banco de dados: " + e.getMessage());
                        }

                    } else {
                        response.sendRedirect("login.jsp?login=1");
                    }

                    break;

                case "2":
                    if (LoginDAO.verificacaoLogin(new Login(matricula, senha), "gestores", "cpf")) {

                        String[] dados = {matricula};
                        try {
                            ResultSet dadosGestor = SessaoDAO.querySQL("SELECT `nome`, `email` FROM gestores WHERE cpf = ?", dados);

                            sessao.setAttribute("nome", dadosGestor.getString(1));
                            sessao.setAttribute("email", dadosGestor.getString(2));

                            response.sendRedirect("../gestor/paginaInicialGestor.jsp");

                        } catch (SQLException e) {
                            out.print("erro ao pegar dados do banco de dados: " + e.getMessage());
                        }
                    } else {
                        response.sendRedirect("login.jsp?login=2");
                    }

                    break;

                case "3":
                    if (LoginDAO.verificacaoLogin(new Login(matricula, senha), "funcionarios", "cpf")) {

                        String[] dados = {matricula};
                        try {
                            ResultSet dadosGestor = SessaoDAO.querySQL("SELECT `nome`, `email` FROM funcionarios WHERE cpf = ?", dados);

                            sessao.setAttribute("nome", dadosGestor.getString(1));
                            sessao.setAttribute("email", dadosGestor.getString(2));

                            response.sendRedirect("../funcionario/paginaInicialFuncionario.jsp");

                        } catch (SQLException e) {
                            out.print("erro ao pegar dados do banco de dados: " + e.getMessage());
                        }
                    } else {
                        response.sendRedirect("login.jsp?login=3");
                    }

                    break;

                default:
                    out.println("Deu ruim");
                    break;

            }
        %>


    </body>
</html>
