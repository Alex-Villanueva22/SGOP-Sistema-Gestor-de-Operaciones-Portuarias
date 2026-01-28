/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author villa
 */
public class CConexion {
    Connection conectar;
    
    String usuario = "root";
    String contraseña = "GHMySQL22.11";
    String bd = "SistemaDeGestionDePuerto";
    String ip = "localhost";
    String puerto = "3306";
    
    String cadena = "jdbc:mysql://" + ip + ":" + puerto + "/" + bd;
    
    public Connection estableceConexion(){
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conectar = DriverManager.getConnection(cadena, usuario, contraseña);
            JOptionPane.showMessageDialog(null, "CONEXIÓN EXITOSA A LA BASE DE DATOS.");
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, "CONEXIÓN FALLIDA A LA BASE DE DATOS. ERROR: " + e.toString());
        }
        return conectar;
    }
}
