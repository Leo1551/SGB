package sgb.model.dto;

import java.util.Date;

public class Transacao {
    private long matricula;
    /*O valor da transação é guardado em centavos, por isso int. Isso é feito 
    para evitar pontos flutuantes, os erros em suas operações e gasto de memória*/
    private int valor;
    private java.util.Date data;
    
    public Transacao (long matricula, int valor){
        this.matricula=matricula;
        this.valor=valor;
        this.data= new java.util.Date();
    }
    
    
    public String toString(){
        String str="matricula: "+matricula+"\nvalor: "+valor+"\ndata: "+data+"\n";
        return str;
    }
    
    public static void main(String[] args){
        System.out.println(new Transacao(31232132213321L, 32));
    }
}
