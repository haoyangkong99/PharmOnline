<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Edit Product</title>
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
        <h1>Edit Product</h1>

      </div>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>

          <li class="breadcrumb-item active">Manage Product</li>
          <li class="breadcrumb-item active">Edit Product</li>
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



          <div class="card" style="width:1000px;">
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
        String query="SELECT * FROM Product WHERE product_ID='"+id+"'";
         Class.forName(driver);
         Connection con=DriverManager.getConnection(url,userName,password);
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(query);
           rs.next();
           String product_name = rs.getString(2);
           String product_category = rs.getString(5);
           String product_description = rs.getString(3);
           double product_price =rs.getDouble(4) ;
           String status = rs.getString(8);
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
 st.close();
    con.close();
    
                        %>
                    <form enctype="multipart/form-data" action="editProduct" method="post">
                        <div class="row mb-3">
                  <label for="inputText" class="col-sm-4 col-form-label">Product Name:</label>
                  <div class="col-sm-7">
                    <input type="text"  name="product_name" value="<%=product_name%>" required class="form-control">
                  </div>
                        </div>
                  
                      <div class="row mb-3">
                  <label for="inputPassword" class="col-sm-4 col-form-label">Product Description:</label>
                  <div class="col-sm-7">
                    <textarea name="product_description" required class="form-control" style="height: 100px"><%=product_description%></textarea>
                  </div>
                </div>
                  
                   <div class="row mb-3">
                  <label for="inputText" class="col-sm-4 col-form-label">Product Selling Price (RM):</label>
                  <div class="col-sm-7">
                    <input type="number"  name="new_product_price" value="<%=product_price%>" step="0.1" required class="form-control">
                  </div>
                        </div>
                  
                  <div class="row mb-3">
                  <label class="col-sm-4 col-form-label">Product Category</label>
                  <div class="col-sm-7">
                       <%
                            String query1="SELECT * FROM category ";
                            Class.forName(driver);
                            Connection con1=DriverManager.getConnection(url,userName,password);
                            Statement st1=con1.createStatement();
                            ResultSet rs1=st1.executeQuery(query1);%>
                            
                            
                    <select name="product_category" class="form-select" aria-label="Default select example">
                        <%int counter1=0;
                            while (rs1.next())
                            {
                            counter1++;
                            if (rs1.getString(2).equals(product_category)){
                            %>
                            <option value=<%=rs1.getString(2)%> selected><%=rs1.getString(2)%></option>
                            <%}
                                else{%>
                                <option value=<%=rs1.getString(2)%>><%=rs1.getString(2)%></option>
                                <%}
                            }%>
                            <%st1.close();
                         con1.close();
                         %>
                    </select>
                  </div>
                </div>
                    <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-4 col-form-label">Product Picture</label>
                  <div class="col-sm-7">
                    <img src="data:;base64,<%= base64Image%>" style="max-height: 500px;max-width: 500px; height: auto; width: auto; margin-bottom: 20px;" />
                    <input class="form-control" type="file" id="formFile" name="new_product_image"  accept="image/*">
                  </div>
                </div>
                    
                <div class="row mb-3">
                  <label class="col-sm-4 col-form-label">Product Status</label>
                  <div class="col-sm-7">
                      <% if (status.equals("Deactivate")){%>
                     <div class="form-check form-switch" style="margin-top: 10px;">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="product_status" value="Activate">
                      <label class="form-check-label" for="flexSwitchCheckDefault">Activate</label>
                    </div>
                  <%}else{%>
                     <div class="form-check form-switch" style="margin-top: 10px;">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="product_status" value="Deactivate" >
                      <label class="form-check-label" for="flexSwitchCheckChecked">Deactivate</label>
                    </div>
                  <%}%>
                  </div>
                </div>
                   <input type="hidden" name="id" value="<%=id%>" >
                   
                   
                      
          <div style="display:flex;justify-content:flex-start">
                  <a href="Manage product.jsp" class="btn btn-danger" style="margin-right:20px;">Cancel</a>
                  <input type="submit" value="Save Changes" onsubmit="alert('Updated Successfully');" class="btn btn-primary">
                  
            </div>
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
