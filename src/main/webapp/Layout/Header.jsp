<%@ page import="Entity.Account" %>
<%@ page import="Entity.Cart" %>
<%@ page import="java.util.Set" %>
<%@ page import="Dao.ProductDao" %>
<%@ page import="Entity.Product" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Cart cart = (Cart)  request.getSession().getAttribute("cart"); %>
<%Locale locale = new Locale("vi", "VN");%>
<%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>
<div class="page-loader">
    <div class="home-loader">
        <div class="loader-spinner"></div>
    </div>
</div>
<nav id="top" class="clearfix">
    <div class="nav-left">
        <p><i class="fa-solid fa-phone"></i>Hỗ trợ miễn phí: <b>0776849194</b></p>
    </div>
    <div class="nav-right">
        <div id="top-links" class="nav myaccount">
            <ul class="list-inline">
                <li class="myaccount-dropdown">
                    <%if (session.getAttribute("account") == null) {%>
                    <!-- Tài khoản -->
                    <a href=""
                       title="My Account" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="fa fa-user"></i>Tài khoản của tôi <i class="fa fa-angle-down"></i></a>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <!-- Đăng ký -->
                        <li><a href="Register.jsp">Đăng ký</a></li>
                        <!-- Đăng nhập -->
                        <li><a href="Login.jsp">Đăng nhập</a></li>
                    </ul>
                    <%
                    } else {
                        Account account = (Account)session.getAttribute("account");
                    %>
                    <a href=""
                       title="My Account" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="fa fa-user"></i>Hello! <%=account.getFullName()%>&nbsp;<i class="fa fa-angle-down"></i></a>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="MyAccount.jsp">Tài khoản của tôi</a></li>
                        <li><a href="Cart">Giỏ hàng của tôi</a></li>
                        <li><a href="AddProduct.jsp">Đăng bài</a></li>
                        <li><a href="HistoryOrder">Lịch sử đơn hàng</a></li>
                        <li><a href="LogOut">Đăng xuất</a></li>
                    </ul>
                    <%}%>



                </li>
            </ul>
        </div>
        <div class="top-contact-link"><a href="ContactUs.jsp">Thông tin về
            shop</a></div>
    </div>
</nav>
<header class="header-fixed">
    <div class="header-top" style="height: 100px">
        <div class="header-link">
            <div id="logo" class="navbar nav-menu" style="margin-left: 30px">
                <a href=""><img src="../Image/image_web/logoshop.jpg" title="Cửa hàng" alt="Your Store"
                      style="width: 80px; height: 100%; margin-top: -15px; border-radius: 50%"  class="img-responsive"/><p style="font-size: 20px; font-weight: bold ">Book Store</p> </a>
            </div>
            <nav id="menu" class="navbar nav-menu">
                <div id="topCategoryList" class="main-menu menu-navbar clearfix">
                    <ul class="nav navbar-nav">
                        <li class="menulist home">
                            <a href="../index.jsp" style="font-size: 16px;">TRANG CHỦ</a>
                        </li>
                        <li class="menulist">
                            <a href="ListProduct" style="font-size: 16px;" class="dropdown-toggle" aria-expanded="false">SẢN PHẨM</a>
                        </li>
                        <li class="menulist">
                            <a href="ListProduct?category=sachgiaotrinh" style="font-size: 16px;" class="dropdown-toggle" aria-expanded="false">Sách Giáo Trình</a>
                        </li>
                        <li class="menulist">
                            <a href="ListProduct?category=sachcu" style="font-size: 16px;" class="dropdown-toggle" aria-expanded="false">Sách Cũ</a>
                        </li>
                        <li class="menulist">
                            <a href="ListProduct?category=sachtienganh" style="font-size: 16px;" class="dropdown-toggle" aria-expanded="false">Sách Tiếng Anh</a>
                        </li>
                        <li class="menulist">
                            <a href="ListProduct?category=sachchuyennganh" style="font-size: 16px;" class="dropdown-toggle" aria-expanded="false">Sách Chuyên Ngành</a>
                        </li>
