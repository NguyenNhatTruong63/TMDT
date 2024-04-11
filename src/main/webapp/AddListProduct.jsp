<%@ page import="Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phấm</title>
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
        <% List<Product> list = (List<Product>) request.getAttribute("listproduct"); %>
        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div><h1>Danh sách sản phẩm</h1></div>
                    <div><a href="AddProduct.jsp" class="btn btn-primary"> Thêm sản phẩm</a></div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table"
                                           style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Giá bán</th>
                                            <th>Số lượng sản phẩm</th>
                                            <th>Số lượng đã bán</th>
                                            <th>Trạng thái</th>
                                            <th>Hoạt động</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for(Product p : list){%>
                                        <tr>
                                            <td><img class="tbl-thumb" src="<%=p.getImages().get(0)%>" alt="Product Image" /></td>
                                            <td><%=p.getName()%></td>
                                            <td><%=p.getPrice()%>VNĐ</td>
                                            <td><%=p.getPrice_buy()%>VNĐ</td>
                                            <td><%=p.getQuantity()%></td>
                                            <td><%=p.getProduct_sold()%></td>
                                            <td><%=p.getStock()%></td>
                                            <td>
                                                <div class="btn-group mb-1">
                                                    <a class="btn btn-outline-success" href="AddProduct?id=<%=p.getId()%>">Chỉnh sửa</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>
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
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>

<!-- Datatables -->
<script src='assets/plugins/data-tables/jquery.datatables.min.js'></script>
<script src='assets/plugins/data-tables/datatables.bootstrap5.min.js'></script>
<script src='assets/plugins/data-tables/datatables.responsive.min.js'></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
