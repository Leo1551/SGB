/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sgb.java;

import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leonardo
 */
public class HashMD5 {

    public static String criptografar(String senha) {

        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(senha.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : md5.digest()) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException ex) {
           Logger.getLogger(HashMD5.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Erro de hashing!";
    }
}
