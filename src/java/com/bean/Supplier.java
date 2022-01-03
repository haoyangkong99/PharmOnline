/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

import com.servlet.deleteSupplier;
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
public class Supplier {
    private String name,ID,contact,address,description;
    private Date date;

    public Supplier() {
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public String getName() {
        return name;
    }

    public String getID() {
        return ID;
    }

    public String getContact() {
        return contact;
    }

    public String getAddress() {
        return address;
    }

    public String getDescription() {
        return description;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public void addSupplierToDB() throws ClassNotFoundException, SQLException
    {
           String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query = "SELECT count(*) FROM Supplier";
        String querycheck = "SELECT * FROM Supplier";
        String queryx="INSERT INTO Supplier (supplierName,supplierID,contact,address,description,date) VALUES (?,?,?,?,?,?)";
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
           String ID="S"+String.valueOf(count);
           while (rsCheck.next())
           {
               String []temp=rsCheck.getString(2).split("S");
               int number=Integer.parseInt(temp[1]);
               if (count<=number)
               {
                   count=number+1;
                   
               }
            }
           ID="S"+String.valueOf(count);
            this.ID=ID;
           
           
           statement.setString(1, name);
           statement.setString(2, this.ID);
           statement.setString(3, contact);
           statement.setString(4, address);
           statement.setString(5, description);
           statement.setDate(6, date);
           statement.executeUpdate();
           st.close();
           statement.close();
           con.close();
        
    }
    public void deleteSupplierFromDB() throws SQLException
    {
           String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="DELETE FROM Supplier WHERE supplierID=?";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(deleteSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
           Connection con=DriverManager.getConnection(url,userName,password);
           PreparedStatement st=con.prepareStatement(query);
           st.setString(1, this.ID);
           st.executeUpdate();// PreparedStatement
           st.close();
           con.close();
        
    }
    public void updateSupplierToDB() throws SQLException 
    {
        String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Supplier.class.getName()).log(Level.SEVERE, null, ex);
        }
         Connection con=DriverManager.getConnection(url,userName,password);
          PreparedStatement ps = con.prepareStatement("UPDATE `supplier` SET `supplierName`=?, `contact`=?,`address`=?, `description`=?, `date`=? WHERE (`supplierID`=?) LIMIT 1");

            ps.setString(1,name);
            ps.setString(2, contact);
            ps.setString(3, address);
            ps.setString(4, description);
            ps.setDate(5, this.date);
               ps.setString(6, this.ID);
    ps.executeUpdate();
           ps.close();
           con.close();
    }
    
}
