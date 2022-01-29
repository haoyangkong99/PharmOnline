<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="com.bean.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Edit Category</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/icon_PharmOnline.png" rel="icon">
  <link href="$assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="$https://fonts.gstatic.com" rel="preconnect">
  <link href="$https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="$assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.1.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
    td,th
    {
      padding: 5px;
    }
    .list td,.list th{
      border: 1px solid black;
      padding: 20px;
    }
    .list th
    {
      color: blue;
    }
  </style>
</head>

<body>
<%
        if(request.getMethod().equals("GET") && request.getSession().getAttribute("loggedIn") == null){
//           String redirectURL = "login.jsp";
//           response.sendRedirect(redirectURL); 
           
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please Login First!');");
        out.println("location='login.jsp';");
        out.println("</script>");
        }
        
        User user = (User) request.getSession().getAttribute("user");
        if(!user.getUserType().equals("Pharmacist")){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You do not have access to this page!');");
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
        <a class="nav-link collapsed" href="indexAdmin.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="ManageOrder.jsp">
          <i class="bi bi-clipboard-check"></i>
          <span>Manage order</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="Manage product.jsp">
           <i class='bx bxs-capsule'></i>
          <span>Manage product</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link " href="Manage category.jsp">
          <i class="bi bi-grid"></i>
          <span>Manage category</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="Manage stock.jsp">
          <i class="bi bi-box"></i>
          <span>Manage stock</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="Manage suppliers.jsp">
          <i class="bi bi-truck"></i>
          <span>Manage suppliers</span>
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

    <div class="pagetitle" >
      <div style="display: flex; justify-content: space-between;">
        <h1>Edit Category</h1>

      </div>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>

          <li class="breadcrumb-item active">Manage Category</li>
          <li class="breadcrumb-item active">Edit Category</li>
        </ol>
      </nav>


    </div><!-- End Page Title -->
<!--    <script>
      class suppliers{
        constructor (name,contact,id,address,JDate,description)
        {
          this.name=name;
          this.contact=contact;
          this.id=id;
          this.address=address;
          this.JDate=JDate;
          this.description=description;
        }
      }
    </script>-->
      <section class="section">
      <div class="row">
        <div class="col-lg-6">



          <div class="card" style="width:1200px;">
            <div class="card-body" >
              <h5 class="card-title"></h5>

             

              <div style="display: flex; justify-content: flex-start">
                <div style="padding-right: 100px;">
                    <%
                        String id=request.getParameter("id");
                         String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
        String query="SELECT * FROM Category WHERE Category_ID='"+id+"'";
         Class.forName(driver);
         Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(query);
           rs.next();
           
           String name=rs.getString(2);
String description=rs.getString(3);
 st.close();
    con.close();
                        %>
                    <form action="editCategory" method="post">
                        <div class="row mb-3">
                  <label for="inputText" class="col-sm-6 col-form-label">Category Name:</label>
                  <div class="col-sm-6">
                    <input type="text"  name="category_name" value="<%=name%>" required class="form-control">
                  </div>
                        </div>
                        
                         <div class="row mb-3">
                  <label for="inputText" class="col-sm-6 col-form-label">Category Description:</label>
                  <div class="col-sm-6">
                    <input type="text"  name="category_description" value="<%=description%>" required class="form-control">
                  </div>
                        </div>
                  
                      <input type="hidden" name="id" value="<%=id%>" >
                      
          <div style="display:flex;justify-content: flex-start">
                  <a href="Manage category.jsp" class="btn btn-danger" style="margin-right:20px;">Cancel</a>
                  <input type="submit" value="Save Changes" onsubmit="alert('Updated Successfully');" class="btn btn-primary">
              
            </div>
                </div>
              </div>

                            
 </form>
                </div>
              </div>

              <br><br>
              




            </div>

          </div>








        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">


       



        </div>



        </div>
      </div>
    </section>

  </main><!-- End #main -->

 

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