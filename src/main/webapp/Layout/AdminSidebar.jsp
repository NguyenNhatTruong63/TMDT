
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ec-left-sidebar ec-bg-sidebar">
    <div id="sidebar" class="sidebar ec-sidebar-footer">

        <div class="ec-brand">
            <a href="AdminIndex" title="BookStore">
                <%--          <img class="ec-brand-icon" src="assets/img/logoshop.png" alt="" />--%>
                <span class="ec-brand-name text-truncate">Book Store</span>
            </a>
        </div>

        <!-- begin sidebar scrollbar -->
        <div class="ec-navigation" data-simplebar>
            <!-- sidebar menu -->
            <ul class="nav sidebar-inner" id="sidebar-menu">
                <!-- Dashboard -->
                <li class="active">
                    <a class="sidenav-item-link" href="AdminIndex">
                        <i class="mdi mdi-view-dashboard-outline"></i>
                        <span class="nav-text">Bảng điều khiển</span>
                    </a>
                    <hr>
                </li>

                <!-- Users -->
                <li class="has-sub">
                    <a class="sidenav-item-link" href="javascript:void(0)">
                        <i class="mdi mdi-account-group"></i>
                        <span class="nav-text">Khách hàng</span> <b class="caret"></b>
                    </a>
                    <div class="collapse">
                        <ul class="sub-menu" id="users" data-parent="#sidebar-menu">
                            <li class="">
                                <a class="sidenav-item-link" href="AdminListUser">
                                    <span class="nav-text">Danh sách khách hàng</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <hr>
                </li>
                <!-- Products -->
                <li class="has-sub">
                    <a class="sidenav-item-link" href="javascript:void(0)">
                        <i class="mdi mdi-palette-advanced"></i>
                        <span class="nav-text">Các sản phẩm</span> <b class="caret"></b>
                    </a>
                    <div class="collapse">
                        <ul class="sub-menu" id="products" data-parent="#sidebar-menu">
                            <li class="">
                                <a class="sidenav-item-link" href="AdminAddProduct.jsp">
                                    <span class="nav-text">Thêm sản phẩm</span>
                                </a>
                            </li>
                            <li class="">
                                <a class="sidenav-item-link" href="AdminListProduct">
                                    <span class="nav-text">Danh sách sản phẩm</span>
                                </a>
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
                                <a class="sidenav-item-link" href="AdminListOrder">
                                    <span class="nav-text">Danh sách đơn hàng</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!-- Bài viết -->
                <li class="has-sub">
                    <a class="sidenav-item-link" href="javascript:void(0)">
                        <i class="mdi mdi-palette-advanced"></i>
                        <span class="nav-text">Duyệt bài</span> <b class="caret"></b>
                    </a>
                    <div class="collapse">
                        <ul class="sub-menu" id="post" data-parent="#sidebar-menu">
                            <li class="">
                                <a class="sidenav-item-link" href="AdminListOrder">
                                    <span class="nav-text">Danh sách duyệt bài</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
