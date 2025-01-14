 package sgb.model.dto;

/**
 *
 * @author Bruno
 */
public class Saldo {
    private Long matricula;
    private Double saldo;
    private String nome;
    private boolean status;
    
    public Saldo(Long matricula, double saldo) {
        this.matricula = matricula;
        this.saldo = saldo;
        this.status = true;
    }
    
    
    public Long getMatricula() {
        return matricula;
    }
    
    public void setMatricula(Long matricula) {
        this.matricula = matricula;
    }
    
    public Double acrescimoSaldo(Double saldoAcrescentado) {
        return this.saldo + saldoAcrescentado;
    }
    
    public Double getSaldo() {
        return saldo;
    }
    
    public void setSaldo(Double novoSaldo) {
        this.saldo = novoSaldo;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public boolean isBlocked() {
        return status;
    }
}
