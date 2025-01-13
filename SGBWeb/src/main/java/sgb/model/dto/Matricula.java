/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dto;

/**
 *
 * @author usuario
 */
public class Matricula {
    private Long matricula;
    private String nome;
    
    public Matricula(Long matricula, String nome) {
        this.matricula = matricula;
        this.nome = nome;
    }
    
    public Long getMatricula() {
        return matricula;
    }
    public void setMatricula(Long matricula) {
        this.matricula = matricula;
    }
    
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
}
