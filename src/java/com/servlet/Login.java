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
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
/**
 *
 * @author User
 */
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
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
        
        if(!(rs.next())){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Username or Password! Please try again.');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
        else{
            String correctPW = rs.getString(7);
            
            if(!(password.equals(correctPW))){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Username or Password! Please try again.');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }
            
            else{
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setFullname(rs.getString(2));
                user.setPhoneNum(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setUserType(rs.getString(5));
                user.setUserID(rs.getString(6));
                
                session.setAttribute("user", user);
                session.setAttribute("loggedIn", "True");
                
                if(user.getUserType().equals("Customer")){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login Successful! Welcome, "+user.getFullname()+"');");
                    out.println("location='viewproduct.jsp';");
                    out.println("</script>"); 
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login Successful! Welcome, "+user.getFullname()+"');");
                    out.println("location='indexAdmin.jsp';");
                    out.println("</script>"); 
                }
            }
        }
        
        st.close();
        con.close();
        
//        try () {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Login</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
