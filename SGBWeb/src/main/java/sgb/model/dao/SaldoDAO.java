package sgb.model.dao;

import java.sql.*;
import sgb.model.dao.OpenBD;

public class SaldoDAO {

    public static int getSaldo(long matricula) throws SQLException, ClassNotFoundException {
        int saldo=0;
        String sql = "SELECT * FROM cadastros WHERE matricula=" + matricula;
        try (Connection conexao = new OpenBD().getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                    saldo = rs.getInt("saldo");
                    System.out.println("addasdsa  "+saldo);

                
            } catch (SQLException e) {
                System.out.println("Erro ao consultar a tabela de histórico: " + e.getMessage());
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Erro ao conectar na tabela de histórico para consultar transações: " + e.getMessage());
            return 0;

        }
        return saldo;
    }
}
