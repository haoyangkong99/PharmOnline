/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author User
 */
public class editPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String renewpassword = request.getParameter("renewpassword");
        
        
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("user");
        
        String username = user.getUsername();
        
        
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        
        String query = "SELECT password FROM user WHERE username=\""+ username + "\"";
        
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        String currPW = "";
        
        while(rs.next()){
            currPW = rs.getString(1);
        }
        
        
        if(!currPW.equals(password)){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Current password is incorrect!');");
            out.println("location='Profile.jsp';");
            out.println("</script>");
        }
        else{
            
            if(!newpassword.equals(renewpassword)){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('New passwords does not match!');");
                out.println("location='Profile.jsp';");
                out.println("</script>");
            }
            else{
                user.setPassword(newpassword);
                
                try{
                    user.updatePassword();
                }
                catch(ClassNotFoundException e){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Update Failed, ClassNotFoundException!');");
                    out.println("location='Profile.jsp';");
                    out.println("</script>");
                }
                catch(SQLException e){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Update Failed, SQLException!');");
                    out.println("location='Profile.jsp';");
                    out.println("</script>");
                }
                
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password updated successfully! Please login again.');");
                out.println("location='Logout';");
                out.println("</script>");  
                
                
                
            }
            
        }
            
        st.close();
        con.close();

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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
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
