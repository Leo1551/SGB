/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.java;

import java.sql.*;
import sgb.model.dao.OpenBD;
import java.util.List;
import java.util.ArrayList;
import sgb.model.dto.PreCadastro;


public class ConexaoBD {
    private static String url = "jdbc:mysql://localhost:3306/sgb"; 
    private static String usuario = "root";
    private static String senha = ""; 

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }
    
    public static void criarTabelas() {
        String sqlPrecadastros = "CREATE TABLE IF NOT EXISTS precadastros (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "nome VARCHAR(100) NOT NULL," +
                "senha VARCHAR(100) NOT NULL," +
                "foto VARCHAR(255)," +
                "email VARCHAR(100) UNIQUE NOT NULL," +
                "matricula BIGINT NOT NULL," +
                "cpf VARCHAR(11) NOT NULL, " +  
                "UNIQUE (cpf)" +              
                ");";  

        String sqlCadastros = "CREATE TABLE IF NOT EXISTS cadastros (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "nome VARCHAR(100) NOT NULL," +
                "senha VARCHAR(100) NOT NULL," +
                "foto VARCHAR(255)," +
                "email VARCHAR(100) UNIQUE NOT NULL," +
                "matricula BIGINT NOT NULL," +
                "cpf VARCHAR(11) NOT NULL, " +  
                "codigoCartao INT NOT NULL," +
                "statusCartao BOOLEAN NOT NULL," +
                "UNIQUE (cpf)" +               
                ");";  

        try (Connection conexao = getConnection();
             Statement stmt = conexao.createStatement()) {
            stmt.execute(sqlPrecadastros);
            stmt.execute(sqlCadastros);
            System.out.println("Tabelas criadas ou já existem.");
        } catch (SQLException e) {
            System.out.println("Erro ao criar tabelas: " + e.getMessage());
        }
    }

        
    public static void excluirTabelas() {
        String sqlDropPrecadastros = "DROP TABLE IF EXISTS precadastros;";
        String sqlDropCadastros = "DROP TABLE IF EXISTS cadastros;";

        try (Connection conexao = getConnection();
             Statement stmt = conexao.createStatement()) {
            // Excluir as tabelas
            stmt.execute(sqlDropPrecadastros);
            stmt.execute(sqlDropCadastros);
            System.out.println("Tabelas excluídas com sucesso.");
        } catch (SQLException e) {
            System.out.println("Erro ao excluir tabelas: " + e.getMessage());
        }
    }

    public String inserirPreCadastro(String nome, String senha, String foto, String email, long matricula, String cpf) {
        String sql = "INSERT INTO precadastros (nome, senha, foto, email, matricula, cpf) VALUES (?, ?, ?, ?, ?, ?)";
        OpenBD op = new OpenBD();
        try(Connection conexao = op.getConnectionComDriver();
             PreparedStatement stmt = conexao.prepareStatement(sql);) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setString(6, cpf);
            stmt.executeUpdate();
            return ("Dados inseridos na tabela precadastros!");
        } catch (SQLException | ClassNotFoundException e) {
            {
                return ("Erro ao inserir dados na tabela precadastros: " + e.getMessage());
            } 
        }
    }

    public static void inserirCadastro(String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao) {
        String sql = "INSERT INTO cadastros (nome, senha, foto, email, matricula, cpf, codigoCartao, statusCartao) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setString(6, cpf);
            stmt.setInt(7, codigoCartao);
            stmt.setBoolean(8, statusCartao);
            stmt.executeUpdate();
            System.out.println("Dados inseridos na tabela cadastros!");
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                System.out.println("Erro: O CPF informado já está cadastrado em cadastros.");
            } else {
                System.out.println("Erro ao inserir dados na tabela cadastros: " + e.getMessage());
            }
        }
    }

    public static void atualizarPreCadastro(int id, String nome, String senha, String foto, String email, long matricula, String cpf) {
        String sql = "UPDATE precadastros SET nome = ?, senha = ?, foto = ?, email = ?, matricula = ?, cpf = ? WHERE id = ?";
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setString(6, cpf); 
            stmt.setInt(7, id);
            stmt.executeUpdate();
            System.out.println("Pre Cadastro atualizado com sucesso");
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar dados na tabela precadastros: " + e.getMessage());
        }
    }
    
    public static void atualizarCadastro(int id, String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao) {
        String sqlCheckEmail = "SELECT email, cpf FROM cadastros WHERE id = ?";

        String emailExistente = null;
        String cpfExistente = null;

        try (Connection conexao = getConnection();
             PreparedStatement stmtCheck = conexao.prepareStatement(sqlCheckEmail)) {
            stmtCheck.setInt(1, id);
            try (ResultSet rs = stmtCheck.executeQuery()) {
                if (rs.next()) {
                    emailExistente = rs.getString("email");
                    cpfExistente = rs.getString("cpf");
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao buscar dados existentes: " + e.getMessage());
            return;
        }

        boolean emailAlterado = (emailExistente != null && !emailExistente.equals(email));
        boolean cpfAlterado = (cpfExistente != null && !cpfExistente.equals(cpf));

        if (emailAlterado) {
            String sqlCheckEmailExistente = "SELECT COUNT(*) FROM cadastros WHERE email = ? AND id != ?";
            try (Connection conexao = getConnection();
                 PreparedStatement stmtCheckEmail = conexao.prepareStatement(sqlCheckEmailExistente)) {
                stmtCheckEmail.setString(1, email);
                stmtCheckEmail.setInt(2, id);
                try (ResultSet rs = stmtCheckEmail.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        System.out.println("Erro: O email '" + email + "' já está em uso.");
                        return;
                    }
                }
            } catch (SQLException e) {
                System.out.println("Erro ao verificar email: " + e.getMessage());
                return;
            }
        }

        if (cpfAlterado) {
            String sqlCheckCpfExistente = "SELECT COUNT(*) FROM cadastros WHERE cpf = ? AND id != ?";
            try (Connection conexao = getConnection();
                 PreparedStatement stmtCheckCpf = conexao.prepareStatement(sqlCheckCpfExistente)) {
                stmtCheckCpf.setString(1, cpf);
                stmtCheckCpf.setInt(2, id);
                try (ResultSet rs = stmtCheckCpf.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        System.out.println("Erro: O CPF '" + cpf + "' já está em uso.");
                        return;
                    }
                }
            } catch (SQLException e) {
                System.out.println("Erro ao verificar CPF: " + e.getMessage());
                return;
            }
        }

        StringBuilder sqlUpdate = new StringBuilder("UPDATE cadastros SET nome = ?, senha = ?, foto = ?, ");
        int paramIndex = 4;

        if (emailAlterado) {
            sqlUpdate.append("email = ?, ");
            paramIndex++;
        }
        if (cpfAlterado) {
            sqlUpdate.append("cpf = ?, ");
            paramIndex++;
        }

        sqlUpdate.append("matricula = ?, codigoCartao = ?, statusCartao = ? WHERE id = ?");

        try (Connection conexao = getConnection();
             PreparedStatement stmtUpdate = conexao.prepareStatement(sqlUpdate.toString())) {

            stmtUpdate.setString(1, nome);
            stmtUpdate.setString(2, senha);
            stmtUpdate.setString(3, foto);

            if (emailAlterado) stmtUpdate.setString(4, email);
            if (cpfAlterado) stmtUpdate.setString(paramIndex++, cpf);

            stmtUpdate.setLong(paramIndex++, matricula);
            stmtUpdate.setInt(paramIndex++, codigoCartao);
            stmtUpdate.setBoolean(paramIndex++, statusCartao);
            stmtUpdate.setInt(paramIndex, id);

            stmtUpdate.executeUpdate();
            System.out.println("Cadastro atualizado com sucesso.");
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar dados na tabela cadastros: " + e.getMessage());
        }
    }
    
    public static List<PreCadastro> consultarPreCadastro(
            Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf) {

        List<PreCadastro> listaPreCadastros = new ArrayList<>();
        String sql = "SELECT * FROM precadastros WHERE 1=1";

        List<Object> parametros = new ArrayList<>();

        if (id != null) {
            sql += " AND id = ?";
            parametros.add(id);
        }
        if (nome != null) {
            sql += " AND nome LIKE ?";
            parametros.add("%" + nome + "%");
        }
        if (senha != null) {
            sql += " AND senha = ?";
            parametros.add(senha);
        }
        if (foto != null) {
            sql += " AND foto = ?";
            parametros.add(foto);
        }
        if (email != null) {
            sql += " AND email = ?";
            parametros.add(email);
        }
        if (matricula != null) {
            sql += " AND matricula = ?";
            parametros.add(matricula);
        }
        if (cpf != null) {
            sql += " AND cpf = ?";
            parametros.add(cpf);
        }

        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {

            for (int i = 0; i < parametros.size(); i++) {
                stmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    PreCadastro preCadastro = new PreCadastro();
                    preCadastro.setId(rs.getInt("id"));
                    preCadastro.setNome(rs.getString("nome"));
                    preCadastro.setSenha(rs.getString("senha"));
                    preCadastro.setFoto(rs.getString("foto"));
                    preCadastro.setEmail(rs.getString("email"));
                    preCadastro.setMatricula(rs.getLong("matricula"));
                    preCadastro.setCpf(rs.getString("cpf"));
                    listaPreCadastros.add(preCadastro);
                }
            }

        } catch (SQLException e) {
            System.err.println("Erro ao consultar os dados: " + e.getMessage());
        }
        return listaPreCadastros;
    }

        
    public static void consultarCadastro(Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf, Integer codigoCartao, Boolean statusCartao) {
        StringBuilder sql = new StringBuilder("SELECT * FROM cadastros WHERE 1=1");

        if (id != null) sql.append(" AND id = ?");
        if (nome != null) sql.append(" AND nome LIKE ?");
        if (senha != null) sql.append(" AND senha = ?");
        if (foto != null) sql.append(" AND foto = ?");
        if (email != null) sql.append(" AND email = ?");
        if (matricula != null) sql.append(" AND matricula = ?");
        if (codigoCartao != null) sql.append(" AND codigoCartao = ?");
        if (statusCartao != null) sql.append(" AND statusCartao = ?");
        if (cpf != null) sql.append(" AND cpf = ?");

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
            if (cpf != null) stmt.setString(paramIndex++, cpf); // Consultando pelo CPF

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int resultId = rs.getInt("id");
                    String resultNome = rs.getString("nome");
                    String resultEmail = rs.getString("email");
                    boolean resultStatusCartao = rs.getBoolean("statusCartao");
                    String resultCpf = rs.getString("cpf"); // Incluindo CPF na consulta

                    System.out.println("ID: " + resultId + ", Nome: " + resultNome + ", Email: " + resultEmail + ", Status do Cartao: " + (resultStatusCartao ? "Ativo" : "Inativo") + ", CPF: " + resultCpf);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao consultar dados da tabela cadastros: " + e.getMessage());
        }
    }

    
    public static void main(String[] args) {
        /*
        excluirTabelas();
        
        criarTabelas();
        
        //(String nome, String senha, String foto, String email, long matricula, String cpf) 
        inserirPreCadastro("Ana Faria", "abc123def456!", "foto_1.jpg", "ana.faria2104@gmail.com", 20232030123L, "73291008030");
        inserirPreCadastro("Beatriz Ferreira", "capricornio*", "foto_2.jpg", "biaaferreir@hotmail.com", 20231231253L, "92445426090");
        inserirPreCadastro("Bernardo Almeida", "jkSAGsf986!@#", "foto_3.jpg", "braico@outlook.com", 20239785308L, "67966291081");
        inserirPreCadastro("Carlos Oliveira", "qwerty12345!", "foto_4.jpg", "carlos.oliveira@yahoo.com", 20230517145L, "87342179022");
        inserirPreCadastro("Daniela Costa", "danielaf123!", "foto_5.jpg", "daniela.costa@gmail.com", 20230812975L, "86901427021");
        inserirPreCadastro("Eduardo Pinto Silva", "eduardo$321", "foto_6.jpg", "edu.pinto@outlook.com", 20231245100L, "76258023015");
        inserirPreCadastro("Fernanda Silva", "fer1235!@#", "foto_7.jpg", "fernanda.silva@email.com", 20231567192L, "58301572049");
        inserirPreCadastro("Gustavo Pereira", "gustav0_789", "foto_8.jpg", "gustavo.pereira@gmail.com", 20230813204L, "49567891065");
        inserirPreCadastro("Heloisa Souza", "helo1234!", "foto_9.jpg", "helo.souza@live.com", 20231105720L, "31549023763");
        inserirPreCadastro("Isabela Lima", "isabela12@56", "foto_10.jpg", "isa.lima@uol.com.br", 20230964783L, "58437291014");
        inserirPreCadastro("Juliana Rocha", "julianar@123", "foto_11.jpg", "j.rocha@outlook.com", 20231284090L, "67958452039");
        inserirPreCadastro("Kleber Santos", "kleber!@#789", "foto_12.jpg", "kleber.santos@hotmail.com", 20231093481L, "91302657071");
        inserirPreCadastro("Luciana Martins", "luciana.123", "foto_13.jpg", "luciana.martins@gmail.com", 20231200411L, "21409785021");
        inserirPreCadastro("Marcelo Silva", "marcel0!321", "foto_14.jpg", "marcelo.silva@live.com", 20231788599L, "12039854218");
        inserirPreCadastro("Natália Freitas", "natalia!f09", "foto_15.jpg", "nat.frietas@outlook.com", 20230650978L, "33472801098");
        inserirPreCadastro("Otávio Costa", "otavio@123", "foto_16.jpg", "otavio.costa@yahoo.com", 20231224854L, "94715078356");
        inserirPreCadastro("Paula Rocha", "paula1234!", "foto_17.jpg", "paula.rocha@gmail.com", 20230975342L, "20984635072");
        inserirPreCadastro("Quelly Almeida", "quelyssa@321", "foto_18.jpg", "quelyssa.a@live.com", 20231230111L, "68092405314");
        inserirPreCadastro("Rafael Souza", "rafael01@#35", "foto_19.jpg", "rafael.souza@uol.com.br", 20230847210L, "47325018906");
        inserirPreCadastro("Sofia Martins", "sofia12!@3", "foto_20.jpg", "sofia.martins@outlook.com", 20231023761L, "86049726322");

        //(String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao) 
        inserirCadastro("Caio Silva Lopes", "0910lopess123%#*", "foto_21.jpg", "caioSilvaaaLope@gmail.com", 20230263912L, "23483874097", 654321, true);
        inserirCadastro("Larissa Oliveira", "1234567!@#", "foto_22.jpg", "larissa.oliveira@gmail.com", 20230587943L, "10928374615", 123456, true);
        inserirCadastro("Joaquim Almeida", "j0aquiM1234!", "foto_23.jpg", "joaquim.almeida@outlook.com", 20231294856L, "40957286111", 789012, true);
        inserirCadastro("Paula Ribeiro", "r1beiro@321", "foto_24.jpg", "paula.ribeiro@hotmail.com", 20230918377L, "57392018461", 112233, true);
        inserirCadastro("Fábio Silva", "fabio12@ss!", "foto_25.jpg", "fabio.silva@live.com", 20231798421L, "98571234601", 221133, true);
        inserirCadastro("Letícia Mendes", "letmendes123#", "foto_26.jpg", "leticia.mendes@outlook.com", 20231240589L, "82739162410", 987654, true);
        inserirCadastro("Vitor Souza", "vitorSOZa@321", "foto_27.jpg", "vitor.souza@gmail.com", 20231122345L, "76250491837", 354879, true);
        inserirCadastro("Renata Costa", "renatacosta!@#", "foto_28.jpg", "renata.costa@uol.com.br", 20231437650L, "35958274109", 543210, true);
        inserirCadastro("Ricardo Martins", "ricardom!1t@345", "foto_29.jpg", "ricardo.martins@outlook.com", 20230945781L, "62483501724", 675849, true);
        inserirCadastro("Tatiane Rocha", "tati@1234", "foto_30.jpg", "tatiane.rocha@live.com", 20231359862L, "57192083650", 987321, true);
        inserirCadastro("Juliana Costa", "ju@123456", "foto_31.jpg", "juliana.costa@gmail.com", 20231648572L, "46739258090", 112489, true);
        inserirCadastro("Lucas Almeida", "lucasA21@#", "foto_32.jpg", "lucas.almeida@outlook.com", 20231049560L, "39648020359", 314159, true);
        inserirCadastro("Mariana Pinto", "maripinto!@#", "foto_33.jpg", "mariana.pinto@yahoo.com", 20231274214L, "71094685310", 625781, true);
        inserirCadastro("Rogério Ferreira", "rogerioF@2021", "foto_34.jpg", "rogerio.ferreira@uol.com.br", 20230126480L, "86243150907", 758439, true);
        inserirCadastro("Bruna Souza", "brunaSOZ@2023", "foto_35.jpg", "bruna.souza@live.com", 20231085261L, "92045718360", 926374, true);
        inserirCadastro("Guilherme Oliveira", "guilherme2023#", "foto_36.jpg", "guilherme.oliveira@gmail.com", 20230572384L, "73498129561", 328641, true);
        inserirCadastro("Karina Lima", "karinaL@567", "foto_37.jpg", "karina.lima@outlook.com", 20231493685L, "38927456120", 467532, true);
        inserirCadastro("Rodrigo Alves", "rodrigoA@111", "foto_38.jpg", "rodrigo.alves@gmail.com", 20231215679L, "52603948123", 912389, true);
        inserirCadastro("Camila Freitas", "camilaF@2024", "foto_39.jpg", "camila.freitas@uol.com.br", 20231134876L, "67492038476", 239847, true);
        inserirCadastro("Sérgio Santos", "sergi0!321", "foto_40.jpg", "sergio.santos@live.com", 20230678459L, "81237509462", 148725, true);

        
        
        atualizarPreCadastro(1, "Ana Silva Faria", "abc123def456!", "foto_1.jpg", "ana.faria2104@gmail.com", 20232030123L, "73291008030");
         //      (int id, String nome, String senha, String foto, String email, long matricula, String cpf)
         
        atualizarCadastro(1, "Caio Lopes", "0910lopess123%#*", "foto_21.jpg", "caioSilvaaaLope@gmail.com", 20230263912L, "23483874097", 654321, true);
        //      (int id, String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao)
        */
        //consultarPreCadastro(null, null, null, null, null, null, null);
        //      (Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf)
        
       // consultarCadastro(null, null, null, null, null, null, "23483874097", null, null);*/
        //      (Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf, Integer codigoCartao, Boolean statusCartao) {
    }
}