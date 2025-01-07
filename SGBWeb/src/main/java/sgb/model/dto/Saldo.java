 package sgb.model.dto;

/**
 *
 * @author Bruno
 */
public class Saldo {
    private String nameUser;
    private Long id;
    private Integer saldo;
    private boolean status;
    
    public Saldo(String nome) {
        this.nameUser = nome;
        this.status = true;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Integer getSaldo() {
        return saldo;
    }
    
    public void setSaldo(Integer saldo) {
        this.saldo = saldo;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public boolean isBlocked() {
        return status;
    }
}
