<%-- 
    Document   : EditOrder
    Created on : Dec 24, 2021, 8:48:48 PM
    Author     : user
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.ZoneOffset"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Edit Order</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
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

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/PharmOnlineLogo1.png" alt="">
        <span class="d-none d-lg-block"></span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">H.Winson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
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
        <a class="nav-link collapsed" href="index.html">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>Components</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>Alerts</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>Accordion</span>
            </a>
          </li>
          <li>
            <a href="components-badges.html">
              <i class="bi bi-circle"></i><span>Badges</span>
            </a>
          </li>
          <li>
            <a href="components-breadcrumbs.html">
              <i class="bi bi-circle"></i><span>Breadcrumbs</span>
            </a>
          </li>
          <li>
            <a href="components-buttons.html">
              <i class="bi bi-circle"></i><span>Buttons</span>
            </a>
          </li>
          <li>
            <a href="components-cards.html">
              <i class="bi bi-circle"></i><span>Cards</span>
            </a>
          </li>
          <li>
            <a href="components-carousel.html">
              <i class="bi bi-circle"></i><span>Carousel</span>
            </a>
          </li>
          <li>
            <a href="components-list-group.html">
              <i class="bi bi-circle"></i><span>List group</span>
            </a>
          </li>
          <li>
            <a href="components-modal.html">
              <i class="bi bi-circle"></i><span>Modal</span>
            </a>
          </li>
          <li>
            <a href="components-tabs.html">
              <i class="bi bi-circle"></i><span>Tabs</span>
            </a>
          </li>
          <li>
            <a href="components-pagination.html">
              <i class="bi bi-circle"></i><span>Pagination</span>
            </a>
          </li>
          <li>
            <a href="components-progress.html">
              <i class="bi bi-circle"></i><span>Progress</span>
            </a>
          </li>
          <li>
            <a href="components-spinners.html">
              <i class="bi bi-circle"></i><span>Spinners</span>
            </a>
          </li>
          <li>
            <a href="components-tooltips.html">
              <i class="bi bi-circle"></i><span>Tooltips</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Forms</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>Form Elements</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>Form Layouts</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>Form Editors</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>Form Validation</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>General Tables</span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>Data Tables</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>Charts</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>Chart.js</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>ApexCharts</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>ECharts</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Icons</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>Bootstrap Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link " href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-card-list"></i>
          <span>Register</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-error-404.html">
          <i class="bi bi-dash-circle"></i>
          <span>Error 404</span>
        </a>
      </li><!-- End Error 404 Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>Blank</span>
        </a>
      </li><!-- End Blank Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Manage Orders</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Manage Orders</li>
          <li class="breadcrumb-item active">Edit Order</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <script>
        function calcsubitemprice(count)
        {
          var price = document.getElementById("itemprice"+count).innerHTML;
          var noItem = document.getElementById("quantity"+count).value;
          var total = parseFloat(price) * noItem;
          if (!isNaN(total))
            document.getElementById("subtotal"+count).innerHTML = total.toFixed(2);
//        for(int i=0; i<count; i++){
//            if (!isNaN(total))
//            document.getElementById("subtotal"+count).innerHTML = total.toFixed(2);
//            var totalPrice +=total;
//            document.getElementById("RealtotPrice").innerHTML =parseFloat(totalPrice).toFixed(2);
//        }
            
        }
        function calcTotal(count)
        {
          var totalprice=0;
          for(var i=1; i<=count;i++){
              var subtotal =document.getElementById("subtotal"+i).innerHTML;
              totalprice+=parseFloat(subtotal);
          }
          document.getElementById("totalprice").innerHTML =totalprice.toFixed(2);
          document.getElementById("totalp").value=totalprice.toFixed(2);
        }
        function calcTotalafterDel(c){
            var subtotal =document.getElementById("subtotal"+c).innerHTML;
            document.getElementByName("temptotal").value-=parseFloat(subtotal);
            document.getElementById("temptotal").innerHTML-=parseFloat(subtotal);
        }
        function callEditOrder(count){
            var id = document.getElementById("id").value;
            var totalprice= document.getElementById("totalp").value;
            var collectDateTime = document.getElementById("collectDateTime").value;
            var rowNo=count;
            var url ="";
            for(var j=1;j<=count;j++){
            this["selectedproductID"+j]=document.getElementById("selectedproductID"+j).value;
            this["quantity"+j]=document.getElementById("quantity"+j).value;
            var tempurl ="&selectedproductID"+j+"="+this["selectedproductID"+j]+"&quantity"+j+"="+this["quantity"+j];
            url+=tempurl;
            }
            document.location.href="editOrder?id="+id+"&totalprice="+totalprice+"&collectDateTime="+collectDateTime+"&rowNo="+rowNo+url;
        }
        function updateStatus(status){
            var id = document.getElementById("id").value;
            var updatestatus = status;
            document.location.href="updateOrderStatus?id="+id+"&status="+updatestatus;
        }
        function updateStatusQuantity(status, count){
            var id = document.getElementById("id").value;
            var updatestatus = status;
            var rowNo=count;
            var url ="";
            for(var j=1;j<=count;j++){
            this["selectedproductID"+j]=document.getElementById("selectedproductID"+j).value;
            this["quantity"+j]=document.getElementById("productquantity"+j).value-document.getElementById("quantity"+j).value;
            var tempurl ="&selectedproductID"+j+"="+this["selectedproductID"+j]+"&quantity"+j+"="+this["quantity"+j];
            url+=tempurl;
            }
            document.location.href="updateOrderStatusQuantity?id="+id+"&status="+updatestatus+"&rowNo="+rowNo+url;
        }
    </script>
      <div class="row">


        <div class="col-xl-12">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
                  
                    <%
                        String id=request.getParameter("id");
                        String driver ="com.mysql.jdbc.Driver";
                        String dbName="PharmOnline";
                        String url="jdbc:mysql://localhost/"+dbName+"?";
                        String userName="root";
                        String password="";
                        String query="SELECT * FROM `order` WHERE orderID='"+id+"'";
                        
                        Class.forName(driver);
                        Connection con=DriverManager.getConnection(url,userName,password);
                        Statement st=con.createStatement();
                        Statement stOrderProduct=con.createStatement();
                        Statement stProduct=con.createStatement();
                        Statement stCust=con.createStatement();
                        ResultSet rs=st.executeQuery(query);
                        
                        rs.next();
                        String orderDateTime=rs.getString(2).toString();
                            String collectDateTime=rs.getString(3).toString();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            DateFormat outputformat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
                            DateFormat outputDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
                            Date orderdate = null;
                            String orderDateoutput = null;
                            Date collectdate = null;
                            String collectDateoutputedit = null;
                            String collectDateoutput = null;
                            orderdate= df.parse(orderDateTime);
                            orderDateoutput = outputformat.format(orderdate);
                            collectdate= df.parse(collectDateTime);
                            collectDateoutputedit = outputDate.format(collectdate);
                            collectDateoutput = outputformat.format(collectdate);
                        String queryorderproduct = "SELECT * FROM orderproduct WHERE orderID='"+id+"'";
                        ResultSet rsorderproduct=stOrderProduct.executeQuery(queryorderproduct);
                        double totalprice =rs.getDouble(4);
                        String totalprice0=String.format("%.2f",totalprice);
                        String status = rs.getString(5);
                        String custID = rs.getString(6);
                        String queryCustName = "SELECT * FROM user WHERE userID='"+custID+"'";
                        ResultSet rscust=stCust.executeQuery(queryCustName);
                        rscust.next();
                        String custName = rscust.getString(2);
                    %>
                  
                
                
                
                    <!--<form id="editorder">-->

                  <div class="row mb-3">
                    <table class="table">
                    <tr>
                      <th>Order ID</th>
                      <th>:</th>
                      <td><%= id %></td>
                      <th>Status</th>
                      <th>:</th>
                      <%
                         if(status.equals("Pending")){
                             out.println("<td><span class=\"badge bg-secondary\">"+status+"</span></td>");
                        }
                         else if(status.equals("Completed")){
                            out.println("<td><span class=\"badge bg-success\">"+status+"</span></td>");
                         }
                         else if(status.equals("Accepted")){
                            out.println("<td><span class=\"badge bg-dark\">"+status+"</span></td>");
                         }
                         else if(status.equals("Prepared")){
                            out.println("<td><span class=\"badge bg-info text-dark\">"+status+"</span></td>");
                         }
                         else if(status.equals("Rejected")){
                            out.println("<td><span class=\"badge bg-danger\">"+status+"</span></td>");
                         }
                         else if(status.equals("Cancelled")){
                            out.println("<td><span class=\"badge bg-danger\">"+status+"</span></td>");
                         }
                      %>
                      
                    </tr>
                    <tr>
                      <th>Customer ID</th>
                      <th>:</th>
                      <td><%= custID %></td>
                      <th>Customer Name</th>
                      <th>:</th>
                      <td><%= custName %></td>
                    </tr>
                    <tr>
                      <th>Order Date / Time</th>
                      <th>:</th>
                      <td><%= orderDateoutput %></td>
                      <th>Collect Date / Time</th>
                      <th>:</th>
                      <%
                          LocalDateTime now = LocalDateTime.now();
                          DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                          String currentTime = now.format(formatter);
                          
                          if(status.equals("Pending")||status.equals("Accepted")||status.equals("Prepared")){
                              out.println("<td><input type=\"datetime-local\" min='"+currentTime+"' id=\"collectDateTime\" value='"+collectDateoutputedit+"'></td>");
                          }
                          else{
                              out.println("<td>"+collectDateoutput+"</td>");
                          }
                      %>
                    </tr>
                    </table>
                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Item</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Pricing (RM)</th>
                        <th scope="col">Action</th>
                      </tr>
                    </thead>
                     <tbody>
                    <%
                        int count = 0;
                        String queryorderproductRow = "SELECT count(*) FROM orderproduct WHERE orderID='"+id+"'";
                        Statement storderproductRow = con.createStatement();
                        ResultSet rsorderproductRow = storderproductRow.executeQuery(queryorderproductRow);
                        rsorderproductRow.next();
                        int rowNo = rsorderproductRow.getInt(1);
                        
                        String excludedOrderID ="";
                        String queryexcludedOrderID = "SELECT * FROM `order` WHERE status IN ('Completed','Rejected','Cancelled')";
                        
                        Statement storderexcluded = con.createStatement();
                        ResultSet rsorderexcluded = storderexcluded.executeQuery(queryexcludedOrderID);
                        
                        while(rsorderexcluded.next()){
                                excludedOrderID += rsorderexcluded.getString(1);
                        }
                        excludedOrderID = excludedOrderID.replaceAll("(.{2})", "$0','");
                        excludedOrderID = excludedOrderID.substring(0, excludedOrderID.length() - 3);
                        
                        while(rsorderproduct.next()){
                            count++;
                            String selectedproductID = rsorderproduct.getString(2);
                            out.println("<input type=\"hidden\" id=\"selectedproductID"+count+"\" value='"+selectedproductID+"'>");
                            int orderProductquantity = rsorderproduct.getInt(3);
                            int totalorderproductquantity=0;
                            String queryorderproductQuantity="";
                            if (excludedOrderID.isEmpty()){
                                queryorderproductQuantity = "SELECT * FROM orderproduct WHERE productID='"+selectedproductID+"'";
                            }
                            else{
                                queryorderproductQuantity = "SELECT * FROM orderproduct WHERE productID='"+selectedproductID+"' AND orderID NOT IN ('"+excludedOrderID+"')";
                            }
                            
                            ResultSet rsorderproductQuantity = storderproductRow.executeQuery(queryorderproductQuantity);
                            while(rsorderproductQuantity.next()){
                                totalorderproductquantity+=rsorderproductQuantity.getInt(3);
                            }
                            
                            out.println("<tr>");
                            out.println("<th scope=\"row\">"+count+"</th>");
                            String queryProduct="SELECT * FROM product WHERE product_ID='"+selectedproductID+"'";
                            ResultSet rsProduct=stProduct.executeQuery(queryProduct);
                            rsProduct.next();
                            int productquantity = rsProduct.getInt(6);
                            out.println("<input type=\"hidden\" id=\"productquantity"+count+"\" name=\"productquantity"+count+"\" value='"+productquantity+"'>");
                            int max = productquantity - totalorderproductquantity+orderProductquantity;
                            String itemname = rsProduct.getString(2);
                            double itemprice = rsProduct.getDouble(4);
                            if(status.equals("Completed")||status.equals("Rejected")||status.equals("Cancelled")){
                            out.println("<td>"+itemname+"</td>");
                            out.println("<td>"+orderProductquantity+"</td>");
                            out.println("<span id=\"itemprice"+count+"\" hidden>"+itemprice+"</span>");
                            double subtotal=itemprice*orderProductquantity;
                            String subtotal2 = String.format("%.2f",subtotal);
                            out.println("<td><span id=\"subtotal"+count+"\">"+subtotal2+"</td>");
                            out.println("<input type=\"hidden\" id=\"subtotal"+count+"\" name=\"subtotal"+count+"\" value='"+subtotal+"'>");
                            double temptotalprice =totalprice-subtotal;
                            out.println("<input type=\"hidden\" id=\"total\" name=\"totalprice\" value='"+temptotalprice+"'>");
                            out.println("<td></td>");
                            out.println("</tr>");
                            }
                            else{
                            out.println("<td>"+itemname+"</td>");
                            out.println("<td><input type=\"number\" step=\"1\" id=\"quantity"+count+"\" min=\"1\" max='"+max+"' value='"+orderProductquantity+"'oninput=\"calcsubitemprice("+count+"); calcTotal("+rowNo+");\" required></td>");
                            out.println("<span id=\"itemprice"+count+"\" hidden>"+itemprice+"</span>");
                            double subtotal=itemprice*orderProductquantity;
                            String subtotal2 = String.format("%.2f",subtotal);
                            out.println("<td><span id=\"subtotal"+count+"\">"+subtotal2+"</td>");
                            out.println("<input type=\"hidden\" id=\"subtotal"+count+"\" name=\"subtotal"+count+"\" value='"+subtotal+"'>");
                            double temptotalprice =totalprice-subtotal;
                            out.println("<input type=\"hidden\" id=\"total\" name=\"totalprice\" value='"+temptotalprice+"'>");
                            out.println("<td><a href='deleteOrderProduct?id="+id+"&productID="+selectedproductID+"&totalprice="+temptotalprice+"'onclick=' return confirm("+'"'+"Are you sure to delete this Item ?"+'"'+")"+"';\"calcTotalafterDel("+count+")\";><button><i class='bx bxs-trash'></i></button></a></td>");
                         
                            out.println("</tr>");
                            }
//                            totalPrice+=subtotal;
                        }
                    %>
                        
                      <tr>
                        <th></th>
                        <td></td>
                        <th>Total :</th>
                        
                       <% 
                           out.println("<td><span id=\"totalprice\">"+totalprice0+"</td>");
                       %>
                       <input type="hidden" id="totalp" value="<%=totalprice0%>">
                        <td></td>
                      </tr>
                    </tbody>
                    
                  </table>
                    </div>
                    <div class="text-center">
                        <input type="hidden" id="id" value="<%=id%>" >

                      <button type="button" class="btn btn-warning" onclick="window.print()">Print</button>
                      <a href="ManageOrder.jsp" class="btn btn-secondary">Cancel</a>
                      
                      <%
                        if(status.equals("Pending")){
                            out.println("<a onclick=\"callEditOrder('"+rowNo+"');\" class=\"btn btn-primary\">Save Changes</a>");
                             status="Accepted";
                             out.println("<br><br>Status Update: <a onclick=\"updateStatus('"+status+"')\" class=\"btn btn-dark\">Accept</a>");
                             status="Rejected";
                             out.println("<a onclick=\"updateStatus('"+status+"')\" class=\"btn btn-danger\">Reject</a>");
                        }
                         else if(status.equals("Accepted")){
                             out.println("<a onclick=\"callEditOrder('"+rowNo+"');\" class=\"btn btn-primary\">Save Changes</a>");
                             status="Prepared";
                            out.println("<br><br>Status Update: <a onclick=\"updateStatus('"+status+"')\" class=\"btn btn-info text-dark\">Prepared</a>");
                         }
                         else if(status.equals("Prepared")){
                             out.println("<a onclick=\"callEditOrder('"+rowNo+"');\" class=\"btn btn-primary\">Save Changes</a>");
                             status="Completed";
                            out.println("<br><br>Status Update: <a onclick=\"updateStatusQuantity('"+status+"','"+count+"')\" class=\"btn btn-success\">Complete</a>");
                         }
                      %>
                    </div>
            
                      <%
                          st.close();
                          stOrderProduct.close();
                          stProduct.close();
                          stCust.close();
                          con.close();
                         %>
                <!--</form>-->

                
                
                    
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
