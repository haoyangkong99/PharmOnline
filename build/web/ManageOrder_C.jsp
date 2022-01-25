<%-- 
    Document   : ManageOrder
    Created on : Dec 24, 2021, 9:42:24 AM
    Author     : user
--%>

<%@page import="com.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Manage Order</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/icon_PharmOnline.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.1.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
    <%
        if(request.getMethod().equals("GET") && request.getSession().getAttribute("loggedIn") == null){
           
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please Login First!');");
        out.println("location='login.jsp';");
        out.println("</script>");
        }
        
    %>
<!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
       <img src="assets/img/PharmOnlineLogo1.png" alt="">

      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

 
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->
        
         <li class="nav-item dropdown">

         <a class="nav-link nav-icon" href="Cart.jsp">
            <i class="bi bi-cart"></i>
          </a><!-- End Notification Icon -->

       
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Desmond Heng</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Desmond Heng</h6>
              <span>Pharmacist</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="viewproduct.jsp">
          <i class="bi bi-grid"></i>
          <span>Home</span>
        </a>
      </li><!-- End Dashboard Nav -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="Cart.jsp">
          <i class="bi bi-cart"></i>
          <span>Cart</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="ManageOrder_C.jsp">
          <i class="bi bi-clipboard-check"></i>
          <span>Manage order</span>
        </a>
      </li><!-- End Profile Page Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="Profile.jsp">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

  
     
    
      
    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Manage Orders</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Manage Orders</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

      <div class="row">


        <div class="col-xl-12">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#all-orders">All Orders</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-pending">Pending</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-accepted">Accepted</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-prepared">Prepared</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-completed">Completed</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-rejected">Rejected</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-cancelled">Cancelled</button>
                </li>
              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="all-orders">
                    
                    <%
                        out.println("<tbody>");
                        String driver ="com.mysql.jdbc.Driver";
                        String dbName="PharmOnline";
                        String url="jdbc:mysql://localhost/"+dbName+"?";
                        String userName="root";
                        String password="";
                        String query="SELECT * FROM `order`";
                        User user = new User();
                        user=(User)session.getAttribute("user");
                        String userID = user.getUserID();
                        query="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        Class.forName(driver);
                        Connection con=DriverManager.getConnection(url,userName,password);
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery(query);
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs.next()){
                            String orderDateTime=rs.getString(2).toString();
                            String collectDateTime=rs.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            out.println("<tr>");
                            out.println("<td>"+rs.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs.getString(4).toString()+"</td>");
                            if(rs.getString(5).equals("Completed")){
                            out.println("<td><span class=\"badge bg-success\">"+rs.getString(5)+"</span></td>");
                             out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            }
                            else if(rs.getString(5).equals("Accepted")){
                            out.println("<td><span class=\"badge bg-dark\">"+rs.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");//                            
                            }
                            else if(rs.getString(5).equals("Rejected")){
                            out.println("<td><span class=\"badge bg-danger\">"+rs.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            }
                            else if(rs.getString(5).equals("Pending")){
                            out.println("<td><span class=\"badge bg-secondary\">"+rs.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            }
                           else if(rs.getString(5).equals("Prepared")){
                            out.println("<td><span class=\"badge bg-info text-dark\">"+rs.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            }
                            else if(rs.getString(5).equals("Cancelled")){
                            out.println("<td><span class=\"badge bg-danger\">"+rs.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            }
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        out.println("</tbody>");
                        

                        st.close();
                        con.close();
                    %>
                  
                </div>
                
                <div class="tab-pane fade profile-edit pt-3" id="profile-pending">

                  <!-- Profile Edit Form -->
                  <%
                        out.println("<tbody>");
                        String driver1 ="com.mysql.jdbc.Driver";
                        String dbName1="PharmOnline";
                        String url1="jdbc:mysql://localhost/"+dbName1+"?";
                        String userName1="root";
                        String password1="";
                        String query1="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver1);
                        Connection con1=DriverManager.getConnection(url1,userName1,password1);
                        Statement st1=con1.createStatement();
                        ResultSet rs1=st1.executeQuery(query1);
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                            
                        while(rs1.next()){
                            String orderDateTime=rs1.getString(2).toString();
                            String collectDateTime=rs1.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            if(rs1.getString(5).equals("Pending")){
                            out.println("<tr>");
                            out.println("<td>"+rs1.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs1.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-secondary\">"+rs1.getString(5)+"</span></td>");
                            out.println("<td><a href='deleteOrder?orderID="+rs1.getString(1)+"'onclick=' return confirm("+'"'+"Are you sure to delete this order"+'"'+")"+"'><i class='bx bxs-trash'></i></a>");
                            out.println("<a href='EditOrder.jsp?id="+rs1.getString(1)+"'><i class=\"bx bxs-edit\"></i></a></td>");
                            
                            out.println("</tr>");}
                        }
                        out.println("</table>");
                        out.println("</tbody>");
                        

                        st1.close();
                        con1.close();
                        
                    %><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-prepared">

                  <!-- Settings Form -->
                  <%
                        out.println("<tbody>");
                        String driver2 ="com.mysql.jdbc.Driver";
                        String dbName2="PharmOnline";
                        String url2="jdbc:mysql://localhost/"+dbName2+"?";
                        String userName2="root";
                        String password2="";
                        String query2="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver2);
                        Connection con2=DriverManager.getConnection(url2,userName2,password2);
                        Statement st2=con2.createStatement();
                        ResultSet rs2=st2.executeQuery(query2);
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs2.next()){
                            String orderDateTime=rs2.getString(2).toString();
                            String collectDateTime=rs2.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            
                            if(rs2.getString(5).equals("Prepared")){
                            out.println("<tr>");
                            out.println("<td>"+rs2.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs2.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-info text-dark\">"+rs2.getString(5)+"</span></td>");
                            out.println("<td><a href='deleteOrder?orderID="+rs2.getString(1)+"'onclick=' return confirm("+'"'+"Are you sure to delete this order"+'"'+")"+"'><i class='bx bxs-trash'></i></a>");
                            out.println("<a href='EditOrder.jsp?id="+rs2.getString(1)+"'><i class=\"bx bxs-edit\"></i></a></td>");
                            
                            out.println("</tr>");}
                        }
                        out.println("</table>");
                        out.println("</tbody>");
                        
                        

                        st2.close();
                        con2.close();
                        
                    %>


                </div>

                <div class="tab-pane fade pt-3" id="profile-accepted">
                  <!-- Change Password Form -->
                  <%
                        out.println("<tbody>");
                        String driver3 ="com.mysql.jdbc.Driver";
                        String dbName3="PharmOnline";
                        String url3="jdbc:mysql://localhost/"+dbName3+"?";
                        String userName3="root";
                        String password3="";
                        String query3="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver3);
                        Connection con3=DriverManager.getConnection(url3,userName3,password3);
                        Statement st3=con3.createStatement();
                        ResultSet rs3=st3.executeQuery(query3);
                  
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs3.next()){
                            if(rs3.getString(5).equals("Accepted")){
                            String orderDateTime=rs3.getString(2).toString();
                            String collectDateTime=rs3.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            out.println("<tr>");
                            out.println("<td>"+rs3.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs3.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-dark\">"+rs3.getString(5)+"</span></td>");
                            out.println("<td><a href='deleteOrder?orderID="+rs3.getString(1)+"'onclick=' return confirm("+'"'+"Are you sure to delete this order"+'"'+")"+"'><i class='bx bxs-trash'></i></a>");
                            out.println("<a href='EditOrder.jsp?id="+rs3.getString(1)+"'><i class=\"bx bxs-edit\"></i></a></td>");
//                           
                            out.println("</tr>");}
                        }
                        out.println("</table>"); 
                        out.println("</tbody>");
                        

                        st3.close();
                        con3.close();
                       
                    %><!-- End Change Password Form -->

                </div>
                <div class="tab-pane fade pt-3" id="profile-completed">
                  <!-- Change Password Form -->
                  <%
                        out.println("<tbody>");
                        String driver4 ="com.mysql.jdbc.Driver";
                        String dbName4="PharmOnline";
                        String url4="jdbc:mysql://localhost/"+dbName4+"?";
                        String userName4="root";
                        String password4="";
                        String query4="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver4);
                        Connection con4=DriverManager.getConnection(url4,userName4,password4);
                        Statement st4=con4.createStatement();
                        ResultSet rs4=st4.executeQuery(query4);
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs4.next()){
                            if(rs4.getString(5).equals("Completed")){
                            String orderDateTime=rs4.getString(2).toString();
                            String collectDateTime=rs4.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            out.println("<tr>");
                            out.println("<td>"+rs4.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs4.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-success\">"+rs4.getString(5)+"</span></td>");
                            out.println("<td><a href='EditOrder.jsp?id="+rs4.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            out.println("</tr>");}
                            
                        }
                        out.println("</tbody>");
                        out.println("</table>");

                        st4.close();
                        con4.close();
                    %><!-- End Change Password Form -->

                </div>
                    <div class="tab-pane fade pt-3" id="profile-change-rejected">
                        <%
                        out.println("<tbody>");
                        String driver5 ="com.mysql.jdbc.Driver";
                        String dbName5="PharmOnline";
                        String url5="jdbc:mysql://localhost/"+dbName5+"?";
                        String userName5="root";
                        String password5="";
                        String query5="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver5);
                        Connection con5=DriverManager.getConnection(url5,userName5,password5);
                        Statement st5=con5.createStatement();
                        ResultSet rs5=st5.executeQuery(query5);
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs5.next()){
                            if(rs5.getString(5).equals("Rejected")){
                            String orderDateTime=rs5.getString(2).toString();
                            String collectDateTime=rs5.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            out.println("<tr>");
                            out.println("<td>"+rs5.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs5.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-danger\">"+rs5.getString(5)+"</span></td>");
                            out.println("<td><a href='EditOrder.jsp?id="+rs5.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            out.println("</tr>");}
                            
                        }
                        out.println("</table>");
                        out.println("</tbody>");
                        

                        st5.close();
                        con5.close();
                    %>
                    </div>
                    <div class="tab-pane fade pt-3" id="profile-change-cancelled">
                        <%
                        out.println("<tbody>");
                        String driver6 ="com.mysql.jdbc.Driver";
                        String dbName6="PharmOnline";
                        String url6="jdbc:mysql://localhost/"+dbName6+"?";
                        String userName6="root";
                        String password6="";
                        String query6="SELECT * FROM `order` WHERE `customerID`='"+userID+"'";
                        
                        Class.forName(driver6);
                        Connection con6=DriverManager.getConnection(url6,userName6,password6);
                        Statement st6=con6.createStatement();
                        ResultSet rs6=st6.executeQuery(query6);
                        
                        out.println("<table class=\"table table-borderless datatable\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th scope=\"col\">Order ID</th>");
                        out.println(" <th scope=\"col\">Order Date / Time</th>");
                        out.println(" <th scope=\"col\">Collect Date / Time</th>");
                        out.println(" <th scope=\"col\">Amount</th>");
                        out.println("<th scope=\"col\">Status</th>");
                        out.println(" <th scope=\"col\">Action</th>");
                        out.println("</tr>");
                        out.println(" </thead>");
                        while(rs6.next()){
                            if(rs6.getString(5).equals("Cancelled")){
                            String orderDateTime=rs6.getString(2).toString();
                            String collectDateTime=rs6.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutput = outputformat.format(collectdate);
                            out.println("<tr>");
                            out.println("<td>"+rs6.getString(1)+"</td>");
                            out.println("<td>"+orderDateoutput+"</td>");
                            out.println("<td>"+collectDateoutput+"</td>");
                            out.println("<td> RM"+rs6.getString(4).toString()+"</td>");
                            
                            out.println("<td><span class=\"badge bg-danger\">"+rs6.getString(5)+"</span></td>");
                            out.println("<td><a href='ViewOrder.jsp?id="+rs6.getString(1)+"'><button type=\"button\" class=\"btn btn-outline-info\">View</button></a></td>");
                            out.println("</tr>");}
                            
                        }
                        out.println("</table>");
                        out.println("</tbody>");
                        

                        st6.close();
                        con6.close();
                    %>
                    </div>
              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>