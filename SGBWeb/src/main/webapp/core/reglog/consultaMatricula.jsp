<%-- 
    Document   : consultaMatricula
    Created on : 6 de jan. de 2025, 07:30:17
    Author     : aluno
--%>

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
        String senha = request.getParameter("senha");
        
        senha = HashMD5.criptografar(senha);
        
        
        
            if(LoginDAO.verificacaoLogin(new Login(matricula, senha))){
            
                //Pega dados do usuário
                
                ConectarDAO con = new ConectarDAO();
                Connection conexaoBD = con.conectar();
                
                PreparedStatement caixa = conexaoBD.prepareStatement("SELECT `saldo`, `cargo` from cadastros where matricula = ?");
 
                caixa.setString(1, matricula);
                ResultSet cargoBD = caixa.executeQuery();

                cargoBD.next();
                String cargo = cargoBD.getString(2);
                String saldo = cargoBD.getString(1);
                
                    
                    
                //cria sessão
                HttpSession sessao = request.getSession(true); // se não houver sessão, cria
                //passagem de params para a página inícial
                sessao.setAttribute("matricula", matricula);
                sessao.setAttribute("senha", senha);
                sessao.setAttribute("saldo", saldo);
                
                
                
                
                
                if (cargo.equals("gestor"))
                    response.sendRedirect("../gestor/paginaInicialGestor.jsp");
                if (cargo.equals("aluno"))
                    response.sendRedirect("../aluno/paginaInicialAluno.jsp");
                    out.print(cargo);
            }
            else
                response.sendRedirect("login.jsp");
      
        %>

  
    </body>
</html>
