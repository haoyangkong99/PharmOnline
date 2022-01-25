<%-- 
    Document   : Cart
    Created on : Dec 24, 2021, 8:48:48 PM
    Author     : user
--%>
<%@page import="com.bean.User"%>
<%@page import="com.bean.Cart"%>
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
<%
    if(request.getMethod().equals("GET") && request.getSession().getAttribute("loggedIn") == null){
           
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please Login First!');");
        out.println("location='login.jsp';");
        out.println("</script>");
        }
        User user = new User();
        user=(User)session.getAttribute("user");
        String userID="";
        if (user!=null){
            userID = user.getUserID();
        }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    
    if (cart_list!= null) {
	request.setAttribute("cart-list", cart_list);
    }
    else{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Cart is Empty!');");
        out.println("location='viewproduct.jsp';");
        out.println("</script>");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Cart</title>
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
    <input type="hidden" id="userID" value="<%=userID%>">
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
      <h1>Place Orders</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Place Order</li>
          <li class="breadcrumb-item active">Cart</li>
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
        
        function PlaceOrder(count){
            var userID = document.getElementById("userID").value;
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
            document.location.href="placeOrder?userID="+userID+"&totalprice="+totalprice+"&collectDateTime="+collectDateTime+"&rowNo="+rowNo+url;
        }
    </script>
      <div class="row">


        <div class="col-xl-12">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
                  
                    <!--<form id="editorder">-->
                    
                  <div class="row mb-3">
                    <table class="table">
                    <tr>
                      
                      <th>Collect Date / Time</th>
                      <th>:</th>
                      <%--
                          LocalDateTime now = LocalDateTime.now();
                          DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                          String currentTime = now.format(formatter);
                              out.println("<td><input type=\"datetime-local\" min='"+currentTime+"' id=\"collectDateTime\" value='"+currentTime+"'></td>");
                          
                      --%>
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
                    <%--
                        String driver ="com.mysql.jdbc.Driver";
                        String dbName="PharmOnline";
                        String url="jdbc:mysql://localhost/"+dbName+"?";
                        String userName="root";
                        String password="";
                        Connection con=DriverManager.getConnection(url,userName,password);
                        
                        
                        Statement storderproductRow = con.createStatement();
                        Statement stProduct=con.createStatement();
                        
                        
                        String excludedOrderID ="";
                        String queryexcludedOrderID = "SELECT * FROM `order` WHERE status IN ('Completed','Rejected','Cancelled')";
                        
                        Statement storderexcluded = con.createStatement();
                        ResultSet rsorderexcluded = storderexcluded.executeQuery(queryexcludedOrderID);
                        
                        int totalorderproductquantity=0;
                        while(rsorderexcluded.next()){
                                excludedOrderID += rsorderexcluded.getString(1);
                        }
                        if (excludedOrderID.length()>3){
                        excludedOrderID = excludedOrderID.replaceAll("(.{2})", "$0','");
                        excludedOrderID = excludedOrderID.substring(0, excludedOrderID.length() - 3);
                        }
                        String queryorderproductQuantity="";
                        double totalprice = 0;
                        
                        
                        if (cart_list!= null){
                            
                            for (int count =0; count<cart_list.size(); count++){
                                String selectedproductID = cart_list.get(count).getItemID();
                                String queryProduct="SELECT * FROM product WHERE product_ID='"+selectedproductID+"'";
                                ResultSet rsProduct=stProduct.executeQuery(queryProduct);
                                rsProduct.next();
                                int productquantity = rsProduct.getInt(6);
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
                                int max = productquantity - totalorderproductquantity+cart_list.get(count).getItemquantity();
                                out.println("<tr>");
                                int index=count+1;
                                out.println("<input type=\"hidden\" id=\"selectedproductID"+index+"\" value='"+selectedproductID+"'>");
                                out.println("<th scope=\"row\">"+index+"</th>");
                                out.println("<td>"+cart_list.get(count).getItemname()+"</td>");
                                out.println("<td><input type=\"number\" step=\"1\" id=\"quantity"+index+"\" min=\"1\" max='"+max+"' value='"+cart_list.get(count).getItemquantity()+"'oninput=\"calcsubitemprice("+index+"); calcTotal("+cart_list.size()+");\" required></td>");
                                out.println("<span id=\"itemprice"+index+"\" hidden>"+cart_list.get(count).getItemprice()+"</span>");
                                double subtotal = rsProduct.getDouble(4)*cart_list.get(count).getItemquantity();
                                String subtotal2 = String.format("%.2f",subtotal);
                                out.println("<td><span id=\"subtotal"+index+"\">"+subtotal2+"</td>");
                                out.println("<input type=\"hidden\" id=\"subtotal"+count+"\" name=\"subtotal"+index+"\" value='"+subtotal+"'>");
                                out.println("<td><a href='removeCartItem?id="+selectedproductID+" 'onclick=' return confirm("+'"'+"Are you sure to delete this Item ?"+'"'+")"+"';)"+"'><i class='bx bxs-trash'></i></a></td>");
                                out.println("</tr>");
                                totalprice +=subtotal;
                               
                            }
                        }
                         String totalprice0 = String.format("%.2f",totalprice);
                    %>
                    
                        
                      <tr>
                        <th></th>
                        <td></td>
                        <th>Total :</th>
                        <%--
                           out.println("<td><span id=\"totalprice\">"+totalprice0+"</td>");
                        --%>
                       <input type="hidden" id="totalp" value="<%--=totalprice0--%>">
                       
                        <td></td>
                      </tr>
                    </tbody>
                    
                  </table>
                    </div>
                    <div class="text-center">
                    <%
                       if (cart_list!= null) {
                      out.println("<a onclick=\"PlaceOrder('"+cart_list.size()+"');\" class=\"btn btn-success\">Place Order</a>");
                       }
                   %>  
                    </div>
            
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
