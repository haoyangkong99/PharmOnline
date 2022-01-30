/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.bean.Product;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Zhi Xuen
 */
@MultipartConfig(maxFileSize = 16177215)
public class addProduct extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        String product_name = request.getParameter("product_name");
        String product_description = request.getParameter ("product_description");
        double product_price = Double.parseDouble(request.getParameter("product_price"));
        String product_category = request.getParameter("product_category");
        int quantity=0;
        InputStream inputStream;
        Part filePart = request.getPart("product_image");
        inputStream = filePart.getInputStream();
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        String query = "SELECT * FROM product";

       Statement st = con.createStatement();   // create query
       ResultSet rs = st.executeQuery(query); // Execute query
       
      

            int size=0;

            if(rs != null){
                rs.last();
                size = rs.getRow();
            }

            st.close();
            
            con.close();

            String product_ID = "PR-" + String.valueOf(size + 1); 
            
//            String query1 = "SELECT FROM `pharmonline`.`stock` WHERE `productID` = '"+product_ID+"'";
//            
//            Statement st1 = con.createStatement();   // create query
//            ResultSet rs1 = st1.executeQuery(query); // Execute query
            
//            if(rs1== null){
//               quantity = 0;
//            }
//             else{
//                 while (rs1.next()){
//                     if(rs1.getString(2).equals("Add Stock"))
//                        quantity += rs1.getInt(6);
//                     else
//                        quantity -= rs1.getInt(6);
//                 }
//             }

            Product newProduct = new Product();

            newProduct.setID(product_ID);
            newProduct.setName(product_name);
            newProduct.setCategory(product_category);
            newProduct.setDescription(product_description);
            newProduct.setPrice(product_price);
            newProduct.setQuantity(quantity);
            newProduct.setPicture(inputStream);
            newProduct.setStatus("Activate");
            
            newProduct.insertIntoDB();

            out.println("<script type=\"text/javascript\">");
            
            out.println("alert('New product added!');");
            out.println("location='Manage product.jsp';");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
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
