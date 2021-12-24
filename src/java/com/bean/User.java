/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

import java.io.Serializable;
import java.sql.*;

/**
 *
 * @author User
 */
public class User implements Serializable{
    
    private String username,fullname,phoneNum,email,userType,userID,password;

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void insertIntoDB() throws ClassNotFoundException, SQLException{
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "INSERT INTO `pharmonline`.`user`(`username`, `fullname`, `phoneNum`, `email`, `userType`, `userID`, `password`) VALUES ('"+ username +"', '"+ fullname +"', '"+ phoneNum +"', '"+ email +"', '"+ userType +"', '"+ userID +"', '"+ password +"')";
        
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
        String query = "UPDATE `pharmonline`.`user` SET `fullname` = '"+fullname+"', `phoneNum` = '"+phoneNum+"', `email` = '"+email+"' WHERE `username` = Cast('"+username+"' AS Binary("+ Integer.toString(username.length()) +")) LIMIT 1";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();    
    }
    
    public void updatePassword() throws ClassNotFoundException, SQLException{
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "UPDATE `pharmonline`.`user` SET `password` = '"+password+"' WHERE `username` = Cast('"+username+"' AS Binary("+ Integer.toString(username.length()) +")) LIMIT 1";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        st.executeUpdate(query); // Execute query
        
        st.close();
        con.close();  
    }
}
