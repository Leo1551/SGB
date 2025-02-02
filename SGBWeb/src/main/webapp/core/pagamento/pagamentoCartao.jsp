<%@page import="java.sql.*"%>
<%@page import="sgb.model.dao.ConectarDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processando Recarga</title>
    </head>
    <body>
        <%
            ConectarDAO con = new ConectarDAO();
            String matriculaSessaoStr = (String) session.getAttribute("matricula");
            String valorRecargaStr = request.getParameter("recarga");
            String nomeTitular = request.getParameter("nomeTitular");
            String numCartaoStr = request.getParameter("numCartao");
            String valCartaoStr = request.getParameter("valCartao");
            String cvvStr = request.getParameter("cvv");
            Integer qntd = null;
            if (matriculaSessaoStr == null || valorRecargaStr == null || nomeTitular == null || numCartaoStr == null || valCartaoStr == null || cvvStr == null) {
                out.print("Erro: Todos os campos devem ser fornecidos.");
                return;
            }

            long numero;
            int cvv;
            double saldo;
            double valorRecarga;

            try {

                valorRecargaStr = valorRecargaStr.replace("R$", "").replace(",", ".").trim();
                valorRecarga = Double.parseDouble(valorRecargaStr);
                numero = Long.parseLong(numCartaoStr);
                cvv = Integer.parseInt(cvvStr);

                if (!valCartaoStr.matches("^(0[1-9]|1[0-2])/\\d{2}$")) {
                    throw new IllegalArgumentException("Formato de validade inválido. Use MM/AA.");
                }

            } catch (NumberFormatException e) {
                out.print("Erro: Formato de número inválido.");
                return;
            } catch (IllegalArgumentException e) {
                out.print("Erro: " + e.getMessage());
                return;
            }

            try (Connection conexao = con.conectar()) {
                if (conexao == null) {
                    throw new SQLException("Falha ao conectar ao banco de dados");
                }

                String checkSql = "SELECT saldo FROM cartoes WHERE numero = ?";
                try (PreparedStatement checkStmt = conexao.prepareStatement(checkSql)) {
                    checkStmt.setLong(1, numero);
                    ResultSet rsCheck = checkStmt.executeQuery();

                    if (rsCheck.next()) {

                        double saldoCartao = rsCheck.getDouble("saldo");
                        if (saldoCartao >= valorRecarga) {

                            String updateCartaoSql = "UPDATE cartoes SET saldo = saldo - ? WHERE numero = ?";
                            try (PreparedStatement updateCartaoStmt = conexao.prepareStatement(updateCartaoSql)) {
                                updateCartaoStmt.setDouble(1, valorRecarga);
                                updateCartaoStmt.setLong(2, numero);
                                updateCartaoStmt.executeUpdate();
                            }

                            String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
                            try (PreparedStatement updateStmt = conexao.prepareStatement(updateSql)) {
                                updateStmt.setDouble(1, valorRecarga);
                                updateStmt.setString(2, matriculaSessaoStr);
                                int rowsUpdated = updateStmt.executeUpdate();

                                if (rowsUpdated > 0) {
                                    out.print("Recarga realizada com sucesso! Novo saldo: " + (saldoCartao + valorRecarga));
                                } else {
                                    out.print("Erro ao atualizar saldo.");
                                }
                            }
                        } else {
                            out.print("Saldo insuficiente no cartão.");
                        }
                    } else {

                        String insertSql = "INSERT INTO cartoes (nome, numero, validade, cvv, saldo) VALUES (?, ?, ?, ?, ?)";
                        try (PreparedStatement insertStmt = conexao.prepareStatement(insertSql)) {
                            insertStmt.setString(1, nomeTitular);
                            insertStmt.setLong(2, numero);
                            insertStmt.setString(3, valCartaoStr);
                            insertStmt.setInt(4, cvv);
                            insertStmt.setDouble(5, 500.00);
                            insertStmt.executeUpdate();
                        }

                        out.print("Cartão cadastrado com sucesso.");

                        String updateSql = "UPDATE cadastros SET saldo = saldo + ? WHERE matricula = ?";
                        try (PreparedStatement updateStmt = conexao.prepareStatement(updateSql)) {
                            updateStmt.setDouble(1, valorRecarga);
                            updateStmt.setString(2, matriculaSessaoStr);
                            int rowsUpdated = updateStmt.executeUpdate();

                            if (rowsUpdated > 0) {
                                out.print("Recarga realizada com sucesso! Novo saldo: " + (500.00 + valorRecarga));
                            } else {
                                out.print("Erro ao atualizar saldo.");
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.print("Erro: " + e.getMessage());
            }
        %>
    </body>
</html>
