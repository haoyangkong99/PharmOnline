<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bean.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Manage Stock</title>
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
<style>
  td,th{
    padding: 7px;
  }
  .Transaction td,.Transaction th
  {
    border: 1px solid black;
  }

</style>
</head>

<body>
        <%
            User user = new User();
        if(request.getMethod().equals("GET") && request.getSession().getAttribute("loggedIn") == null){
//           String redirectURL = "login.jsp";
//           response.sendRedirect(redirectURL); 
           
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please Login First!');");
        out.println("location='login.jsp';");
        out.println("</script>");
        }
        else{
        user = (User) request.getSession().getAttribute("user");
        if(!user.getUserType().equals("Pharmacist")){
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
        <a class="nav-link collapsed " href="indexAdmin.jsp">
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
        <a class="nav-link " href="Manage stock.jsp">
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
        <h1>Manage Stock</h1>

      </div>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>

          <li class="breadcrumb-item active">Manage Stock</li>
        </ol>
      </nav>


    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">



          <div class="card" style="width:1300px;">
            <div class="card-body" >
              <h5 class="card-title"></h5>



              <div style="display: flex; justify-content: left;">
                <div style="padding-right: 100px;">
                    <form  action="stockOperation" method="post">
                  <table>
                      

                    <tr>
                        <td><label for="inputText" class="col-sm-auto col-form-label">Operation</label></td>
                    <td>:</td>
                     
                      <td>
                          <div class="form-check">
                          <input type="radio" class="form-check-input" name="action" value="Add Stock"  required>
                          <label class="form-check-label" for="gridRadios1">Add Stock
                          </div>
                          <div class="form-check">
                        <input type="radio"  class="form-check-input" name="action" value="Return Stock"><label class="form-check-label" for="gridRadios1">Return Stock
                        </div>
                      </td>
                    </tr>
              
                    <tr>
                         <td><label for="inputText" class="col-sm-auto col-form-label">Suppliers</label></td>
                    <td>:</td>
                      
                      <td>
                          <div class="col-sm-auto">
                          <select class="form-select" aria-label="Default select example" name="supplier" >
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
           while(rs.next())
           {
               String suppliername=rs.getString(1);
           String supplierID=rs.getString(2);
           out.println("<option value='"+supplierID+"'>"+suppliername+"</option>");
           };
                          %>
                          
                        </select>
                           </div>
                      </td>
                    </tr>

                    <script>
                        function expiryDateRange()
                        {
                            var minDate=document.getElementByName("arrival").value;
                            document.getElementByName("expiry").min=minDate;
                            
                        }
                        
                    </script>

                    <tr>
                        <td><label for="inputText" class="col-sm-auto col-form-label">Arrival Date</label></td>
                    <td>:</td>
                      
                      <td>
                          <div class="col-sm-auto">
                          <input type="date" class="form-control" name="arrival"  oninput=""required>
                          </div>
                      </td>
                    </tr>
                  

                    <tr>
                         <td><label for="inputText" class="col-sm-auto col-form-label">Cost (RM)</label></td>
                    <td>:</td>
                    
                      <td>
                          <div class="col-sm-auto">
                         <input type="number" class="form-control" name="cost" step="0.01" required >
                        </div>
                      </td>
                    </tr>


                  </table>
                </div>
                <div>
                  <table>
                    
                    <tr>
                           <td><label for="inputText" class="col-sm-auto col-form-label">Reference No</label></td>
                    <td>:</td>
                    
                      <td>
                          <div class="col-sm-auto">
                        <input type="text" name="reference" class="form-control" required>
                         </div>
                      </td>
                    </tr>
                    
                    <tr>
                               <td><label for="inputText" class="col-sm-auto col-form-label">Product Name</label></td>
                    <td>:</td>
                    
                      <td>
                          <div class="col-sm-auto">
                        <select name="product" class="form-select" aria-label="Default select example">
                            <%
                          
        String queryProduct="SELECT * FROM Product ";
      
           Statement statementProduct=con.createStatement();
           ResultSet rsProduct=statementProduct.executeQuery(queryProduct);
           while(rsProduct.next())
           {
               String productID=rsProduct.getString(1);
           String productName=rsProduct.getString(2);
           out.println("<option value='"+productID+"'>"+productName+"</option>");
           };
                          %>
                            
                        </select>
                           </div>
                      </td>
                    </tr>
                    
                    <tr>
                 <td><label for="inputText" class="col-sm-auto col-form-label">Expiry Date</label></td>
                    <td>:</td>
                    
                      
                      <td>
                           <div class="col-sm-auto">
                          <input type="date" class="form-control" name="expiry"  required>
                          </div>
                      </td>
                    </tr>

                    <tr>
                        <td><label for="inputText" class="col-sm-auto col-form-label">Quantity</label></td>
                    <td>:</td>
                    
                     
                      <td>
                           <div class="col-sm-auto">
                        <input type="number" class="form-control" name="quantity" step="1" min="1"  required>
                          </div>
                      </td>
                    </tr>
                  </table>
                </div>
                  
              </div>
              <br><br>
              <div>
                  <input type="reset" value="Reset" class="btn btn-outline-secondary">&nbsp;&nbsp;
                <button type="submit" class="btn btn-primary"><i class="bi bi-check"></i>Confirm</button>
              </div>
               </form>

              



            </div>

          </div>








        </div>
      </div>
      <!--Row 2-->
      <div class="row">
        <div class="col-lg-6">


          <div class="card" style="width: 1300px;">
            <div class="card-body">
                <a href="Manage stock.jsp">
                    <h5 class="card-title"><i class="bi bi-arrow-repeat"></i> Stock Transaction</h5></a>

              <table class="table table-borderless datatable">
                  <thead>
                  <tr>
                  <th>
                    No
                  </th>
                  <th>Operation</th>
                  <th>Supplier Name</th>
                  <th>Product Name</th>
                  <th>Product ID</th>
                  <th>Arrival Date</th>
                  <th>Expiry Date</th>
                  <th>Cost<br>(RM)</th>

                  <th>Quantity</th>
                  <th>Reference<br>No</th>
                  <th>Action</th>
                </tr>
                  </thead>
                <%
               String queryStock="SELECT * FROM stock ";
              
   
           
           Statement statementStock=con.createStatement();
           ResultSet rsStock=statementStock.executeQuery(queryStock);
        ResultSet rsSupplier;
        String queryx="";
         Statement statement=con.createStatement();
         int counter=0;
                while (rsStock.next())
                {
                   String id=rsStock.getString(3);
                   
                    queryx="SELECT * FROM supplier Where supplierID='"+id+"'";
                    String queryProductName="SELECT * FROM product Where product_ID='"+rsStock.getString(4)+"'";
                    Statement statementProductName=con.createStatement();
                    ResultSet rsProductName=statementProductName.executeQuery(queryProductName);
                    rsSupplier=statement.executeQuery(queryx);
                    rsSupplier.next();
                     rsProductName.next();
                    counter++;
                    out.println("<tr>");
                out.println("<td>"+counter+"</td>");
                out.println("<td>"+rsStock.getString(2)+"</td>");
                out.println("<td>"+rsSupplier.getString(1)+"</td>");
                out.println("<td>"+rsProductName.getString(2)+"</td>");
                out.println("<td>"+rsStock.getString(4)+"</td>");
                out.println("<td>"+rsStock.getDate(8)+"</td>");
                out.println("<td>"+rsStock.getDate(9)+"</td>");
                out.println("<td>"+String.format("%.2f", rsStock.getDouble(5))+"</td>");
                if (rsStock.getDouble(6)%1==0)
                {
                    out.println("<td>"+String.format("%.0f", rsStock.getDouble(6))+"</td>");
                }
                else
                {
                     out.println("<td>"+ rsStock.getDouble(6)+"</td>");
                }
                
               out.println("<td>"+rsStock.getString(7)+"</td>");
               out.println( 
                                    "<td> "+"<div style='display: block;'>");
out.println("<a href='deleteStock?id="+rsStock.getString(1)+"' onclick=' return confirm("+'"'+"Are you sure to delete this stock"+'"'+")"+
                                            "'>");;
                out.println( "<i class='bx bxs-trash'></i>");
                                    out.println("</a>");
                                    
                                    out.println("<a href=\"Edit stock.jsp?id="+rsStock.getString(1)
                                            +"\">");
                                    out.println( "<i class='bx bxs-edit'></i>");
                                    out.println("</a>");
                                   
                                    out.println("</div></td>");
                out.println("</tr>");
                }
          
                      st.close();
                      statementProduct.close();
                      statementStock.close();
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