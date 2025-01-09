package sgb.model.dao;
import java.sql.*;
import sgb.model.dto.Saldo;
/**
 *
 * @author Bruno
 */
public class SaldoDAO {
    private String URL = "jdbc:mysql://localhost:3306/sgb";
    private String Usuario = "root";
    private String Senha = "";
    
    public Saldo getSaldoId(Long userId) { 
        Saldo saldo = null;
        String sql = "SELECT id, saldo FROM cadastros WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(URL, Usuario, Senha);
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                saldo = new Saldo(resultSet.getString("nome"));
                saldo.setId(resultSet.getLong("id"));
                saldo.setSaldo(resultSet.getDouble("saldo"));
            }    
        } catch (Exception e) {
            e.printStackTrace();
        }    
        
        return saldo;
    }
}