<%--                        <li class="menulist">--%>
<%--                            <a href="Videoreview.jsp" --%>
<%--                               style="font-size: 16px;">Sách Chuyên Ngành</a>--%>
<%--                        </li>--%>
                    </ul>
                </div>
            </nav>

            <div class="header-right">
                <ul class="nav navbar-nav" style="margin-bottom: 15px;">
                    <li class="header-search-btn">
                        <div class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></div>
                    </li>
                    <li class="mycart">
                        <div id="cart" class="btn-group btn-block">
                            <button type="button" data-toggle="dropdown"
                                    class="btn btn-inverse btn-block btn-lg dropdown-toggle"><span
                                    id="cart-total"><%=(cart ==null || cart.getCart().size()==0)? 0 : cart.getCart().size()%></span><i class="fa-solid fa-cart-shopping"></i></button>
                            <% if(cart ==null || cart.getCart().size()==0) {  %>
                            <ul class="dropdown-menu pull-right header-cart-toggle">
                                <li>
                                    <p class="text-center product-cart-empty">Chưa có sản phẩm nào</p>
                                </li>
                            </ul>
                            <% } else { %>
                            <ul class="dropdown-menu pull-right header-cart-toggle" style="display: none;">
                                <li class="cart-content-product">
                                    <table class="table table-striped">
                                        <tbody>
                                            <%  ProductDao dao = new ProductDao();
                                                Product product;
                                                Set<String> set = cart.getCart().keySet();
                                                int total=0;
                                                for(String id : set){
                                                    try {
                                                        product = dao.getProduct(id);
                                                    } catch (SQLException | ClassNotFoundException e) {
                                                        throw new RuntimeException(e);
                                                    }
                                                    total+=product.getPrice_buy()*cart.getCart().get(id);
                                            %>
                                            <tr>
                                                <td class="text-center product-cart-thumb">
                                                    <a href="Product?id=<%=product.getId()%>" class="product-cart-img">
                                                        <img src="<%=product.getImages().get(0)%>"
                                                             alt="sách" title="sach" style="height: 70px; weight:100px">
                                                    </a>
                                                </td>
                                                <td class="text-left product-cart-details">
                                                    <a class="product-item-name" href="Product?id=<%=product.getId()%>"><%=product.getName()%></a>
                                                    <div class="product-cart-info">
                                                        <span class="product-cart-qty"><%=cart.getCart().get(id)%> x </span>
                                                        <span class="product-cart-price"><%=currencyFormatter.format(product.getPrice_buy())%></span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </li>
                                <li>
                                    <div>
                                        <table class="table table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="text-left"><strong>Tổng cộng</strong></td>
                                                <td class="text-right"><%=currencyFormatter.format(total)%>&nbsp;VNĐ</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <p class="text-right product-cart-button">
                                            <a class="cart-btn btn-default addtocart-btn" style="background-color: #0e5ba4" href="Cart">Xem giỏ hàng</a>
                                            <a class="cart-btn btn-default checkout-btn" href="Checkout">Thanh toán ngay</a>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                            <% } %>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="header-search">
                <form action="Search" method="post">
                <div id="mahardhiSearch" class="input-group mahardhi-search">
                    <select name="category_id" class="form-control input-lg">
                        <option value="All">Tất cả</option>
                        <option value="4">Sách Chuyên Ngành</option>
                        <option value="3">Sách Tiếng Anh</option>
                        <option value="2">Sách Cũ</option>
                        <option value="1">Sách Giáo Trình</option>
                    </select>
                    <input type="text" name="search_name" value="" placeholder="Search"
                           class="form-control input-lg ui-autocomplete-input" autofocus="autofocus" />
                    <span class="btn-search input-group-btn">
							<button type="submit" class="btn btn-default btn-lg"><i
                                    class="fa-solid fa-magnifying-glass"></i></button>
						</span>
                </div>
                <span class="search-close-icon close-button"><i class="fa-solid fa-circle-xmark"></i></span>
                </form>
            </div>
        </div>

    </div>
</header>
