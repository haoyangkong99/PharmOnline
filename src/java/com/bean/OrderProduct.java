/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bean;

import com.servlet.deleteOrder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class OrderProduct{
    private String orderID, productID;
    private int quantity;
    public OrderProduct(){}
    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public void deleteWholeOrderProductFromDB() throws SQLException, ClassNotFoundException{
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="DELETE FROM `orderproduct` WHERE (`orderID`=?)";
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,userName,password);
        PreparedStatement st=con.prepareStatement(query);
        st.setString(1, this.orderID);
        st.executeUpdate();
        st.close();
        con.close();
    }
    public void deleteOrderProductFromDB() throws SQLException, ClassNotFoundException{
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="DELETE FROM `orderproduct` WHERE (`orderID`=?) AND (`productID`=?)";
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,userName,password);
        PreparedStatement st=con.prepareStatement(query);
        st.setString(1, this.orderID);
        st.setString(2, this.productID);
        st.executeUpdate();
        st.close();
        con.close();
    }
    public void updateOrderProductQuantitytoDB() throws SQLException{
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        String query="UPDATE `orderproduct` SET `quantity`=? WHERE (`orderID`=?) AND (`productID`=?) LIMIT 1";
        Connection con=DriverManager.getConnection(url,userName,password); 
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1,quantity);
        ps.setString(2,this.orderID);
        ps.setString(3,this.productID);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
