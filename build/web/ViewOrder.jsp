<%-- 
    Document   : ViewOrder
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

  <title>View Order</title>
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
          <li class="breadcrumb-item">Manage Orders</li>
          <li class="breadcrumb-item active">View Order</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <script>
        function updateStatus(status){
            var id = document.getElementById("id").value;
            var updatestatus = status;
            document.location.href="updateOrderStatus?id="+id+"&status="+updatestatus;
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
                        String queryexcludedOrderID = "SELECT * FROM `order` WHERE status IN ('Completed','Rejected')";
                        
                        Statement storderexcluded = con.createStatement();
                        ResultSet rsorderexcluded = storderexcluded.executeQuery(queryexcludedOrderID);
                        
                        while(rsorderexcluded.next()){
                                excludedOrderID += rsorderexcluded.getString(1);
                        }
                        if (!excludedOrderID.isEmpty()){
                        excludedOrderID = excludedOrderID.replaceAll("(.{2})", "$0','");
                        excludedOrderID = excludedOrderID.substring(0, excludedOrderID.length() - 3);
                        }
                        while(rsorderproduct.next()){
                            count++;
                            String selectedproductID = rsorderproduct.getString(2);
                            int orderProductquantity = rsorderproduct.getInt(3);
                            int totalorderproductquantity=0;
                            String queryorderproductQuantity="";
                            
                            
                            out.println("<tr>");
                            out.println("<th scope=\"row\">"+count+"</th>");
                            String queryProduct="SELECT * FROM product WHERE product_ID='"+selectedproductID+"'";
                            ResultSet rsProduct=stProduct.executeQuery(queryProduct);
                            rsProduct.next();
                            int productquantity = rsProduct.getInt(6);
                            
                            String itemname = rsProduct.getString(2);
                            double itemprice = rsProduct.getDouble(4);
                            out.println("<td>"+itemname+"</td>");
                            out.println("<td>"+orderProductquantity+"</td>");
                            out.println("<span id=\"itemprice"+count+"\" hidden>"+itemprice+"</span>");
                            double subtotal=itemprice*orderProductquantity;
                            String subtotal2 = String.format("%.2f",subtotal);
                            out.println("<td><span id=\"subtotal"+count+"\">"+subtotal2+"</td>");
                            double temptotalprice =totalprice-subtotal;
                            out.println("<td></td>");
                            out.println("</tr>");
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
                      <a href="ManageOrder_C.jsp" class="btn btn-secondary">Cancel</a>
                      
                      <%
                        if(status.equals("Pending")||status.equals("Accepted")||status.equals("Prepared")){
                             status="Cancelled";
                             out.println("<br><br>To Cancel order Click => <a onclick=\"updateStatus('"+status+"')\"; return confirm("+'"'+"Are you sure to cancel this order ?"+'"'+")"+"'; class=\"btn btn-danger rounded-pill\">Cancel Order</a>");
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
