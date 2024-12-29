/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.cefet.inf.sgbjava;

/**
 *
 * @author izaka
 */
import java.sql.*;

public class ConexaoBD {
    private static String url = "jdbc:mysql://localhost:3306/sgb"; 
    private static String usuario = "root";
    private static String senha = ""; 

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }

    public static void inserirPreCadastro(String nome, String senha, String foto, String email, long matricula, int id) {
        String sql = "INSERT INTO precadastros (nome, senha, foto, email, matricula, id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setLong(6, id);
            stmt.executeUpdate();
            System.out.println("Dados inseridos na tabela precadastros!");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados na tabela precadastros: " + e.getMessage());
        }
    }

    public static void inserirCadastro(String nome, String senha, String foto, String email, long matricula, int codigoCartao, boolean statusCartao, int id) {
        String sql = "INSERT INTO cadastros (nome, senha, foto, email, matricula, codigoCartao, statusCartao, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setInt(6, codigoCartao);
            stmt.setBoolean(7, statusCartao);
            stmt.setInt(8, id);
            stmt.executeUpdate();
            System.out.println("Dados inseridos na tabela cadastros!");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados na tabela cadastros: " + e.getMessage());
        }
    }

    public static void atualizarPreCadastro(int id, String nome, String senha, String foto, String email, long matricula) {
        String sql = "UPDATE precadastros SET nome = ?, senha = ?, foto = ?, email = ?, matricula = ? WHERE id = ?";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setInt(6, id);
            stmt.executeUpdate();
            System.out.println("Dados atualizados na tabela precadastros!");
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar dados na tabela precadastros: " + e.getMessage());
        }
    }

    public static void atualizarCadastro(int id, String nome, String senha, String foto, String email, long matricula, int codigoCartao, boolean statusCartao) {
        String sql = "UPDATE cadastros SET nome = ?, senha = ?, foto = ?, email = ?, matricula = ?, codigoCartao = ?, statusCartao = ? WHERE id = ?";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setInt(6, codigoCartao);
            stmt.setBoolean(7, statusCartao);
            stmt.setInt(8, id);
            stmt.executeUpdate();
            System.out.println("Dados atualizados na tabela cadastros!");
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar dados na tabela cadastros: " + e.getMessage());
        }
    }
    
    public static void consultarPreCadastro(Integer id, String nome, String senha, String foto, String email, Long matricula) {
        StringBuilder sql = new StringBuilder("SELECT * FROM precadastros WHERE 1=1");
    
        if (id != null) sql.append(" AND id = ?");
        if (nome != null) sql.append(" AND nome LIKE ?");
        if (senha != null) sql.append(" AND senha = ?");
        if (foto != null) sql.append(" AND foto = ?");
        if (email != null) sql.append(" AND email = ?");
        if (matricula != null) sql.append(" AND matricula = ?");
    
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql.toString())) {
        
            int paramIndex = 1;
            if (id != null) stmt.setInt(paramIndex++, id);
            if (nome != null) stmt.setString(paramIndex++, "%" + nome + "%");
            if (senha != null) stmt.setString(paramIndex++, senha);
            if (foto != null) stmt.setString(paramIndex++, foto);
            if (email != null) stmt.setString(paramIndex++, email);
            if (matricula != null) stmt.setLong(paramIndex++, matricula);
        
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int resultId = rs.getInt("id");
                    String resultNome = rs.getString("nome");
                    String resultEmail = rs.getString("email");
                    Long resultMatricula = rs.getLong("matricula");
                
                    System.out.println("ID: " + resultId + ", Nome: " + resultNome + ", Email: " + resultEmail + ", Matricula: " + resultMatricula);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao consultar dados da tabela cadastros: " + e.getMessage());
        }
    }

    public static void consultarCadastro(Integer id, String nome, String senha, String foto, String email, Long matricula, Integer codigoCartao, Boolean statusCartao) {
        StringBuilder sql = new StringBuilder("SELECT * FROM cadastros WHERE 1=1");
    
        if (id != null) sql.append(" AND id = ?");
        if (nome != null) sql.append(" AND nome LIKE ?");
        if (senha != null) sql.append(" AND senha = ?");
        if (foto != null) sql.append(" AND foto = ?");
        if (email != null) sql.append(" AND email = ?");
        if (matricula != null) sql.append(" AND matricula = ?");
        if (codigoCartao != null) sql.append(" AND codigoCartao = ?");
        if (statusCartao != null) sql.append(" AND statusCartao = ?");
    
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql.toString())) {
        
            int paramIndex = 1;
            if (id != null) stmt.setInt(paramIndex++, id);
            if (nome != null) stmt.setString(paramIndex++, "%" + nome + "%");
            if (senha != null) stmt.setString(paramIndex++, senha);
            if (foto != null) stmt.setString(paramIndex++, foto);
            if (email != null) stmt.setString(paramIndex++, email);
            if (matricula != null) stmt.setLong(paramIndex++, matricula);
            if (codigoCartao != null) stmt.setInt(paramIndex++, codigoCartao);
            if (statusCartao != null) stmt.setBoolean(paramIndex++, statusCartao);
        
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int resultId = rs.getInt("id");
                    String resultNome = rs.getString("nome");
                    String resultEmail = rs.getString("email");
                    boolean resultStatusCartao = rs.getBoolean("statusCartao");
                
                    System.out.println("ID: " + resultId + ", Nome: " + resultNome + ", Email: " + resultEmail + ", Status do Cartao: " + (resultStatusCartao ? "Ativo" : "Inativo"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao consultar dados da tabela cadastros: " + e.getMessage());
        }
    }

    
    public static void main(String[] args) {
        //inserirPreCadastro("Bia Braico", "senhaaa", "foto_url3", "braico@gmail.com", 12345678903L, 3);
       //                               (String nome, String senha, String foto, String email, long matricula)
       
        //inserirCadastro("Bernardo Brando", "senh", "foto_url4", "bernardoB@email.com", 12345678904L, 654321, true, 1);
        //                         (String nome, String senha, String foto, String email, long matricula, int codigoCartao, boolean statusCartao) 

        
        //atualizarPreCadastro(2,"Bia Braicco", "senha", "foto_url3", "bbraico@gmail.com", 12345678903L);
       //                                   (int id, String nome, String senha, String foto, String email, long matricula)
       
        //atualizarCadastro(2, "Bernardo B. Brando", "senh", "foto_url4", "bernardoB@email.com", 12345678904L, 654321, true);
        //                            (int id, String nome, String senha, String foto, String email, long matricula, int codigoCartao, boolean statusCartao) 

        //consultarPreCadastro(null, null, null, null, "braico@gmail.com", null);
        //      (Integer id, String nome, String senha, String foto, String email, Long matricula,)  
        
        //consultarCadastro(null, null, null, null, null, null, null, true);
        //      (Integer id, String nome, String senha, String foto, String email, Long matricula, Integer codigoCartao, Boolean statusCartao)   
    }
}