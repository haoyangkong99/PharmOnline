/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author haoya
 */
@WebServlet(name = "addSupplier", urlPatterns = {"/addSupplier"})
public class addSupplier extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("suppliername");
        String contact=request.getParameter("contact");
        String address=request.getParameter("address");
        String description=request.getParameter("description");
        java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
         java.sql.Date sqlDate = new java.sql.Date(date.getTime());       
           String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query = "SELECT count(*) FROM Supplier";
        String queryx="INSERT INTO Supplier (supplierName,supplierID,contact,address,description,date) VALUES (?,?,?,?,?,?)";
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
           Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
            PreparedStatement statement=con.prepareStatement(queryx);
           ResultSet rs=st.executeQuery(query);
           rs.next();
           int count=rs.getInt(1);
           count++;
           String ID="S"+count;
           statement.setString(1, name);
           statement.setString(2, ID);
           statement.setString(3, contact);
           statement.setString(4, address);
           statement.setString(5, description);
           statement.setDate(6, sqlDate);
           statement.executeUpdate();
           st.close();
           statement.close();
           con.close();
            
        RequestDispatcher rd=request.getRequestDispatcher("Manage suppliers.jsp");
        rd.forward(request, response);
       
        
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
        } catch (SQLException ex) {
            Logger.getLogger(addSupplier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addSupplier.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(addSupplier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addSupplier.class.getName()).log(Level.SEVERE, null, ex);
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
