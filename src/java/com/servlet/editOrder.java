/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;
import com.bean.OrderProduct;
import com.bean.Order;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "editOrder", urlPatterns = {"/editOrder"})
public class editOrder extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String id=request.getParameter("id");
        double totalPrice = Double.parseDouble(request.getParameter("totalprice"));
        LocalDateTime collectDateTime1 = LocalDateTime.parse(request.getParameter("collectDateTime"));
        Timestamp collectDateTime = Timestamp.valueOf(collectDateTime1);
        Order editOrder = new Order();
        editOrder.setOrderID(id);
        editOrder.setTotalprice(totalPrice);
        editOrder.setCollectDateTime(collectDateTime);
        editOrder.updateOrderPriceFromDB();
        editOrder.updateCollectDateTime();
        int itemNo = Integer.parseInt(request.getParameter("rowNo"));
        for(int i=1;i<=itemNo;i++){
           int quantity = Integer.parseInt(request.getParameter("quantity"+i));
           String productID = request.getParameter("selectedproductID"+i);
           
            OrderProduct updateOrderProductquantity = new OrderProduct();
            updateOrderProductquantity.setOrderID(id);
            updateOrderProductquantity.setProductID(productID);
            updateOrderProductquantity.setQuantity(quantity);
            updateOrderProductquantity.updateOrderProductQuantitytoDB();
        }
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Changes have been saved successfully!');");
            out.println("location=\"EditOrder.jsp?id="+id+"\";");
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
        } catch (SQLException ex) {
            Logger.getLogger(editOrder.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editOrder.class.getName()).log(Level.SEVERE, null, ex);
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
