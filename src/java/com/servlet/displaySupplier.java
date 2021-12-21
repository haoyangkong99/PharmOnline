/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author haoya
 */
@WebServlet(name = "displaySupplier", urlPatterns = {"/displaySupplier"})
public class displaySupplier extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="SELECT * FROM Supplier";
        
           Class.forName(driver);
           Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(query);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int counter=0;
            while (rs.next())
            {
                
                counter++;
                
                out.println("<tr>");
               out.println("<th>No</th><th>Supplier Name</th><th>Supplier ID</th><th>Contact No</th><th>Address</th><th>Description</th><th>Join Date</th><th>Action</th>");
                out.println("</tr>");
               
                out.println("<tr>");
                out.println("<td>"+Integer.toString(counter)+"</td>");
       out.println("<td>"+rs.getString(1)+"</td>");
                                 out.println("<td>"+rs.getString(2)+"</td>");
                                  out.println("<td>"+rs.getString(3)+"</td>");
                                   out.println("<td>"+rs.getString(4)+"</td>");
                                     out.println("<td>"+rs.getString(5)+"</td>");
                                    out.println("<td>"+rs.getDate(6).toString()+"</td>");
                                    
                                    out.println( 
                                    "<td> "+"<div style='display: block;'>");
                                    out.println("<a href='deleteSupplier?id="+rs.getString(2)+"' onclick=' return confirm("+'"'+"Are you sure to delete this supplier"+'"'+")"+
                                            "'>");
                                    out.println( "<i class='bx bxs-trash'></i>");
                                    out.println("</a>");
                                    out.println("<a href='editSupplier?id="+rs.getString(2)+"' >");
                                    out.println( "<i class='bx bxs-edit'></i>");
                                    out.println("</a>");
                                   
                                    out.println("</div></td>");
                                    
                                          
                                          
                                    
            out.println("</tr>");
            
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
            Logger.getLogger(displaySupplier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(displaySupplier.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(displaySupplier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(displaySupplier.class.getName()).log(Level.SEVERE, null, ex);
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
