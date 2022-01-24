/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author User
 */
public class Register extends HttpServlet {

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
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phoneNum = request.getParameter("phoneNum");
        
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        
        String query = "SELECT * FROM user WHERE username=\""+ username + "\"";
        
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        if(rs.next()){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('The username is already taken.');");
            out.println("location='register.jsp';");
            out.println("</script>");
        }
        
        else{
            query = "SELECT * FROM user WHERE userType=\"Customer\"";

            st = con.createStatement();
            rs = st.executeQuery(query);

            int size=0;

            if(rs != null){
                rs.last();
                size = rs.getRow();
            }

            st.close();
            con.close();

            String userID = "C" + String.valueOf(size + 1); 


            User newUser = new User();

            newUser.setUserID(userID);
            newUser.setFullname(fullname);
            newUser.setEmail(email);
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setPhoneNum(phoneNum);
            newUser.setUserType("Customer");

            newUser.insertIntoDB();

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration Successful!');");
            out.println("location='login.jsp';");
            out.println("</script>");            
        }
        

        
//        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
//        rd.include(request,response);
        
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Register</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
