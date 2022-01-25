<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Manage Suppliers</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="$assets/img/favicon.png" rel="icon">
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

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

   <div class="d-flex align-items-center justify-content-between">
      <a href="indexAdmin.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/PharmOnlineLogo1.png" alt="">
        <span class="d-none d-lg-block"></span>
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
        <a class="nav-link " href="indexAdmin.jsp">
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
        <a class="nav-link collapsed" href="Manage category.jsp">
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
        <a class="nav-link collapsed" href="">
          <i class="bi bi-file-earmark-word"></i>
          <span>Generate report</span>
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
        <h1>Manage Suppliers</h1>

      </div>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>

          <li class="breadcrumb-item active">Manage Suppliers</li>
        </ol>
      </nav>


    </div><!-- End Page Title -->
    <script>
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



    </script>
      <section class="section">
      <div class="row">
        <div class="col-lg-6">



          <div class="card" style="width:1200px;">
            <div class="card-body" >
              <h5 class="card-title"></h5>



              <div style="display: flex; justify-content: left;">
                <div style="padding-right: 100px;">
                    <form action="addSupplier" method="post">
                  <table>


                    <tr>
                      <td><label for="inputText" class="col-sm-auto col-form-label">Suppliers Name</label></td>
                      <td>:</td>
                      <td>
                          <div class="col-sm-10">
                    <input type="text" class="form-control" name="suppliername" required>
                  </div>
                          
                      </td>
                    </tr>
                    <tr>
                      <td><label for="inputText" class="col-sm-auto col-form-label">Contact Number</label></td>
                      <td>:</td>
                      <td>
                      <div class="col-sm-10">
                     <input type="text" class="form-control" name="contact" placeholder="01x-xxxxxxxx" pattern="01[0-9]{1}-[0-9]{7,8}" required>
                     
                  </div>
                          </td>
                    </tr>
                    <tr>
                      <td><label for="inputText" class="col-sm-auto col-form-label">Address</label></td>
                      <td>:</td>
                      <td>
                          <div class="col-sm-10">
                    <input type="text"  class="form-control" name="address" required>
                  </div>
                        
                      </td>
                    </tr>
                    <tr>
                      <td><label for="inputText" class="col-sm-auto col-form-label">Description</label>
                          </td>
                      <td>:</td>
                      <td>
                          <div class="col-sm-10">
                    
                    <input type="text"  class="form-control"name="description" required>

                  </div>
                      </td>
                    </tr>
                    <tr>
                      <td><label for="inputText" class="col-sm-auto col-form-label">Join Date</label>
                          </td>
                      <td>:</td>
                      <td>
                      <div class="col-sm-10">
                   
                    <input type="date" class="form-control" name="date" required>
                  </div>
                        
                      </td>
                    </tr>

                  </table>
                   
                </div>
              </div>

              <br>
              <div>
                 <input type="reset" value="Reset" class="btn btn-outline-secondary">&nbsp;&nbsp;
                <button type="submit" class="btn btn-primary"><i class="bi bi-plus"></i> New Suppliers</button>
              </div>
 </form>



            </div>

          </div>








        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">


          <div class="card" style="width:1200px;">
            <div class="card-body">
                    
                <a href="Manage suppliers.jsp">
                    <h5 class="card-title"><i class="bi bi-arrow-repeat"></i> Suppliers List</h5></a>
                
              
                 <table class="table table-borderless datatable" >
                     <tr>
              <th>No</th><th>Supplier Name</th><th>Supplier ID</th><th>Contact No</th><th>Address</th><th>Description</th><th>Join Date</th><th>Action</th>
                </tr>
                <%
                     String driver ="com.mysql.jdbc.Driver";
        String dbName="PharmOnline";
        String url="jdbc:mysql://localhost/"+dbName+"?";
        String userName="root";
        String password="";
      
        String query="SELECT * FROM Supplier ";
        
           Class.forName(driver);
           Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(query);
       
            /* TODO output your page here. You may use following sample code. */
            int counter=0;
            while (rs.next())
            {
                
                counter++;
                
                
               
                out.println("<tr>");
                out.println("<td>"+Integer.toString(counter)+"</td>");
       out.println("<td>"+rs.getString(1)+"</td>");
                                 out.println("<td>"+rs.getString(2)+"</td>");
                                  out.println("<td>"+rs.getString(3)+"</td>");
                                   out.println("<td>"+rs.getString(4)+"</td>");
                                     out.println("<td>"+rs.getString(5)+"</td>");
                                    out.println("<td>"+rs.getDate(6).toString()+"</td>");
                                    
                                    out.println( 
                                    "<td> "+"<div style='display: block;'>");
                                    out.println("<a href='deleteSupplier?id="+rs.getString(2)+"' onclick=' return confirm("+'"'+"Are you sure to delete this supplier"+'"'+")"+
                                            "'>");
                                    out.println( "<i class='bx bxs-trash'></i>");
                                    out.println("</a>");
                                    
                                    out.println("<a href=\"Edit supplier.jsp?id="+rs.getString(2)
                                            +"\">");
                                    out.println( "<i class='bx bxs-edit'></i>");
                                    out.println("</a>");
                                   
                                    out.println("</div></td>");
                                    
                                          
                                          
                                    
            out.println("</tr>");
            
            }
            
        
        st.close();
        con.close();
                    %>
                     
              
                 </table>
             





            </div>
          </div>



        </div>



        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>PharmaOnline</span></strong>. All Rights Reserved
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