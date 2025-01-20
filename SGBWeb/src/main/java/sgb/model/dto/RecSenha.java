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
    private String cpf, senha, novaSenha;

    public String getCpf() {
        return cpf;
    }

    public RecSenha(String cpf, String senha, String novaSenha) {
        this.cpf = cpf;
        this.senha = senha;
        this.novaSenha = novaSenha;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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
