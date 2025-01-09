package sgb.model.dto;

import java.util.Date;

public class Transacao {

    private long matricula;
    /*O valor da transação e o saldo é guardado em centavos, por isso int. Isso é feito 
    para evitar pontos flutuantes, os erros em suas operações e gasto de memória*/
    private int valor;
    private java.util.Date data;
    private String funcionario;
    private int saldo;

    public Transacao(long matricula, int valor, String funcionario, int saldo) {
        this.matricula = matricula;
        this.valor = valor;
        this.data = new java.util.Date();
        this.funcionario = funcionario;
        this.saldo = saldo;
    }

    public Transacao(long matricula, int valor, Date data, String funcionario, int saldo) {
        this.matricula = matricula;
        this.valor = valor;
        this.data = data;
        this.funcionario = funcionario;
        this.saldo = saldo;
    }

    public Transacao(long matricula, int valor, java.sql.Timestamp data, String funcionario, int saldo) {
        this.matricula = matricula;
        this.valor = valor;
        this.data = new java.util.Date(data.getTime());
        this.funcionario = funcionario;
        this.saldo = saldo;
    }

    public long getMatricula() {
        return matricula;
    }

    public int getValor() {
        return valor;
    }

    public java.util.Date getData() {
        return data;
    }
    
    public String getFuncionario(){
        return funcionario;
    }
    
    public int getSaldo(){
        return saldo;
    }

    @Override
    public String toString() {
        String str = "matricula: " + matricula + "\nvalor: " + valor + "\ndata: " + data + "\nfuncionario:"+funcionario+"\nsaldo:"+saldo;
        return str;
    }

   
}
