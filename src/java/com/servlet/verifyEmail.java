/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.bean.Mailer;
import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class verifyEmail extends HttpServlet {

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
        
        String enteredEmail = request.getParameter("enteredEmail");
        
        User user = new User();
        
        user.setEmail(enteredEmail);
        
        try{
            if(!(user.verifyEmail())){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('This Email address had not been used to register a PharmOnline account.');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } 
            else{
                // It will generate 6 digit random Number.
                // from 0 to 999999
                Random rnd = new Random();
                int number = rnd.nextInt(999999);

                // this will convert any number sequence into 6 character.
                String otp = String.format("%06d", number);
                
                HttpSession session = request.getSession();
                session.setAttribute("otp", otp);
                session.setAttribute("otpEmail", user.getEmail());
                
                String to = user.getEmail();  
                String subject = "Your PharmOnline OTP";  
                String msg = "Your PharmOnline OTP is " + otp;  

                Mailer.send(to, subject, msg);  
                
                
                RequestDispatcher rd = request.getRequestDispatcher("otp.jsp");
                rd.forward(request, response);
            }
        }
        catch (SQLException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('An SQLException was thrown."+ e.getMessage() +"');");
            out.println("location='login.jsp';");
            out.println("</script>");        
        }
        catch (ClassNotFoundException e){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('A ClassNotFoundException was thrown."+ e.getMessage() +"');");
            out.println("location='login.jsp';");
            out.println("</script>");
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
