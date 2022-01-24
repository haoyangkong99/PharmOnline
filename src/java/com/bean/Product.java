/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Zhi Xuen
 */

public class Product {
    String ID, name, description,category,status;
    double price;
    int quantity;
    InputStream picture;

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setPicture(InputStream picture) {
        this.picture = picture;
    }

    public InputStream getPicture() {
        return picture;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
   

    public Product() {
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }  
    
     public void insertIntoDB() throws ClassNotFoundException, SQLException{
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "INSERT INTO `pharmonline`.`product`(`product_ID`, `product_Name`, `product_Description`, `product_Selling_Price`,`product_Category`,`product_Quantity`,`product_Picture`,`product_Status`) VALUES (?,?,?,?,?,?,?,?)";
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        PreparedStatement st=con.prepareStatement(query);
        st.setString(1, this.ID);
        st.setString(2, this.name);
        st.setString(3, this.description);
        st.setDouble(4, this.price);
        st.setString(5, this.category);
        st.setInt(6, this.quantity);
        st.setBlob(7, this.picture);
        st.setString(8, this.status);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public void updateInDB() throws ClassNotFoundException, SQLException{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "UPDATE `pharmonline`.`product` SET `product_Name` = '"+name+"', `product_Description` = '"+description+"',`product_Selling_Price` = '"+price+"',`product_Category` = '"+category+"',`product_Status` = '"+status+"' WHERE `product_ID` = '"+ID+"'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();    
    }
    public void updatePictureInDB () throws ClassNotFoundException, SQLException
    {
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
          Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  
       PreparedStatement st = con.prepareStatement("UPDATE `product` SET `product_Picture`=? WHERE (`product_ID`=?) LIMIT 1");
     
        st.setBlob(1, this.picture);
        st.setString(2, this.ID);
         st.executeUpdate();
        st.close();
        con.close();
    }
    
     public void deleteInDB() throws ClassNotFoundException, SQLException{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "DELETE FROM `pharmonline`.`product` WHERE `product_ID` = '"+ID+"'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();    
    }
}
