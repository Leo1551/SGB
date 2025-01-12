 package sgb.model.dto;

/**
 *
 * @author Bruno
 */
public class Saldo {
    //private String nameUser;
    private Long matricula;
    private Double saldo;
    private boolean status;
    
    public Saldo(Long matricula, double saldo) {
        //this.nameUser = nome;
        this.matricula = matricula;
        this.saldo = saldo;
        this.status = true;
    }
    
    public Long getId() {
        return matricula;
    }
    
    public void setId(Long matricula) {
        this.matricula = matricula;
    }
    
    public Double getSaldo() {
        return saldo;
    }
    
    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public boolean isBlocked() {
        return status;
    }
}
