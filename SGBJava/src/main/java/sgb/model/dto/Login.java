/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dto;

/**
 *
 * @author aluno
 */
public class Login {
    
    // apenas get, set e construtor dos dados do formulário
    
    private String matricula;
    private String senha;

    public String getMatricula() {
        return matricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Login(String matricula, String senha) {
        this.matricula = matricula;
        this.senha = senha;
    }
    
    
    
}
