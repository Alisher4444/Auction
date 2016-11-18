import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alisher
 */

public class loginCheck {
    static boolean checkUser(String name, String pas) {
        boolean st=false;
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            ps = con.prepareStatement("select *from profile where email=? and password=?");
            ps.setString(1,name);
            ps.setString(2,pas);
            rs = ps.executeQuery();
            st=rs.next();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return st;
    }
    static String getName(String someone){
    
        String name=null;
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            st=con.prepareStatement("SELECT *FROM PROFILE WHERE EMAIL=?");
            st.setString(1,someone);
            
            rs=st.executeQuery();
            
            while(rs.next()){
            
                name=rs.getString("NAME");
                
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginCheck.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return name;
    }
    static String getSurname(String someone){
    
        String surname=null;
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            st=con.prepareStatement("SELECT *FROM PROFILE WHERE EMAIL=?");
            st.setString(1,someone);
            
            rs=st.executeQuery();
            
            while(rs.next()){
                surname=rs.getString("SURNAME");         
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginCheck.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return surname;
    }
    
}
