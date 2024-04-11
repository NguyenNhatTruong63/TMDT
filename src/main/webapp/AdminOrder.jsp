<%@ page import="Entity.Order" %>
<%@ page import="Entity.ProductOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Ekka - Admin Dashboard HTML Template.">

    <title>Chi tiết đơn hàng</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />

    <!-- Ekka CSS -->
    <link id="ekka-css" rel="stylesheet" href="assets/css/ekka.css" />

    <!-- FAVICON -->
<%--    <link href="assets/img/logoshop.png" rel="shortcut icon" />--%>
</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">

<!-- WRAPPER -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <jsp:include page="Layout/AdminSidebar.jsp"/>

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
                        <!-- User Account -->
                        <li class="dropdown user-menu">
                            <button class="dropdown-toggle nav-link ec-drop" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                <img src="assets/img/user/user.png" class="user-image" alt="User Image" />
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right ec-dropdown-menu">
                                <!-- User image -->
                                <li class="dropdown-header">
                                    <img src="assets/img/user/user.png" class="img-circle" alt="User Image" />
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
        <% Order order = (Order) request.getAttribute("order");
            Map<Product, Integer> map = (Map<Product, Integer>)request.getAttribute("listproduct"); %>
        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="ec-odr-dtl card card-default">
                            <div class="card-header card-header-border-bottom d-flex justify-content-between">
                                <h2 class="ec-odr">Chi tiết đơn hàng<br>
                                    <span class="small">ID đặt hàng: #<%=order.getId()%>></span>
                                </h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Khách hàng:</strong></div><br>
                                            <div class="info-content">
                                                <%=order.getFullname()%><br>
                                                <abbr >Số điện thoại: </abbr> <%=order.getPhone()%>
                                                <p>Ghi chú của khách hàng: <%=order.getComment()%></p>
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Vận chuyển đến:</strong></div><br>
                                            <div class="info-content">
                                                    <%=order.getAddress()%>
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Phương thức thanh toán</strong></div><br>
                                            <div class="info-content">
                                                <%=order.getPayment()%>
                                            </div>
                                            <br>
                                            <div class="info-content">Bên vận chuyện:  <%=order.getShip()%></div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Ngày đặt hàng</strong></div><br>
                                            <div class="info-content">
                                                <%=order.getTime()%><br>
                                                <%=order.getDate()%>
                                            </div>
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="tbl-title">Tóm tắt sản phẩm</h3>
                                        <div class="table-responsive">
                                            <table class="table table-striped o-tbl">
                                                <thead>
                                                <tr class="line">
                                                    <td><strong>#</strong></td>
                                                    <td class="text-center"><strong>Hình ảnh</strong></td>
                                                    <td class="text-center"><strong>Sản phẩm</strong></td>
                                                    <td class="text-center"><strong>Giá</strong></td>
                                                    <td class="text-right"><strong>Số lượng</strong></td>
                                                    <td class="text-right"><strong>Tổng cộng</strong></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% Set<Product> set = map.keySet();
                                                    for(Product p : set)
                                                    { %>
                                                    <tr>
                                                    <td><%=p.getId()%></td>
                                                    <td><img class="product-img"
                                                    src="<%=p.getImages().get(0)%>" alt="" /></td>
                                                    <td><strong><%=p.getName()%></strong></td>
                                                    <td class="text-center"><%=p.getPrice_buy()%></td>
                                                    <td class="text-center"><%=map.get(p)%></td>
                                                    <td class="text-right"><%=p.getPrice_buy()*map.get(p)%>&nbsp;VNĐ</td>
                                                </tr>
                                                <%}%>

                                                <tr>
                                                    <td colspan="4"></td>
                                                    <td class="text-right"><strong>Phí vận chuyển</strong></td>
                                                    <td class="text-right"><strong><%=order.getTotalship()%>&nbsp;VNĐ</strong></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                    </td>
                                                    <td class="text-right"><strong>Tổng cộng</strong></td>
                                                    <td class="text-right"><strong><%=order.getTotal()%>&nbsp;VNĐ</strong></td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Tracking Detail -->
                        <div class="card mt-4 trk-order">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                            <form action="AdminEditOrder?idorder=<%=order.getId()%>" method="post">
                                <span class="text-uppercase">Trạng thái đơn hàng</span>
                                <select name="status" id="lang-select">
                                    <%if(order.getStatus().equals("Đang xử lý")){ %>
                                    <option value="Đang xử lý" disabled selected>Đang xử lý</option>
                                    <option value="Đã xác nhận">Đã xác nhận</option>
                                    <% } else if(order.getStatus().equals("Đã xác nhận")){ %>
                                    <option value="Đã xác nhận" disabled selected>Đã xác nhận</option>
                                    <option value="Đang giao hàng" >Đang giao hàng</option>
                                    <% } else if(order.getStatus().equals("Đang giao hàng")) { %>
                                    <option value="Đang giao hàng" disabled selected>Đang giao hàng</option>
                                    <option value="Giao hàng thành công">Giao hàng thành công</option>
                                    <option value="Giao hàng thất bại">Giao hàng thất bại</option>
                                    <% } else if(order.getStatus().equals("Giao hàng thành công")) { %>
                                    <option value="Giao hàng thành công" disabled selected>Giao hàng thành công</option>
                                    <% } else { %>
                                    <option value="Giao hàng thất bại" disabled selected>Giao hàng thất bại</option>
                                    <% } %>
                                </select>
                            <br>
                                <% if(order.getStatus().equals("Giao hàng thành công")||order.getStatus().equals("Giao hàng thất bại")){ %>
                                <% } else { %>
                                <button type="submit">Chỉnh sửa</button>
                                <% } %>
                            </form>
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

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
