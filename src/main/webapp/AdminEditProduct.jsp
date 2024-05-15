<%@ page import="Entity.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

    <title>Chỉnh sửa sản phẩm</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
            rel="stylesheet">

    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet"/>

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet"/>
    <link href='assets/plugins/slick/slick.min.css' rel='stylesheet'>
    <link href='assets/plugins/swiper/swiper-bundle.min.css' rel='stylesheet'>

    <!-- ekka CSS -->
    <link id="ekka-css" rel="stylesheet" href="assets/css/ekka.css"/>

    <!-- FAVICON -->
    <%--  <link href="assets/img/logoshop.png" rel="shortcut icon" />--%>

</head>
<%Locale locale = new Locale("vi", "VN");%>
<%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">
<!-- WRAPPER -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <jsp:include page="Layout/AdminSidebar.jsp"/>

    <!-- PAGE WRAPPER -->
    <div class="ec-page-wrapper">
        <% Product product = (Product) request.getAttribute("product"); %>
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
                                    <div class="d-inline-block">
                                        Admin <small class="pt-1">
                                        <p>admin@gmail.com</p>
                                    </small>
                                    </div>
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
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Chỉnh sửa sản phẩm</h1>
                        <p class="breadcrumbs"><span><a href="AdminIndex?idpd=<%=product.getId()%>">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Chỉnh sửa sản phẩm
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Chỉnh sửa sản phẩm</h2>
                            </div>

                            <div class="card-body product-detail">
                                <form action="AdminUpdateProduct?idpd=<%=product.getId()%>" method="post">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-6">
                                            <div class="row">
                                                <div class="single-pro-img">
                                                    <div class="single-product-scroll">
                                                        <div class="single-product-cover">
                                                            <% for (String link : product.getImages()) { %>
                                                            <div class="single-slide zoom-image-hover">
                                                                <img style="max-width: 371px; max-height: 371px;"
                                                                     class="img-responsive"
                                                                     src="<%=link%>"
                                                                     alt="">
                                                            </div>
                                                            <% } %>
                                                        </div>
                                                        <div class="single-nav-thumb">
                                                            <% for (String linkI : product.getImages()) { %>
                                                            <div class="single-slide">
                                                                <img style="max-width: 72px; max-height: 48px;"
                                                                     class="img-responsive"
                                                                     src="<%=linkI%>"
                                                                     alt="">
                                                            </div>
                                                            <% } %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-5 col-lg-6">
                                            <div class="row product-overview" style="width: 600px">
                                                <div class="col-12">
                                                    <div>
                                                        <Label class="product-sku">Mã sản phẩm: <label
                                                                class="form-control"><%=product.getId()%>
                                                        </label>
                                                        </Label>

                                                        <Label class="product-title">Tên sản phẩm
                                                            <input type="text" class="form-control" name="nameproduct"
                                                                   value="<%=product.getName()%>" required>
                                                        </Label>
                                                    </div>
                                                    <div>
                                                        <Label class="product-sku">Thương hiệu
                                                            <input type="text" class="form-control" name="brand"
                                                                   value="<%=product.getBrand()%>" required>
                                                        </Label>

                                                        <%--                                                    <span class="text-uppercase">Loại sản phẩm</span>--%>
                                                        <Label for="lang-select"> Loại sản phẩm
                                                            <select name="category" id="lang-select"
                                                                    class="form-control">
                                                                <% if (product.getCategory() == 1) { %>
                                                                <option value="4" selected>Sách giáo trình</option>
                                                                <option value="3">Sách cũ</option>
                                                                <option value="2">Sách tiếng anh</option>
                                                                <option value="1">Sách chuyên ngành</option>
                                                                <% } else if (product.getCategory() == 2) { %>
                                                                <option value="4">Sách giáo trình</option>
                                                                <option value="3" selected>Sách cũ</option>
                                                                <option value="2">Sách tiếng anh</option>
                                                                <option value="1">Sách chuyên ngành</option>
                                                                <% } else if (product.getCategory() == 3) { %>
                                                                <option value="4">Sách giáo trình</option>
                                                                <option value="3">Sách cũ</option>
                                                                <option value="2" selected>Sách tiếng anh</option>
                                                                <option value="1">Sách chuyên ngành</option>
                                                                <% } else { %>
                                                                <option value="4">Sách giáo trình</option>
                                                                <option value="3">Sách cũ</option>
                                                                <option value="2">Sách tiếng anh</option>
                                                                <option value="1" selected>Sách chuyên ngành</option>
                                                                <% } %>
                                                            </select>
                                                        </Label>
                                                    </div>

                                                    <div>

                                                        <%--                                                    <br>--%>
                                                        <Label class="product-prict">Giá: VND
                                                            <input type="text" class="form-control" name="price"
                                                                   value="<%=currencyFormatter.format(product.getPrice())%>"
                                                                   required>
                                                        </Label>
                                                        <%--                                                    <br>--%>
                                                        <Label class="product-sku">Giá bán: VND
                                                            <input type="text" class="form-control" name="pricebuy"
                                                                   value="<%=currencyFormatter.format(product.getPrice_buy()) %>"
                                                                   required>
                                                        </Label>
                                                    </div>
                                                    <div>
                                                        <Label class="product-stock">Số lượng
                                                            <input type="number" class="form-control" name="quantity"
                                                                   value="<%=product.getQuantity()%>" required>
                                                        </Label>
                                                        <label class="product-detail">Chi tiết
                                                            <input type="text" class="form-control" name="detail"
                                                                   value="<%=product.getDetail()%>" required>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-end mt-5">
                                        <button type="submit"
                                                class="btn btn-primary mb-2 btn-pill">Cập nhật sản phẩm
                                        </button>
                                    </div>
                                </form>
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
</div>
<!-- Common Javascript -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>
<script src="assets/plugins/swiper/swiper-bundle.min.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
