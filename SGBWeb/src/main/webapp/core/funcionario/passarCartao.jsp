<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="sgb.java.ConexaoBD" %>
<%@ page import="sgb.model.dto.Cadastro" %>
<%@page import="java.sql.*"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SGRU</title>
        <link rel="stylesheet" href="../../css/passarCartao.css">
        <link rel="stylesheet" href="../../css/styleBase.css">
        <style>
            .ativo {
                font-weight: bold;
                color:green;
            }
            .inativo {
                font-weight: bold;
                color:red;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section id="nome-pagina">
            <h2>ENTRADA DO RU</h2>
        </section>

        <div class="container">            
            <div class="metade cima">
                <form action="passarCartao.jsp" method="get" enctype="multipart/form-data">
                    <div class="info">
                        <p>Operador(a):</p>
                        <div id="operador"><%=session.getAttribute("nome")%></div>
                    </div>
                    <div class="campo">
                        <label>Cartão:</label>
                        <input placeholder="000000" type="number" name="matriculaInserida" id="codigo" required>
                    </div>
                    <button type="submit">Confirmar</button>
                </form>
            </div>
            <%
                ConectarDAO con = new ConectarDAO();
                Connection conexao = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                Double saldoNovo = null;
                DecimalFormat df = new DecimalFormat("#.00");
                String idParam = null;
                String matriculaInserida = (String) request.getParameter("matriculaInserida");
                String nome = null;
                String email = null;
                long matricula = 0;
                String cpf = null;
                String foto = null;
                int codigoCartao = 0;
                Boolean statusCartao = false;
                try {
                    conexao = con.conectar();
                    String sql = "SELECT id, saldo FROM cadastros WHERE matricula = ?";
                    pstmt = conexao.prepareStatement(sql);
                    pstmt.setString(1, matriculaInserida);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        idParam = rs.getString("id");
                        saldoNovo = rs.getDouble("saldo");
                        if (saldoNovo > 3.20) {
                            saldoNovo -= 3.20;
                            sql = "UPDATE cadastros SET saldo = saldo - ? WHERE matricula = ?";
                            pstmt = conexao.prepareStatement(sql);

                            pstmt.setDouble(1, 3.20);
                            pstmt.setString(2, matriculaInserida);
                            pstmt.executeUpdate();
                        } else if (saldoNovo < 0) {
                            saldoNovo = 0.0;
                            sql = "UPDATE cadastros SET saldo = ? WHERE matricula = ?";
                            pstmt = conexao.prepareStatement(sql);

                            pstmt.setDouble(1, 0.0);
                        }
                        pstmt.setString(2, matriculaInserida);
                        pstmt.executeUpdate();
                    }

                    Integer id = Integer.parseInt(idParam);

                    List<Cadastro> cadastros = ConexaoBD.consultarCadastro(null, null, null, null, null, Long.parseLong(matriculaInserida), null, null, null);

                    if (cadastros != null && !cadastros.isEmpty()) {
                        Cadastro cadastro = cadastros.get(0);

                        nome = cadastro.getNome();
                        email = cadastro.getEmail();
                        matricula = cadastro.getMatricula();
                        cpf = cadastro.getCpf();
                        foto = cadastro.getFoto();
                        codigoCartao = cadastro.getCodigoCartao();
                        statusCartao = cadastro.getStatusCartao();
                    }
            %>
            <div class="metade baixo">
                <div class="info">
                    <p>Foto:</p>
                    <br>
                    <img src="../../images/fotos/<%= foto%>">
                </div>
                <div class="info">
                    <p>Nome:</p>
                    <div id="nome"><%= nome%></div>
                    <br><br>
                    <p>Matrícula:</p>
                    <div id="numMatricula"><%= matricula%></div>
                </div>
                <div class="info">
                    <p>Status do cartão:</p>
                    <div id="statusCartao" class="ativo">
                        <%
                            if (statusCartao) {
                        %>
                        <p id="saldo" class="ativo">Ativo</p>
                        <%
                        } else {
                        %>
                        <p id="saldo" class="inativo">Inativo</p>
                        <%
                            }
                        %>
                    </div>
                    <br><br>
                    <p>Saldo atual:</p>
                    <div id="saldo">
                        <%
                            if (statusCartao) {
                        %>
                        <%= df.format(saldoNovo)%>
                        <%
                        } else {
                        %>
                        <%= df.format(saldoNovo + 3.20)%>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try {
                        rs.close();
                    } catch (SQLException ignore) {
                    }
                    if (pstmt != null) try {
                        pstmt.close();
                    } catch (SQLException ignore) {
                    }
                    if (conexao != null) try {
                        conexao.close();
                    } catch (SQLException ignore) {
                    }
                }
            %>
            <%@include file="../footer.jsp" %>
        </div>
    </body>
</html>
