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
@WebServlet(name = "editStock", urlPatterns = {"/editStock"})
public class editStock extends HttpServlet {

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
            throws ServletException, IOException, ParseException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         
        String id=request.getParameter("id");
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
         Stock editStock=new Stock ();
         editStock.setArrivalDate(sqlarrival);
         editStock.setCost(cost);
         editStock.setExpiryDate(sqlexpiry);
         editStock.setOperation(action);
         editStock.setProductID(productID);
         editStock.setQuantity(quantity);
         editStock.setReferenceNo(reference);
         editStock.setStockTransactionID(id);
         editStock.setSupplierID(supplierID);
         String queryProduct="SELECT * FROM product where product_ID='"+productID+"'";
                         Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(queryProduct);
        rs.next();
        int productTableQuantity=rs.getInt(6);
         PrintWriter out = response.getWriter();
          
         if (!productID.equals(DBProductID))
         {
             boolean okcheck=false;
             if (action.equals("Add Stock"))
             {
                     editStock.updateProductQuantity("Add Stock", productID, quantity);
                        editStock.updateStockToDB();
                        okcheck=true;
                        
             }
             else
             {
                 if (quantity>productTableQuantity)
                 {
                     out.println("<script type=\"text/javascript\">");
            out.println("alert('The product quantity for return stock cannot exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
            okcheck=false;
                 }
                 else
                 {
                     editStock.updateProductQuantity("Return Stock", productID, quantity);
                      editStock.updateStockToDB();
                      okcheck=true;
                         
                     
                 }
                  
                 
             }
             if (okcheck)
             {
                 if (DBOperation.equals("Add Stock"))
             {
                 editStock.updateProductQuantity("Return Stock", DBProductID, DBQuantity);
                 response.sendRedirect("Manage stock.jsp");   
             }
             else
             {
                 editStock.updateProductQuantity("Add Stock", DBProductID, DBQuantity);
                 response.sendRedirect("Manage stock.jsp");   
             }
             }
             
             
         }
         else
         {
         if (DBOperation.equals(action))
         {
             if (quantity==DBQuantity)
             {
                 
               
                     editStock.updateStockToDB();
                  response.sendRedirect("Manage stock.jsp");
                 
                 
             }
             else
             {
                 int quantitychange=0;
                 if (quantity>DBQuantity)
                 {
                     quantitychange=1;
                 }
                 else
                 {
                     quantitychange=-1;
                 }
                 if (action.equals("Add Stock"))
                 {
                    
                     if (quantitychange==1)
                     {
                         double difference=quantity-DBQuantity;
                         
                         editStock.updateProductQuantity("Add Stock", productID, difference);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                     }
                     else
                     {
                         double difference=DBQuantity-quantity;
                         editStock.updateProductQuantity("Return Stock", productID, difference);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                         
                     }
                     
                 }
                 else
                 {
                      if (quantitychange==1)
                     {
                         double difference=quantity-DBQuantity;
                         
        if (difference>productTableQuantity)
        {
             out.println("<script type=\"text/javascript\">");
            out.println("alert('The product quantity for return stock cannot exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
        }
        else
        {
            editStock.updateProductQuantity("Return Stock", productID, difference);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
        }
                         
                     }
                     else
                     {
                         double difference=DBQuantity-quantity;
                         editStock.updateProductQuantity("Add Stock", productID, difference);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                         
                     }
                     
                 }
                 
             }
             
         }
         else 
         {
             int operationChange=0;
             if (action.equals("Add Stock")&&DBOperation.equals("Return Stock"))
             {
                 operationChange=1;
             }
             else if (action.equals("Return Stock")&&DBOperation.equals("Add Stock"))
             {
                 operationChange=-1;
             }
             if (quantity==DBQuantity)
             {
                 if (operationChange==-1)
                 {
                     if ((quantity*2)>productTableQuantity)
                     {
                         out.println("<script type=\"text/javascript\">");
            out.println("alert('The product quantity for return stock cannot exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
                     }
                     else
                     {
                          editStock.updateProductQuantity("Return Stock", productID, quantity*2);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                         
                     }
                 }
                 else
                 {
                     editStock.updateProductQuantity("Add Stock", productID, quantity*2);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                 }
             }
             else
             {
                 if (operationChange==-1)
                 {
                     if ((quantity+DBQuantity)>productTableQuantity)
                     {
                         out.println("<script type=\"text/javascript\">");
            out.println("alert('The product quantity for return stock cannot exceed the current product quantity');");
            out.println("location='Manage stock.jsp';");
            out.println("</script>");
                     }
                     else
                     {
                          editStock.updateProductQuantity("Return Stock", productID, quantity+DBQuantity);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                         
                     }
                 }
                 else
                 {
                      editStock.updateProductQuantity("Add Stock", productID, quantity+DBQuantity);
                         editStock.updateStockToDB();
                         response.sendRedirect("Manage stock.jsp");
                 }
                 
             }
             
             
             
         }
         
         }
         st.close();
         stStock.close();
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
        } catch (ParseException ex) {
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editStock.class.getName()).log(Level.SEVERE, null, ex);
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
