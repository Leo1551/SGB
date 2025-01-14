package sgb.model.dto;

public class PreCadastro {;
    private Integer id;
    private String nome;
    private String senha;
    private String foto;
    private String email;
    private Long matricula;
    private String cpf;
    
    public PreCadastro() {}
    
    public PreCadastro(Integer id, String nome, String senha, String foto, String email, long matricula, String cpf) {
        this.id = id;
        this.nome = nome;
        this.senha = senha;
        this.foto = foto;
        this.email = email;
        this.matricula = matricula;
        this.cpf = cpf;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
    
}
