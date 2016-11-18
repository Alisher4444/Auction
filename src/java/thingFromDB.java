/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alisher
 */
public class thingFromDB {
    
    static void getAuctionDB(String something,PrintWriter out){
        Connection con=null;
        String name=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            st=con.prepareStatement("SELECT *FROM AUCTION WHERE NAME=?");
            st.setString(1,something);
            rs=st.executeQuery();
        
            while(rs.next())
            {
                out.print("<h6>"+rs.getString("NAME")+"</h6>");
            }            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
    
    
    
}
