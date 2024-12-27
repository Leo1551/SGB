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
    private static String url = "jdbc:mysql://192.168.100.31:3306/Alunos"; 
    private static String usuario = "admins";
    private static String senha = "123456"; 

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }

    public static void inserirPreCadastro(String nome, String senha, String foto, String email, long matricula) {
        String sql = "INSERT INTO precadastros (nome, senha, foto, email, matricula) VALUES (?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.executeUpdate();
            System.out.println("Dados inseridos na tabela precadastros!");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados na tabela precadastros: " + e.getMessage());
        }
    }

    public static void inserirCadastro(String nome, String senha, String foto, String email, long matricula, int codigoCartao, boolean statusCartao) {
        String sql = "INSERT INTO cadastros (nome, senha, foto, email, matricula, codigoCartao, statusCartao) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setInt(6, codigoCartao);
            stmt.setBoolean(7, statusCartao);
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

    public static void consultarPreCadastro() {
        String sql = "SELECT * FROM precadastros";
        try (Connection conexao = getConnection();
             Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                // printar o que for necessario
                System.out.println("ID: " + id + ", Nome: " + nome + ", E-mail: " + email);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao consultar dados da tabela precadastros: " + e.getMessage());
        }
    }

    public static void consultarCadastro() {
        String sql = "SELECT * FROM cadastros";
        try (Connection conexao = getConnection();
             Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                boolean statusCartao = rs.getBoolean("statusCartao");
                
                // printar o que for necessario
                System.out.println("ID: " + id + ", Nome: " + nome + ", Status do Cartão: " + (statusCartao ? "Ativo" : "Inativo"));
            }
        } catch (SQLException e) {
            System.out.println("Erro ao consultar dados da tabela cadastros: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        //inserirPreCadastro("Bia Braico", "senhaaa", "foto_url3", "braico@gmail.com", 12345678903L);
        //inserirCadastro("Bernardo Brando", "senh", "foto_url4", "bernardoB@email.com", 12345678904L, 654321, true);

        //atualizarPreCadastro(2,"Bia Braicco", "senha", "foto_url3", "bbraico@gmail.com", 12345678903L);
        //atualizarCadastro(2, "Bernardo B. Brando", "senh", "foto_url4", "bernardoB@email.com", 12345678904L, 654321, true);

        consultarPreCadastro();
        consultarCadastro();
    }
}