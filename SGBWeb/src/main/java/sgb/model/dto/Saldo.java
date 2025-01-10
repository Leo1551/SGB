 package sgb.model.dto;

/**
 *
 * @author Bruno
 */
public class Saldo {
    //private String nameUser;
    private int id;
    private Double saldo;
    private boolean status;
    
    public Saldo(int id, int saldo) {
        //this.nameUser = nome;
        this.status = true;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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
