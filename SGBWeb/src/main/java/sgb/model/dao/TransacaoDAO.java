/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dao;

import java.sql.*;
import java.util.Date;
import sgb.model.dto.Transacao;
import sgb.model.dao.OpenBD;

public class TransacaoDAO {

    public static boolean setTransacao(Transacao trnsc) {
        String sql = "INSERT INTO historico (matricula, valor, data, funcionario, saldo) VALUES (?, ?, ?, ?, ?)";
        try (Connection conexao = OpenBD.getConnection(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, trnsc.getMatricula() + "");
            stmt.setString(2, trnsc.getValor() + "");
            stmt.setString(3, new java.sql.Timestamp(trnsc.getData().getTime()) + "");
            stmt.setString(4, trnsc.getFuncionario() + "");
            stmt.setString(5, trnsc.getSaldo() + "");
            stmt.executeUpdate();
            System.out.println("Dados inseridos na tabela de historico");
            return true;
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados na tabela historico: " + e.getMessage());
            return false;
        }
    }

    public static Transacao[] getTransacoes(long matricula) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM historico WHERE matricula=" + matricula;
        Transacao[] res = new Transacao[500];
        try (Connection conexao = new OpenBD().getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                int i = 0;
                while (rs.next()) {
                    long resultadoMatricula = rs.getLong("matricula");
                    int resultadoValor = rs.getInt("valor");
                    java.sql.Timestamp resultData = rs.getTimestamp("data");
                    String resultadoFuncionario = rs.getString("funcionario");
                    int resultadoSaldo = rs.getInt("saldo");
                    res[i] = new Transacao(resultadoMatricula, resultadoValor, resultData, resultadoFuncionario, resultadoSaldo);
                    i++;

                }
            } catch (SQLException e) {
                System.out.println("Erro ao consultar a tabela de histórico: " + e.getMessage());
                return null;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro ao conectar na tabela de histórico para consultar transações: " + e.getMessage());
            return null;

        }
        return res;
    }

    public static Transacao[] getTransacoes(long matricula, Date dataInicial, Date dataFinal) throws SQLException, ClassNotFoundException {
        java.sql.Timestamp sqlDataInicial = new java.sql.Timestamp(dataInicial.getTime());
        java.sql.Timestamp sqlDataFinal = new java.sql.Timestamp(dataFinal.getTime());
        String sql = "SELECT * FROM historico WHERE matricula='" + matricula + "' AND data BETWEEN '" + sqlDataInicial + "' AND '" + sqlDataFinal + "'";
        Transacao[] res = new Transacao[500];
        try (Connection conexao = OpenBD.getConnection(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                int i = 0;
                while (rs.next()) {
                    long resultadoMatricula = rs.getLong("matricula");
                    int resultadoValor = rs.getInt("valor");
                    java.sql.Timestamp resultData = rs.getTimestamp("data");
                    String resultadoFuncionario = rs.getString("funcionario");
                    int resultadoSaldo = rs.getInt("saldo");
                    res[i] = new Transacao(resultadoMatricula, resultadoValor, resultData, resultadoFuncionario, resultadoSaldo);
                    i++;

                }
            } catch (SQLException e) {
                System.out.println("Erro ao consultar a tabela de historico: " + e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Erro ao conectar na tabela de historico para consultar transações: " + e.getMessage());
            return null;

        }
        return res;
    }
}
