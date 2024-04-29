<%@ page import="Entity.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

    <title>Chi tiết sản phẩm</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
            rel="stylesheet">

    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />
    <link href='assets/plugins/slick/slick.min.css' rel='stylesheet'>
    <link href='assets/plugins/swiper/swiper-bundle.min.css' rel='stylesheet'>

    <!-- ekka CSS -->
    <link id="ekka-css" rel="stylesheet" href="assets/css/ekka.css" />

    <!-- FAVICON -->
    <link href="assets/img/logoshop.png" rel="shortcut icon" />

</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">
<!-- WRAPPER -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <jsp:include page="Layout/BarPost.jsp"/>

    <!-- PAGE WRAPPER -->
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
                        <li class="right-sidebar-in right-sidebar-2-menu">
                            <i class="mdi mdi-settings-outline mdi-spin"></i>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <% Product product = (Product) request.getAttribute("product"); %>
        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Chi tiết sản phẩm</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Chi tiết sản phẩm</h2>
                                <a class="nav-link" href="AEditProduct?id=<%=product.getId()%>" >Chỉnh sửa</a>
                            </div>

                            <div class="card-body product-detail">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-6">
                                        <div class="row">
                                            <div class="single-pro-img">
                                                <div class="single-product-scroll">
                                                    <div class="single-product-cover">
                                                        <% for(String link : product.getImages()) { %>
                                                        <div class="single-slide zoom-image-hover">
                                                            <img style="max-width: 371px; max-height: 371px;" class="img-responsive"
                                                                 src="<%=link%>"
                                                                 alt="">
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                    <div class="single-nav-thumb">
                                                        <% for(String linkI : product.getImages()){ %>
                                                        <div class="single-slide">
                                                            <img style="max-width: 72px; max-height: 48px;" class="img-responsive"
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
                                        <%Locale locale = new Locale("vi", "VN");%>
                                        <%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>
                                        <div class="row product-overview">
                                            <div class="col-12">
                                                <h5 class="product-title"><%=product.getName()%></h5>
                                                <br>
                                                <p class="product-price">Mã sản phẩm: <%=product.getId()%></p>
                                                <p class="product-price">Thương hiệu: <%=product.getBrand()%></p>
                                                <p class="product-price">Loại sản phẩm:
                                                    <% if(product.getCategory()==1){ %>
                                                    Sách giáo trình
                                                    <% }else if(product.getCategory()==2){%>
                                                    Sách cũ
                                                    <% }else if(product.getCategory()==3){%>
                                                    Sách tiếng anh
                                                    <% }else{ %>
                                                    Sách giáo trình
                                                    <% } %>
                                                </p>
                                                <p class="product-price">Giá: <%=currencyFormatter.format(product.getPrice())%>VNĐ</p>
                                                <p class="product-price">Giá bán: <%=currencyFormatter.format(product.getPrice_buy())%>VNĐ</p>
                                                <p class="product-price">Số lượng còn lại: <%=product.getQuantity()%></p>
                                                <p class="product-price">Số lượng đã bán: <%=product.getProduct_sold()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row review-rating mt-4">
                                    <div class="col-12">
                                        <ul class="nav nav-tabs" id="myRatingTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="product-detail-tab"
                                                   data-bs-toggle="tab" data-bs-target="#productdetail"
                                                   href="#productdetail" role="tab" aria-selected="true">
                                                    <i class="mdi mdi-library-books mr-1"></i> Mô tả</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent2">
                                            <div class="tab-pane pt-3 fade show active" id="productdetail"
                                                 role="tabpanel">
                                                <%=product.getDetail()%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
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
<script src="assets/plugins/swiper/swiper-bundle.min.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>