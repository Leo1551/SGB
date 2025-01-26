/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.model.dto;

/**
 *
 * @author aluno
 */
public class RecSenha {
    private String matricula, senha, novaSenha;

    public String getMatricula() {
        return matricula;
    }

    public RecSenha(String matricula, String senha, String novaSenha) {
        this.matricula = matricula;
        this.senha = senha;
        this.novaSenha = novaSenha;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNovaSenha() {
        return novaSenha;
    }

    public void setNovaSenha(String novaSenha) {
        this.novaSenha = novaSenha;
    }
}
