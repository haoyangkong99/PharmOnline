/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

import com.servlet.stockOperation;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author haoya
 */
public class Stock {
    private String stockTransactionID,operation,supplierID,productID,referenceNo;
    private double cost, quantity;
    private Date arrivalDate,expiryDate;

    public Stock() {
    }

    public void setStockTransactionID(String stockTransactionID) {
        this.stockTransactionID = stockTransactionID;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public void setSupplierID(String supplierID) {
        this.supplierID = supplierID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setReferenceNo(String referenceNo) {
        this.referenceNo = referenceNo;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getStockTransactionID() {
        return stockTransactionID;
    }

    public String getOperation() {
        return operation;
    }

    public String getSupplierID() {
        return supplierID;
    }

    public String getProductID() {
        return productID;
    }

    public String getReferencNo() {
        return referenceNo;
    }

    public double getCost() {
        return cost;
    }

    public double getQuantity() {
        return quantity;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }
    public void addStockToDB() throws SQLException
    {
      String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query = "SELECT count(*) FROM Stock";
        String querycheck = "SELECT * FROM Stock";
        String queryx="INSERT INTO Stock (`stockTransactionID`, `operation`, `supplierID` , `productID`,`cost`, `quantity`, `referenceNo`, `arrivalDate`, `expiryDate`) VALUES (?,?,?,?,?,?,?,?,?)";
                
                try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(stockOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
            Statement stcheck=con.createStatement();
            PreparedStatement statement=con.prepareStatement(queryx);
           ResultSet rs=st.executeQuery(query);
           ResultSet rsCheck=stcheck.executeQuery(querycheck);
           rs.next();
           int count=rs.getInt(1);
           count++;
           String ID="ST"+String.valueOf(count);
           while (rsCheck.next())
           {
               String []temp=rsCheck.getString(1).split("ST");
               int number=Integer.parseInt(temp[1]);
               if (count<=number)
               {
                   count=number+1;
                   
               }
            }
           ID="ST"+String.valueOf(count);
           statement.setString(1, ID);
           statement.setString(2, operation);
           statement.setString(3, supplierID);
           statement.setString(4, productID);
           statement.setDouble(5, cost);
           statement.setDouble(6, quantity);
           statement.setString(7, referenceNo);
           statement.setDate(8, arrivalDate);
           statement.setDate(9, expiryDate);
           statement.executeUpdate();
           statement.close();
           st.close();
           stcheck.close();
           con.close();
    }
    public void deleteStockFromDB() throws SQLException
    
   {
    String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="DELETE FROM stock WHERE stockTransactionID=?";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
        }
          Connection con=DriverManager.getConnection(url,userName,password);
           PreparedStatement st=con.prepareStatement(query);
           st.setString(1, this.stockTransactionID);
           st.executeUpdate();// PreparedStatement
           st.close();
           con.close();
   }
    public void updateStockToDB() throws SQLException
    {
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
          PreparedStatement ps = con.prepareStatement("UPDATE `stock` SET `operation`=?, `supplierID`=?,`productID`=?, `cost`=?, `quantity`=? ,`referenceNo`=? ,`arrivalDate`=? ,`expiryDate`=? WHERE (`stockTransactionID`=?) LIMIT 1");
          ps.setString(1,this.operation);
          ps.setString(2,supplierID);
          ps.setString(3,productID);
          ps.setDouble(4,cost);
           ps.setDouble(5,quantity);
            ps.setString(6,this.referenceNo);
            ps.setDate(7, this.arrivalDate);
            ps.setDate(8, this.expiryDate);
            ps.setString(9, this.stockTransactionID);
            ps.executeUpdate();
           ps.close();
           con.close();
    }
    
}
