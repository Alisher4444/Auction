/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alisher
 */
public class DB {
    
     public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            String myBase = "jdbc:mysql://localhost:3306/base";
            Connection myConnection = DriverManager.getConnection(myBase,"root","qwerty");
            
            return myConnection;
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
    
    
}
