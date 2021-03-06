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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "stockOperation", urlPatterns = {"/stockOperation"})
public class stockOperation extends HttpServlet {

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
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action=request.getParameter("action");
        String supplierID=request.getParameter("supplier");
        String productID=request.getParameter("product");
        
        String reference=request.getParameter("reference");
         java.util.Date arrival = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("arrival"));
         java.sql.Date sqlarrival = new java.sql.Date(arrival.getTime());  
         java.util.Date expiry = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("expiry"));
         java.sql.Date sqlexpiry = new java.sql.Date(expiry.getTime());
         double cost=Double.parseDouble(request.getParameter("cost"));
         double quantity=Double.parseDouble(request.getParameter("quantity"));
         PrintWriter out = response.getWriter();
         Stock stockOperation=new Stock ();
         stockOperation.setArrivalDate(sqlarrival);
         stockOperation.setCost(cost);
         stockOperation.setExpiryDate(sqlexpiry);
         stockOperation.setOperation(action);
         stockOperation.setProductID(productID);
         stockOperation.setQuantity(quantity);
         stockOperation.setReferenceNo(reference);
         stockOperation.setSupplierID(supplierID);
         if (stockOperation.verifyStockOperation(action, productID, quantity))
         {
              stockOperation.addStockToDB();
              response.sendRedirect("Manage stock.jsp");
         }
         else
         {
             out.println("<script type=\"text/javascript\">");
            out.println("alert('The product quantity for return stock cannot exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
         }
        
       

//out.println("<p>"+cost+"</p>");
     

          
      
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
        } catch (ParseException ex) {
            Logger.getLogger(stockOperation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(stockOperation.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(stockOperation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(stockOperation.class.getName()).log(Level.SEVERE, null, ex);
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
