/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author User
 */
public class Report implements Serializable {
    
    private double sales;
    private int transactions;
    private double revenue;
    private double profit;
    private int customers;
    private int suppliers;
    private int products;

    public int getTransactions() {
        return transactions;
    }

    public void setTransactions(int transactions) {
        this.transactions = transactions;
    }
    
    public double getSales() {
        return sales;
    }

    public void setSales(double sales) {
        this.sales = sales;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }

    public int getCustomers() {
        return customers;
    }

    public void setCustomers(int customers) {
        this.customers = customers;
    }

    public int getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(int suppliers) {
        this.suppliers = suppliers;
    }

    public int getProducts() {
        return products;
    }

    public void setProducts(int products) {
        this.products = products;
    }
    
    
    public int getDailyTransactions() throws ClassNotFoundException, SQLException{
        
        LocalDateTime now = LocalDateTime.now();
        String datetime = Timestamp.valueOf(now).toString();
        String date = datetime.substring(0, 10);
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "SELECT * FROM `pharmonline`.`order` WHERE `status` = 'Completed' AND `orderDateTime` BETWEEN '"+date+" 00:00:00' AND '"+date+" 23:59:59'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        int count = 0;
        
        while(rs.next()){
            count++;
        }
        
        st.close();
        con.close();  
        return count;
    }
    
    public double getPercentCompletedOrder() throws ClassNotFoundException, SQLException{
        
        int completedOrder = this.getDailyTransactions();
        
        LocalDateTime now = LocalDateTime.now();
        String datetime = Timestamp.valueOf(now).toString();
        String date = datetime.substring(0, 10);
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "SELECT * FROM `pharmonline`.`order` WHERE `orderDateTime` BETWEEN '"+date+" 00:00:00' AND '"+date+" 23:59:59'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        int count = 0;
        
        while(rs.next()){
            count++;
        }
        
        
        st.close();
        con.close(); 
        
        double percentage = (double)(completedOrder) / (double)(count) * (double)100;
        
        return percentage;
    }
    
    
    public double getSalesToday() throws ClassNotFoundException, SQLException{
        
        LocalDateTime now = LocalDateTime.now();
        String datetime = Timestamp.valueOf(now).toString();
        String date = datetime.substring(0, 10);
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "SELECT SUM(totalPrice) FROM `pharmonline`.`order` WHERE `status` = 'Completed' AND `orderDateTime` BETWEEN '"+date+" 00:00:00' AND '"+date+" 23:59:59'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        
        while(rs.next()){
            this.sales = rs.getDouble(1);
        }
        
        st.close();
        con.close();
        
        return this.sales;
    }
    
    
    public double getSalesTodayPercentage() throws ClassNotFoundException, SQLException{
        
        try{
            this.sales = this.getSalesToday();
        }
        catch(Exception e){
            return -1;
        }
        
        LocalDateTime now = LocalDateTime.now();
        String datetime = Timestamp.valueOf(now).toString();
        String date = datetime.substring(0, 10);
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "pharmonline";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pw = "";
        String query = "SELECT SUM(totalPrice) FROM `pharmonline`.`order` WHERE `status` != 'Rejected' AND `status` != 'Cancelled' AND `orderDateTime` BETWEEN '"+date+" 00:00:00' AND '"+date+" 23:59:59'";
        
        Class.forName(driver);  //Load Driver
        Connection con = DriverManager.getConnection(url, userName, pw);  // Set Connection
        Statement st = con.createStatement();   // create query
        ResultSet rs = st.executeQuery(query); // Execute query
        
        double potentialSales = 0;
        
        while(rs.next()){
            potentialSales = rs.getDouble(1);
        }
        
        st.close();
        con.close();
        
        
        double percentage = this.sales / potentialSales * 100;
        
        return percentage;
    }
    
}
