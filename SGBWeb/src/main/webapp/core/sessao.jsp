<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sgb.model.dao.ConectarDAO"%>

<%
        if (session.getAttribute("matricula") == null) response.sendRedirect("../reglog/login.jsp");
        // OK meus putos, o negócio é o seguinte, a variável :session: foi settada em reglog/consultaMatricula.jsp
        // O ponto para vocês é: qualquer coisa que deve ser alterada na sessão está na variável :session:
        
        //Implicitamente, as páginas usam a variável :session: para se referirem ao objeto HTTPSession implicitamente
        
        
       //variáveis que vocês podem usar e que são imutáveis
        String matricula = (String) session.getAttribute("matricula");
        String senha = (String) session.getAttribute("senha");
        //variáveis que vocês podem usar e que precisam ser constantemente atualizados
        String saldo;
        
        
        //ignorem
        ConectarDAO congo = new ConectarDAO();
        Connection conexaoSP = congo.conectar();
        
        PreparedStatement caixa = conexaoSP.prepareStatement("SELECT `saldo` from cadastros where matricula = ?");
 
        caixa.setString(1, matricula);
        ResultSet cargoBD = caixa.executeQuery();

        cargoBD.next();
        // if (cargoBD.next())
            session.setAttribute("saldo", cargoBD.getString(1));
        
        
        
        
        saldo = (String) session.getAttribute("saldo");
        //parem de ignorar
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //antes de tudo, passem pela tela de login
%>
