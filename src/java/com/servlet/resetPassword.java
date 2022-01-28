/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class resetPassword extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        User user = new User();
        
        String email = request.getParameter("email");
        
        user.setEmail(email);
        
        String newPW = request.getParameter("newPW");
        String renewPW = request.getParameter("renewPW");
        
        if(!newPW.equals(renewPW)){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Passwords do not match! Please try again.');");
            out.println("location='reset-password.jsp';");
            out.println("</script>");
        }
        
        else{
            
            try{
                if(user.resetPassword(renewPW)){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your password has been reset successfully!');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('An unexpected error occured, please try again later.');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                }
            }
            catch (ClassNotFoundException e){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ClassNotFoundException');");
                out.println("location='reset-password.jsp';");
                out.println("</script>");
            }
            catch (SQLException e){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SQL Exception."+e.getMessage()+"');");
                out.println("location='reset-password.jsp';");
                out.println("</script>");
            }
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
