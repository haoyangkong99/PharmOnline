/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.bean.Stock;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "deleteStock", urlPatterns = {"/deleteStock"})
public class deleteStock extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id=request.getParameter("id");
         String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con=DriverManager.getConnection(url,userName,password);
         String queryStock="SELECT * FROM stock where stockTransactionID='"+id+"'";
         Statement stStock=con.createStatement();
         ResultSet rsStock=stStock.executeQuery(queryStock);
         rsStock.next();
         
         String DBOperation=rsStock.getString(2);
         String DBProductID=rsStock.getString(4);
         double DBQuantity=rsStock.getDouble(6);
        Stock deleteStock=new Stock();
        deleteStock.setStockTransactionID(id);
        String queryProduct="SELECT * FROM product where product_ID='"+DBProductID+"'";
                         Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(queryProduct);
        rs.next();
        int productTableQuantity=rs.getInt(6);
         PrintWriter out = response.getWriter();
         if (DBOperation.equals("Add Stock"))
         {
             if (DBQuantity>productTableQuantity)
             {
                            out.println("<script type=\"text/javascript\">");
            out.println("alert('The operation of stock deletion can only be done if the quantity of the stock deleted does not exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
             }
             else
             {
                 deleteStock.updateProductQuantity("Return Stock", DBProductID, DBQuantity);
                 deleteStock.deleteStockFromDB();
                 response.sendRedirect("Manage stock.jsp");
             }
         }
         else
         {
             deleteStock.updateProductQuantity("Add Stock", DBProductID, DBQuantity);
                 deleteStock.deleteStockFromDB();
                 response.sendRedirect("Manage stock.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(deleteStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(deleteStock.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(deleteStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(deleteStock.class.getName()).log(Level.SEVERE, null, ex);
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
