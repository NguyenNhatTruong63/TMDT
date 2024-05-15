<%@ page import="Entity.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Order" %>
<%@ page import="Entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Trang chủ</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet"/>
    <link href="assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet"/>
    <link id="ekka-css" href="assets/css/ekka.css" rel="stylesheet"/>
<%--    <link href="assets/img/logoshop.png" rel="shortcut icon"/>--%>
</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light" id="body">

<!--  WRAPPER  -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <jsp:include page="Layout/AdminSidebar.jsp"/>
    <%
        List<Account> listAccount = (List<Account>) request.getAttribute("listaccount");
        List<Order> listOrder = (List<Order>) request.getAttribute("listorder");
        List<Product> listProduct = (List<Product>) request.getAttribute("listproduct");
    %>
    <!--  PAGE WRAPPER -->
    <div class="ec-page-wrapper">

        <!-- Header -->
        <header class="ec-main-header" id="header">
            <nav class="navbar navbar-static-top navbar-expand-lg">
                <!-- Sidebar toggle button -->
                <button id="sidebar-toggler" class="sidebar-toggle"></button>
                <!-- search form. don't use -->
                <div class="search-form d-lg-inline-block">
                </div>

                <!-- navbar right -->
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account -->
                        <li class="dropdown user-menu">
                            <button class="dropdown-toggle nav-link ec-drop" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                <img src="assets/img/user/user.png" class="user-image" alt="User Image"/>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right ec-dropdown-menu">
                                <!-- User image -->
                                <li class="dropdown-header">
                                    <img src="assets/img/user/user.png" class="img-circle" alt="User Image"/>
                                    <div class="d-inline-block">Admin <small class="pt-1"><p>admin@gmail.com</p></small></div>
                                </li>
                                <li class="right-sidebar-in">
                                    <a href="javascript:0"> <i class="mdi mdi-settings-outline"></i> Cài đặt </a>
                                </li>
                                <li class="dropdown-footer">
                                    <a href="LogOut"> <i class="mdi mdi-logout"></i> Đăng xuất </a>
                                </li>
                            </ul>
                        </li>
                        <li class="right-sidebar-in right-sidebar-2-menu">
                            <i class="mdi mdi-settings-outline mdi-spin"></i>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <!-- Top Statistics -->
                <div class="row">
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-1">
                            <div class="card-body">
                                <h2 class="mb-1"><%=listAccount.size()%>
                                </h2>
                                <p>Khách hàng đăng ký <br>tài khoản trong tuần này</p>
                                <span class="mdi mdi-account-arrow-left"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 p-b-15 lbl-card">
                        <div class="card card-mini dash-card card-3">
                            <div class="card-body">
                                <h2 class="mb-1"><%=listOrder.size()%>
                                </h2>
                                <p>Đơn hàng đặt<br> trong tuần này</p>
                                <span class="mdi mdi-package-variant"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 p-b-15">
                        <!-- Recent Order Table -->
                        <div class="card card-table-border-none card-default recent-orders" id="recent-orders">
                            <div class="card-header justify-content-between">
                                <h2>Những đơn hàng gần đây</h2>
                            </div>
                            <div class="card-body pt-0 pb-5">
                                <table class="table card-table table-responsive table-responsive-large"
                                       style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID Đơn hàng</th>
                                        <th class="d-none d-lg-table-cell">Ngày đặt</th>
                                        <th class="d-none d-lg-table-cell">Thành tiền</th>
                                        <th>Trạng thái</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% for (Order o : listOrder) { %>
                                    <tr>
                                        <td><a href="AdminOrder?idorder=<%=o.getId()%>"><%=o.getId()%>
                                        </a></td>
                                        <td class="d-none d-lg-table-cell"><%=o.getDate().toString()%>
                                        </td>
                                        <td class="d-none d-lg-table-cell"><%=o.getTotal()%>VNĐ</td>
                                        <td>
                                            <span class="badge badge-warning"><%=o.getStatus()%></span>
                                        </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-5">
                        <!-- New Customers -->
                        <div class="card ec-cust-card card-table-border-none card-default">
                            <div class="card-header justify-content-between ">
                                <h2>Những khách hàng mới</h2>
                            </div>
                            <div class="card-body pt-0 pb-15px">
                                <table class="table ">
                                    <tbody>
                                    <% for (Account a : listAccount) { %>
                                    <tr>
                                        <tdx>
                                            <div class="media">
                                                <div class="media-image mr-3 rounded-circle">
                                                    <% if (a.getSex() == 1) {%>
                                                    <a href="AdminUser?id=<%=a.getUsername()%>"><img
                                                            class="profile-img rounded-circle w-45"
                                                            src="assets/img/user/u1.jpg"
                                                            alt="customer image"></a>
                                                    <% } else { %>
                                                    <a href="AdminUser?id=<%=a.getUsername()%>"><img
                                                            class="profile-img rounded-circle w-45"
                                                            src="assets/img/user/u2.jpg"
                                                            alt="customer image"></a>
                                                    <% } %>
                                                </div>
                                                <div class="media-body align-self-center">
                                                    <a href="AdminUser?id=<%=a.getUsername()%>">
                                                        <h6 class="mt-0 text-dark font-weight-medium"><%=a.getFullName()%>
                                                        </h6>
                                                    </a>
                                                    <small><%=a.getUsername()%>
                                                    </small>
                                                </div>
                                            </div>
                                        </tdx>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-7">
                        <!-- Top Products -->
                        <div class="card card-default ec-card-top-prod">
                            <div class="card-header justify-content-between">
                                <h2>Sản phẩm hàng đầu</h2>
                            </div>
                            <div class="card-body mt-10px mb-10px py-0">
                                <% for (Product p : listProduct) { %>
                                <div class="row media d-flex pt-15px pb-15px">
                                    <div class="col-lg-3 col-md-3 col-2 media-image align-self-center rounded">
                                        <a href="AdminProduct?id=<%=p.getId()%>"><img
                                                src="<%=p.getImages().get(0)%>"
                                                alt="customer image"></a>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-10 media-body align-self-center ec-pos">
                                        <a href="AdminProduct?id=<%=p.getId()%>">
                                            <h6 class="mb-10px text-dark font-weight-medium"><%=p.getName()%>
                                            </h6>
                                        </a>
                                        <p class="float-md-right sale">Đã bán <span
                                                class="mr-2"><%=p.getProduct_sold()%></span><br>sản
                                            phẩm</p>
                                        <p class="mb-0 ec-price">
                                            <span class="text-dark"><%=p.getPrice_buy()%>VNĐ</span>
                                        </p>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End Content -->
        </div> <!-- End Content Wrapper -->

        <!-- Footer -->
        <footer class="footer mt-auto">
            <div class="copyright bg-white">
                <p>Copyright &copy; <span id="ec-year"></span></p>
            </div>
        </footer>

    </div> <!-- End Page Wrapper -->
</div> <!-- End Wrapper -->

<!-- Common Javascript -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>

<!-- Chart -->
<script src="assets/plugins/charts/Chart.min.js"></script>
<script src="assets/js/chart.js"></script>

<!-- Google map chart -->
<script src="assets/plugins/charts/google-map-loader.js"></script>
<script src="assets/plugins/charts/google-map.js"></script>

<!-- Date Range Picker -->
<script src="assets/plugins/daterangepicker/moment.min.js"></script>
<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="assets/js/date-range.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
