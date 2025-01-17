/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dto;
import java.time.YearMonth;
/**
 *
 * @author usuario
 */
public class Cartao {
    private Long numCartao;
    private Integer codigo;
    //private YearMonth validade;
    private String senha;
    
    public Cartao(Long numCartao, Integer codigo, String senha) {
        this.numCartao = numCartao;
        this.codigo = codigo;
        //this.validade = validade;
        this.senha = senha;
    }
    
    public Long getNumCartao() {
        return numCartao;
    }
    
    public void setNumCartao(Long numCartao) {
        this.numCartao = numCartao;
    }
    
    public Integer getCodigo() {
        return codigo;
    }
    
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }
  /*  
    public YearMonth getValidade() {
        return validade;
    }
    
    public void setValidade(YearMonth validade) {
        this.validade = validade;
    }*/
    
    public String getSenha() {
        return senha;
    }
    
    public void setSenha(String senha) {
        this.senha = senha;
    }
}
