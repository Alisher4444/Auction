<%-- 
    Document   : upload_page
    Created on : 10.11.2016, 10:26:16
    Author     : Alisher
--%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="image/jpg" %>

        <%
                  
        Blob file=null;
        byte[] fileData=null;
        String image=null;
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
              st=con.prepareStatement("SELECT *FROM AUCTION WHERE NAME=?");
            st.setString(1,session.getAttribute("search").toString());
            
            rs=st.executeQuery();
            
            
            if(rs.next()){
                file = rs.getBlob("image");
                fileData = file.getBytes(1,(int)file.length());
            } 
             response.setContentType("image/jpg");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
            OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                
            } catch (Exception ex) {
            ex.printStackTrace();
        }
                         

      %>
