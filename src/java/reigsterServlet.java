/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.DB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sun.rmi.runtime.Log;


@MultipartConfig(maxFileSize = 16177215)
/**
 *
 * @author Alisher
 */
public class reigsterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            String email= request.getParameter("email");
            String name=request.getParameter("name");
            String surname = request.getParameter("surname");
            String password=request.getParameter("password");
            
            InputStream inputStream =null;
            
            Part filePart = request.getPart("image");
            
            if(filePart!=null){
                System.out.print(filePart.getContentType());
                inputStream = filePart.getInputStream();
                
            }
            
        
        try (PrintWriter out = response.getWriter()) {
        
            DB db= new DB();
            Connection conn = db.Connection();
            
            String sql = "INSERT INTO profile (email,name,surname,image,password) values (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,name);
            ps.setString(3,surname);
            
            if(inputStream !=null){
                ps.setBinaryStream(4, inputStream,(int) filePart.getSize());
            }
            ps.setString(5,password);
            int row = ps.executeUpdate();
            if(row>0){
                conn.close();
                
                RequestDispatcher rs = request.getRequestDispatcher("login.html");
                rs.forward(request, response);
            }else{
                conn.close();
                RequestDispatcher rs = request.getRequestDispatcher("login.html");
                rs.include(request, response);
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
