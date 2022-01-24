/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Zhi Xuen
 */
public class Category {
    private String ID, name, description;

    public Category() {
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

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }
    
   public void insertIntoDB() throws ClassNotFoundException, SQLException{
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "INSERT INTO `pharmonline`.`category`(`category_ID`, `category_Name`, `category_Description`) VALUES ('"+ ID +"', '"+ name +"', '"+ description +"')";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();
    }
    
    public void updateInDB() throws ClassNotFoundException, SQLException{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "UPDATE `pharmonline`.`category` SET `category_Name` = '"+name+"', `category_Description` = '"+description+"' WHERE `category_ID` = '"+ID+"'";
//      String query = "UPDATE `pharmonline`.`category` SET `category_Name` = '"+name+"', `category_Description` = '"+description+"' WHERE `category_ID` = Cast('"+ID+"' AS Binary("+ Integer.toString(ID.length()) +")) LIMIT 1";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();    
    }
    
     public void deleteInDB() throws ClassNotFoundException, SQLException{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "DELETE FROM `pharmonline`.`category` WHERE `category_ID` = '"+ID+"'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();    
    }
}
