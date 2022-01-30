/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.Product;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Zhi Xuen
 */
@MultipartConfig(maxFileSize = 16177215)
public class editProduct extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        String category_ID = request.getParameter("id");
        String category_name = request.getParameter("product_name");
        String description = request.getParameter("product_description");
        double price = Double.parseDouble(request.getParameter("new_product_price"));
        String category = request.getParameter("product_category");
        InputStream inputStream=null;
        Part filePart = null;
        String status;
        String ori_status=request.getParameter("ori_product_status");
        if ( request.getParameter("product_status")==null)
        {
            status=ori_status;
        }
        else
        {
            status=request.getParameter("product_status");
        }
        
        
        filePart=request.getPart("new_product_image");
        inputStream = filePart.getInputStream();
//        
         Product editProduct=new Product();
         
        
             editProduct.setStatus(status);
         
         
     
//         
////             
         
         editProduct.setID(category_ID);
         editProduct.setName(category_name);
         editProduct.setDescription(description);
         editProduct.setPrice(price);
         editProduct.setCategory(category);
         
         
         editProduct.updateInDB();
         if(filePart.getSize()!=0)
         {
             editProduct.setPicture(inputStream);
             editProduct.updatePictureInDB();
           
         }
         if (filePart.getSize()>=16177215)
         {
             out.println("<script type=\"text/javascript\">");
          out.println("alert('The file size has exceeded the max size of 16MB');");
          out.println("location='Manage product.jsp';");
          out.println("</script>"); 
         }
         else
         {
      
             out.println("<script type=\"text/javascript\">");
          out.println("alert('Updated successfully!');");
          out.println("location='Manage product.jsp';");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editCategory.class.getName()).log(Level.SEVERE, null, ex);
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
