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
import static java.time.Instant.now;
import java.time.LocalDateTime;
/**
 *
 * @author user
 */
public class Order {
    private String orderID, status;
    private Timestamp orderDateTime, collectDateTime;
    private double totalprice;
    public Order(){}
    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(Timestamp orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    public Timestamp getCollectDateTime() {
        return collectDateTime;
    }

    public void setCollectDateTime(Timestamp collectDateTime) {
        this.collectDateTime = collectDateTime;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
    public void addOrderToDB() throws SQLException, ClassNotFoundException{
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query = "SELECT count(*) FROM order";
        String querycheck = "SELECT * FROM order";
        String queryx="INSERT INTO `order` (`orderID`, `orderDateTime`, `collectDateTime`, `totalprice`, `status`) VALUES (?, ?, ?, ?, ?)";
        Class.forName(driver);
        Connection con=DriverManager.getConnection(url,userName,password);
        Statement st=con.createStatement();
        Statement stcheck=con.createStatement();
        PreparedStatement statement=con.prepareStatement(queryx);
        ResultSet rs=st.executeQuery(query);
        ResultSet rsCheck=stcheck.executeQuery(querycheck);
        rs.next();
        int count=rs.getInt(1);
        count++;
        String ID="O"+String.valueOf(count);
        while (rsCheck.next())
        {
            String []temp=rsCheck.getString(2).split("O");
            int number=Integer.parseInt(temp[1]);
            if (count<=number)
               {
                   count=number+1;
                   
               }
        }
        orderID="O"+String.valueOf(count);
        this.orderID=orderID;
        LocalDateTime now = LocalDateTime.now();
        this.orderDateTime = Timestamp.valueOf(now);
        statement.setString(1, this.orderID);
        statement.setTimestamp(2, this.orderDateTime);
        statement.setTimestamp(3, collectDateTime);
        statement.setDouble(4, totalprice);
        statement.setString(5, "Pending");
        statement.executeUpdate();
        st.close();
        statement.close();
        con.close();
    }
    public void deleteOrderFromDB() throws SQLException
    {
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="DELETE FROM `order` WHERE `orderID`=?";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(deleteOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
           Connection con=DriverManager.getConnection(url,userName,password);
           PreparedStatement st=con.prepareStatement(query);
           st.setString(1, this.orderID);
           st.executeUpdate();// PreparedStatement
           st.close();
           con.close();
        
    }
    public void updateOrderPriceFromDB() throws SQLException
    {
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
//        String query="UPDATE `order` SET `totalprice`=? WHERE (`orderID`=?) LIMIT 1";
        try {
            Class.forName(driver);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
        }
            Connection con=DriverManager.getConnection(url,userName,password);
            PreparedStatement st=con.prepareStatement("UPDATE `order` SET `totalprice`=? WHERE (`orderID`=?) LIMIT 1");
            st.setDouble(1, totalprice);
            st.setString(2, this.orderID);
            st.executeUpdate();
            st.close();
            con.close();
    }
    public void updateOrderStatus() throws SQLException
    {
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
//        String query="UPDATE `order` SET `totalprice`=? WHERE (`orderID`=?) LIMIT 1";
        try {
            Class.forName(driver);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
        }
            Connection con=DriverManager.getConnection(url,userName,password);
            PreparedStatement st=con.prepareStatement("UPDATE `order` SET `status`=? WHERE (`orderID`=?) LIMIT 1");
            st.setString(1, status);
            st.setString(2, this.orderID);
            st.executeUpdate();
            st.close();
            con.close();
    }
    public void updateCollectDateTime() throws SQLException
    {
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con=DriverManager.getConnection(url,userName,password);
        PreparedStatement st=con.prepareStatement("UPDATE `order` SET `collectDateTime`=? WHERE (`orderID`=?) LIMIT 1");
        st.setTimestamp(1, collectDateTime);
        st.setString(2, this.orderID);
        st.executeUpdate();
        st.close();
        con.close();
    }
}
