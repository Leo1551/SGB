package sgb.model.dao;

import java.sql.*;
import sgb.model.dto.Saldo;

/**
 *
 * @author Bruno
 */
public class SaldoDAO {
    private String url = "jdbc:mysql://localhost:3306/sgb";
    private String usuario = "root";
    private String senha = "";
    private String driver = "com.mysql.cj.jdbc.Driver";
    

    //public Saldo getSaldoId(String userId) {
        //Saldo saldo = null;
    public Connection conectar() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, usuario, senha);
        } catch (Exception e) {
            System.out.println(e);
            con = null;
        }
        //return saldo; 
        return con;
    }
    public void testeConexao() {
        try {
            Connection con = conectar();
            System.out.println(con);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
