<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
<link href="../assets/plugins/simplebar/simplebar.css" rel="stylesheet" />
<link id="ekka-css" href="../assets/css/ekka.css" rel="stylesheet" />
<%--<link href="../assets/img/logoshop.png" rel="shortcut icon" />--%>
    <!-- LEFT MAIN SIDEBAR -->
    <div class="ec-left-sidebar ec-bg-sidebar">
        <div id="sidebar" class="sidebar ec-sidebar-footer">
            <div class="ec-brand">
                <a href="../AddProduct.jsp" title="BookStore">
                    <span class="ec-brand-name text-truncate">Book Store</span>
                </a>
            </div>
            <!-- begin sidebar scrollbar -->
            <div class="ec-navigation" data-simplebar>
                <!-- sidebar menu -->
                <ul class="nav sidebar-inner" id="sidebar-menu">
                    <!-- Dashboard -->
                    <li>
                        <a class="sidenav-item-link" href="../AddProduct.jsp">
                            <i class="mdi mdi-view-dashboard-outline"></i>
                            <span class="nav-text">Bảng điều khiển</span>
                        </a>
                        <hr>
                    </li>
                    <!-- Products -->
                    <li class="has-sub active expand">
                        <a class="sidenav-item-link" href="javascript:void(0)">
                            <i class="mdi mdi-palette-advanced"></i>
                            <span class="nav-text">Các sản phẩm</span> <b class="caret"></b>
                        </a>
                        <div class="collapse show">
                            <ul class="sub-menu" id="products" data-parent="#sidebar-menu">
                                <li class="active">
                                    <a class="sidenav-item-link" href="../AddProduct.jsp"><span class="nav-text">Thêm sản phẩm</span></a>
                                </li>
                                <li class="">
                                    <a class="sidenav-item-link" href="AddListProduct"><span class="nav-text">Danh sách sản phẩm</span></a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <!-- Orders -->
                    <li class="has-sub">
                        <a class="sidenav-item-link" href="javascript:void(0)">
                            <i class="mdi mdi-cart"></i>
                            <span class="nav-text">Đơn hàng</span> <b class="caret"></b>
                        </a>
                        <div class="collapse">
                            <ul class="sub-menu" id="orders" data-parent="#sidebar-menu">
                                <li class="">
                                    <a class="sidenav-item-link" href="AddUserPostListOrder">
                                        <span class="nav-text">Danh sách đơn hàng</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div> <!-- End Wrapper -->


