/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnectionutil.org;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;


/**
 *
 * @author 7
 */
public class DbConnection {
    
    static String HOST ="jdbc:mysql://localhost/jsp";
    static String USER ="root";
    static String PASS ="";
    static Connection conn = null;
    
    public static Connection getConnection(){
        
        try{
           Class.forName("com.mysql.jdbc.Driver");
           conn = (Connection) DriverManager.getConnection(HOST, USER, PASS);
           
           System.out.println("Connected Successfully In DB");
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
}
