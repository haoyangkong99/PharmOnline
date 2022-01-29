<%@page import="com.bean.User"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Product</title>
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
        String driver ="com.mysql.jdbc.Driver";
        String dbName="pharmonline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        if("GET".equals(request.getMethod())){
                 session.setAttribute("product_category","*");
        }
        User user = new User();
        if(request.getMethod().equals("GET") && request.getSession().getAttribute("loggedIn") == null){
//           String redirectURL = "login.jsp";
//           response.sendRedirect(redirectURL); 
           
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please Login First!');");
        out.println("location='login.jsp';");
        out.println("</script>");
        }
        else {user = (User) request.getSession().getAttribute("user");
        if(!user.getUserType().equals("Customer")){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You do not have access to this page!');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
        }
    %>
    
    <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="viewproduct.jsp" class="logo d-flex align-items-center">
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
            <img src="assets/img/noProfPic.png" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2"><jsp:getProperty name="user" property="username" /></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
                <h6><jsp:getProperty name="user" property="fullname" /></h6>
              <span><jsp:getProperty name="user" property="userType" /></span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="Profile.jsp">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="Profile.jsp">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

         
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <form action="Logout" method="post">
              <div class="dropdown-item d-flex align-items-center">
                <i class="bi bi-box-arrow-right"></i>
                <input type="submit" value="Sign Out" style="background-color:transparent; border:0px solid transparent; padding-left:0px; width:100%; text-align:left;">
              </div>
              </form>
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
      <h1>Product</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Product</li>
        </ol>
      </nav>
      <form method = "post" action="viewProduct">
            <div style="display:flex; flex-direction: row">
            <select class="form-select" name="product_category" aria-label="Default select example" style="width:30%">
                <option selected value="*">All</option>
      <%
        String abc = (String) session.getAttribute("product_category");
        String query1="SELECT * FROM category ";
        Class.forName(driver);
        Connection con1=DriverManager.getConnection(url,userName,password);
        Statement st1=con1.createStatement();
        ResultSet rs1=st1.executeQuery(query1);
        int counter1=0;
        while (rs1.next())
        {
        counter1++;
        if (abc.equals(rs1.getString(2))){
            out.println("<option selected value='"+rs1.getString(2)+"'>"+rs1.getString(2)+"</option>");
        }
        else{
            out.println("<option value='"+rs1.getString(2)+"'>"+rs1.getString(2)+"</option>");
        }
        }
        st1.close();
        con1.close();
     %>
            </select>   
            <button style="margin-left: 10px;" type="submit" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Search">
              Search
            </button>
       
           
          
        </div>
             </form>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
          
        <%
            String query = "";
            if (abc.equals("*"))
               query = "SELECT * FROM product WHERE product_Status='Activate' AND product_Quantity>0";
             
           else{
              query="SELECT * FROM product WHERE product_Status='Activate' AND product_Category='"+abc+"' AND product_Quantity>0";   
           }
           
            int i = 1;
            Class.forName(driver);
            Connection con=DriverManager.getConnection(url,userName,password);
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            
            int counter=0;
            while (rs.next())
            {
                counter++; 
        %>
        <div class="col-lg-3">
          <!-- Card with an image on top -->
          <div class="card">
              <%
                  Blob blob=rs.getBlob(7);
                  InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                    }

                    byte[] imageBytes = outputStream.toByteArray();

                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                     inputStream.close();
                    outputStream.close();  

                  %>
<!--            <img src="data:image/jpeg;base64" />-->
<img src="data:;base64,<%= base64Image%>"  class="card-img-top" alt="..." style="height: 300px; width: 100%;"  />
             <form action="AddtoCart" method="post">
            <div class="card-body">
                <h5 class="card-title" style="font-size: 120%;"><%=rs.getString(2)%></h5>
                <input type="hidden" name="itemID" value="<%=rs.getString(1)%>">
                <input type="hidden" name="itemname" value="<%=rs.getString(2)%>">
              <p class="card-text"><%=rs.getString(3)%></p>
              <p class="card-text" style="color:red">RM<%=rs.getString(4)%></p>
              <input type="hidden" name="itemprice" value="<%=rs.getString(4)%>">
            
              <input type="submit" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="bottom" value="Order">
            </div>   
            </form>
          </div><!-- End Card with an image on top -->
        </div>  
               
        <%    }
               
                st.close();
                con.close();
        %>
      </div>
    </section>

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