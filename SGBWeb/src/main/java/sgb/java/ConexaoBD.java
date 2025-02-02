package sgb.java;

import java.sql.*;
import sgb.model.dao.OpenBD;
import java.util.List;
import java.util.ArrayList;
import sgb.model.dto.PreCadastro;
import sgb.model.dto.Cadastro;
import sgb.model.dto.Gestor;
import sgb.model.dto.Funcionario;

public class ConexaoBD {

    private static String url = "jdbc:mysql://localhost:3306/sgb";
    private static String usuario = "root";
    private static String senha = "";

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }

    public String inserirPreCadastro(String nome, String senha, String foto, String email, long matricula, String cpf) {

        //Leonardo: Hashing da senha
        senha = HashMD5.criptografar(senha);
        //só isso

        String sql = "INSERT INTO precadastros (nome, senha, foto, email, matricula, cpf) VALUES (?, ?, ?, ?, ?, ?)";
        OpenBD op = new OpenBD();
        try (Connection conexao = op.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql);) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.setString(3, foto);
            stmt.setString(4, email);
            stmt.setLong(5, matricula);
            stmt.setString(6, cpf);
            stmt.executeUpdate();
            return ("Seu cadastro foi realizado com sucesso!");
        } catch (SQLException | ClassNotFoundException e) {
            {
                return ("Erro ao inserir dados na tabela precadastros: " + e.getMessage());
            }
        }
    }

    public static void inserirCadastro(String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao) {

        //Leonardo: Hashing da senha
        senha = HashMD5.criptografar(senha);
        //só isso

        String sql = "INSERT INTO cadastros (nome, senha, foto, email, matricula, cpf, codigoCartao, statusCartao) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conexao = getConnection(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
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
        try (Connection conexao = getConnection(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
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

        //Leonardo: Hashing da senha
        senha = HashMD5.criptografar(senha);
        //só isso

        String sqlCheckEmail = "SELECT email, cpf FROM cadastros WHERE id = ?";

        String emailExistente = null;
        String cpfExistente = null;

        try (Connection conexao = getConnection(); PreparedStatement stmtCheck = conexao.prepareStatement(sqlCheckEmail)) {
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
            try (Connection conexao = getConnection(); PreparedStatement stmtCheckEmail = conexao.prepareStatement(sqlCheckEmailExistente)) {
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
            try (Connection conexao = getConnection(); PreparedStatement stmtCheckCpf = conexao.prepareStatement(sqlCheckCpfExistente)) {
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

        try (Connection conexao = getConnection(); PreparedStatement stmtUpdate = conexao.prepareStatement(sqlUpdate.toString())) {

            stmtUpdate.setString(1, nome);
            stmtUpdate.setString(2, senha);
            stmtUpdate.setString(3, foto);

            if (emailAlterado) {
                stmtUpdate.setString(4, email);
            }
            if (cpfAlterado) {
                stmtUpdate.setString(paramIndex++, cpf);
            }

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

        try {
            OpenBD openBD = new OpenBD();
            try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

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
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Erro ao carregar o driver do banco de dados: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Erro ao consultar os dados: " + e.getMessage());
        }

        return listaPreCadastros;
    }

    public static List<Cadastro> consultarCadastro(
            Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf, Integer codigoCartao, Boolean statusCartao) {

        List<Cadastro> listaCadastros = new ArrayList<>();
        String sql = "SELECT * FROM cadastros WHERE 1=1";

        List<Object> parametros = new ArrayList<>();

        if (id != null) {
            sql += (" AND id = ?");
            parametros.add(id);
        }
        if (nome != null) {
            sql += (" AND nome LIKE ?");
            parametros.add("%" + nome + "%");
        }
        if (senha != null) {
            sql += (" AND senha = ?");
            parametros.add(senha);
        }
        if (foto != null) {
            sql += (" AND foto = ?");
            parametros.add(foto);
        }
        if (email != null) {
            sql += (" AND email = ?");
            parametros.add(email);
        }
        if (matricula != null) {
            sql += (" AND matricula = ?");
            parametros.add(matricula);
        }
        if (cpf != null) {
            sql += (" AND cpf = ?");
            parametros.add(cpf);
        }
        if (codigoCartao != null) {
            sql += (" AND codigoCartao = ?");
            parametros.add(codigoCartao);
        }
        if (statusCartao != null) {
            sql += (" AND statusCartao = ?");
            parametros.add(statusCartao);
        }

        try {
            OpenBD openBD = new OpenBD();
            try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

                for (int i = 0; i < parametros.size(); i++) {
                    stmt.setObject(i + 1, parametros.get(i));
                }

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Cadastro cadastro = new Cadastro();
                        cadastro.setId(rs.getInt("id"));
                        cadastro.setNome(rs.getString("nome"));
                        cadastro.setSenha(rs.getString("senha"));
                        cadastro.setFoto(rs.getString("foto"));
                        cadastro.setEmail(rs.getString("email"));
                        cadastro.setMatricula(rs.getLong("matricula"));
                        cadastro.setCpf(rs.getString("cpf"));
                        cadastro.setCodigoCartao(rs.getInt("codigoCartao"));
                        cadastro.setStatusCartao(rs.getBoolean("statusCartao"));

                        listaCadastros.add(cadastro);
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Erro ao carregar o driver do banco de dados: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Erro ao consultar os dados: " + e.getMessage());
        }

        return listaCadastros;
    }

    public static void aprovarPreCadastro(int id) {
        List<PreCadastro> preCadastros = consultarPreCadastro(id, null, null, null, null, null, null);

        if (preCadastros.isEmpty()) {
            System.err.println("Erro: Pré-cadastro com ID " + id + " não encontrado.");
            return;
        }

        PreCadastro preCadastro = preCadastros.get(0);

        int codigoCartao = gerarCodigoCartao(id);

        try {
            inserirCadastro(
                    preCadastro.getNome(),
                    preCadastro.getSenha(),
                    preCadastro.getFoto(),
                    preCadastro.getEmail(),
                    preCadastro.getMatricula(),
                    preCadastro.getCpf(),
                    codigoCartao,
                    true
            );

            excluirPreCadastro(id);

            System.out.println("Pré-cadastro com ID " + id + " aprovado e movido para cadastros.");
        } catch (Exception e) {
            System.err.println("Erro ao aprovar pré-cadastro com ID " + id + ": " + e.getMessage());
        }
    }

    private static int gerarCodigoCartao(int id) {
        return 100000 + (id % 900000);
    }

    private static void excluirPreCadastro(int id) {
        String sql = "DELETE FROM precadastros WHERE id = ?";
        OpenBD openBD = new OpenBD();
        try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int linhasAfetadas = stmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Pré-cadastro com ID " + id + " removido com sucesso.");
            } else {
                System.err.println("Erro: Nenhum pré-cadastro encontrado para o ID " + id);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao excluir pré-cadastro com ID " + id + ": " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Erro ao carregar o driver do banco de dados: " + e.getMessage());
        }
    }

    public int getProximoNumeroFoto() {
        String sql = "SELECT MAX(numero_foto) AS maior_foto "
                + "FROM ( "
                + "    SELECT CAST(SUBSTRING_INDEX(foto, '_', -1) AS UNSIGNED) AS numero_foto "
                + "    FROM cadastros "
                + "    WHERE foto LIKE 'foto_%' "
                + "    UNION ALL "
                + "    SELECT CAST(SUBSTRING_INDEX(foto, '_', -1) AS UNSIGNED) AS numero_foto "
                + "    FROM precadastros "
                + "    WHERE foto LIKE 'foto_%' "
                + ") AS todas_fotos";

        OpenBD openBD = new OpenBD();
        try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("maior_foto") + 1;
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Erro ao carregar o driver: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Erro ao buscar maior número de foto: " + e.getMessage());
        }

        return 0;
    }

    public static Gestor buscarGestor(int id) {
        String sql = "SELECT nome, senha, email, cpf FROM gestores WHERE id = ?";

        OpenBD openBD = new OpenBD();
        try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Gestor gestor = new Gestor();
                gestor.setNome(rs.getString("nome"));
                gestor.setSenha(rs.getString("senha"));
                gestor.setEmail(rs.getString("email"));
                gestor.setCpf(rs.getString("cpf"));
                return gestor;
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar gestor: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Erro: Driver do banco não encontrado - " + e.getMessage());
        }

        return null;
    }

    public static Funcionario buscarFuncionario(int id) {
        String sql = "SELECT nome, senha, email, cpf FROM funcionarios WHERE id = ?";

        OpenBD openBD = new OpenBD();
        try (Connection conexao = openBD.getConnectionComDriver(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setNome(rs.getString("nome"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setCpf(rs.getString("cpf"));
                return funcionario;
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar funcionario: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Erro: Driver do banco não encontrado - " + e.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {
        /*
        excluirTabelas();
        
        criarTabelas();
        
        atualizarPreCadastro(int id, String nome, String senha, String foto, String email, long matricula, String cpf)
         
        atualizarCadastro(int id, String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao)
        
        consultarPreCadastro(Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf)

        consultarCadastro(Integer id, String nome, String senha, String foto, String email, Long matricula, String cpf, Integer codigoCartao, Boolean statusCartao) 
         */
    }
}
