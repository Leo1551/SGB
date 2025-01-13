package sgb.model.dto;

public class Matricula {;
    private String nome;
    private String senha;
    private String foto;
    private String email;
    private Long matricula;
    private String cpf;
    private int codigoCartao;
    private boolean statusCartao;
    
    public Matricula(String nome, String senha, String foto, String email, long matricula, String cpf, int codigoCartao, boolean statusCartao) {
        this.nome = nome;
        this.senha = senha;
        this.foto = foto;
        this.email = email;
        this.matricula = matricula;
        this.cpf = cpf;
        this.codigoCartao = codigoCartao;
        this.statusCartao = statusCartao;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getSenha() {
        return senha;
    }
    
    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public String getFoto() {
        return foto;
    }
    
    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public Long getMatricula() {
        return matricula;
    }
    public void setMatricula(Long matricula) {
        this.matricula = matricula;
    }
    
    public String getCpf() {
        return cpf;
    }
    
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    public int getCodigoCartao() {
        return codigoCartao;
    }
    
    public void setCodigoCartao(int codigoCartao ) {
        this.codigoCartao = codigoCartao;
    }
    
    public boolean getStatusCartao() {
        return statusCartao;
    }
    
    public void setStatusCartao(boolean statusCartao ) {
        this.statusCartao = statusCartao;
    }
    
}
