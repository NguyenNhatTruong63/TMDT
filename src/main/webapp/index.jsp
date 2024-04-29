<%@ page import="Entity.Product" %>
<%@ page import="Dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>

    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
          rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="catalog/view/javascript/mahardhi/jquery.elevateZoom.min.js"></script>
    <script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
    <script src="catalog/view/javascript/mahardhi/owl.carousel.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/mahardhi/quickview.js"></script>
    <link href="catalog/view/theme/mahardhi/stylesheet/mahardhi/owl.carousel.min.css" rel="stylesheet">
    <link href="catalog/view/theme/mahardhi/stylesheet/mahardhi/owl.theme.default.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/magnific/magnific-popup.css">
    <script type="text/javascript" src="./catalog/view/javascript/mahardhi/mahardhi_search.js"></script>
    <link href="catalog/view/theme/mahardhi/stylesheet/stylesheet.css" rel="stylesheet">
    <link href="catalog/view/theme/mahardhi/stylesheet/themify-icons.css" rel="stylesheet" />
    <link href="catalog/view/theme/mahardhi/stylesheet/animate.min.css" rel="stylesheet" />
    <link href="catalog/view/javascript/jquery/swiper/css/swiper.min.css" type="text/css" rel="stylesheet"
          media="screen" />
    <link href="catalog/view/javascript/jquery/swiper/css/opencart.css" type="text/css" rel="stylesheet"
          media="screen" />
    <script src="catalog/view/javascript/jquery/swiper/js/swiper.jquery.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/mahardhi/tabs.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/mahardhi/jquery.cookie.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/mahardhi/stylesheet/mahardhi/jquery-ui.min.css">

    <script src="catalog/view/javascript/mahardhi/jquery-ui.min.js"></script>

    <script type="text/javascript" src="catalog/view/javascript/mahardhi/custom.js"></script>
</head>
<body>
<% ProductDao dao = new ProductDao();
    List<Product> list = dao.getProductsBestSeller(10);
%>
<jsp:include page="Layout/Header.jsp"/>
<div id="common-home">
    <div class="swiper-viewport slideshow">
        <div id="slideshow0" class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide text-center">
                    <a href="#"><img src="Image/image_web/banner1.png" alt="Main-banner1" class="img-responsive" /></a>
                </div>
                <div class="swiper-slide text-center">
                    <a href="#"><img src="Image/image_web/banner2.png" alt="Main-banner2" class="img-responsive" /></a>
                </div>
                <div class="swiper-slide text-center">
                    <a href="#"><img src="Image/image_web/banner3.png" alt="Main-banner2" class="img-responsive" /></a>
                </div>
            </div>
        </div>
        <div class="swiper-pagination slideshow0"></div>
        <div class="swiper-pager">
            <div class="swiper-button-prev"><i style="margin-top: 10px" class="fa fa-angle-left"></i></div>
            <div class="swiper-button-next"><i style="margin-top: 10px" class="fa fa-angle-right"></i></div>
        </div>
    </div>
    <script type="text/javascript">
        $('#slideshow0').swiper({
            mode: 'horizontal',
            slidesPerView: 1,
            pagination: '.slideshow0',
            paginationClickable: true,
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            spaceBetween: 0,
            autoplay: 2500,
            autoplayDisableOnInteraction: true,
            loop: true
        });

    </script>

    <div>
        <div class="promo-box-section section-padding-sm">
            <div class="container">
                <!-- box1 -->
                <div class="col-xs-4 promo-item mb-sm-30">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-sharp fa-solid fa-truck-fast"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Miễn phí vận chuyển</a></h6>
                            <p>Đơn hàng trên 500.000đ</p>
                        </div>
                    </div>
                </div><!-- box1 -->
                <div class="col-xs-4 promo-item mb-sm-30">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-solid fa-handshake"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Bảo hành chính hãng</a></h6>
                            <p>Áp dụng toàn quốc</p>
                        </div>
                    </div>
                </div><!-- box1 -->
                <div class="col-xs-4 promo-item">
                    <div class="promo-box">
                        <div class="promo-icon"><i class="fa-solid fa-headset"></i></div>
                        <div class="promo-info">
                            <h6><a href="#">Hỗ trợ 24/7</a></h6>
                            <p>Hỗ trợ tận tâm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="product-tab-block">
        <div class="container">
            <div class="row main-tab">
                <div class="box product-tabs product-tab-box">
                    <div class="page-title">
                        <h2>SẢN PHẨM HÀNG ĐẦU</h2>
                    </div>
                    <div id="tabs" class="mahardhi-tabs">
                        <ul class="nav nav-tabs top-product-tab">
                            <li>
                                <a href="#tab-featured" data-toggle="tab">Bán chạy nhất</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <%Locale locale = new Locale("vi", "VN");%>
                        <%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>
                        <div id="tab-featured" class="tab-pane">
                            <div id="featuredTabCarousel" class="box-product  product-tab-carousel  clearfix">
                                <%for(Product p :list){%>
                                <div class="product-layouts col-xs-12">
                                    <div class="product-thumb transition">
                                        <div class="item-inner">
                                            <div class="image">
                                                <a href="Product?id=<%=p.getId()%>">
                                                    <img style="width: 280px; height: 280px" src="<%=p.getImages().get(0)%>" alt="sách" title="sach" class="img-responsive" />
                                                    <% if(p.getImages().size()==1){%>
                                                    <img style="width: 280px; height: 280px" class="img-responsive hover-img" src="<%=p.getImages().get(0)%>" title="sach" alt="sách" />
                                                    <% }else { %>
                                                    <img style="width: 280px; height: 280px" class="img-responsive hover-img" src="<%=p.getImages().get(1)%>" title="sach" alt="sách" />
                                                    <% } %>
                                                </a>
                                                <div class="product-item-addcart">
                                                    <a href="Cart?id=<%=p.getId()%>" class="addcart">Thêm vào giỏ hàng</a>
                                                </div>
                                            </div>
                                            <div class="thumb-description clearfix">
                                                <div class="caption">
                                                    <h4 class="product_name"><a href="<Product?id=<%=p.getId()%>>"><%=p.getName()%></a>
                                                    </h4>
                                                    <br>
                                                    <h5>Đã bán: <%=p.getProduct_sold()%> sản phẩm</h5>
                                                    <p class="price">
                                                        <% if(p.getPrice_buy()==p.getPrice()){ %>
                                                        <span class="price-new"><%=currencyFormatter.format(p.getPrice_buy())%>VNĐ</span>
                                                        <%} else { %>
                                                        <span class="price-new"><%=currencyFormatter.format(p.getPrice_buy())%>VNĐ</span>
                                                        <span class="price-old"><%=currencyFormatter.format(p.getPrice())%>VNĐ</span>
                                                        <% } %>

                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $('#tabs a').tabs();

        // set slider
        const direction = $('html').attr('dir');
        $('.product-tab-carousel').each(function () {
            if ($(this).closest('#column-left').length === 0 && $(this).closest('#column-right').length === 0) {
                $(this).addClass('owl-carousel owl-theme');
                const items = $(this).data('items') || 4;
                const sliderOptions = {
                    loop: false,
                    nav: true,
                    navText: ['<i style="margin-top: 10px" class="fa fa-angle-left" aria-hidden="true"></i>', '<i style="margin-top: 10px" class="fa fa-angle-right" aria-hidden="true"></i>'],
                    dots: false,
                    items: items,
                    responsiveRefreshRate: 200,
                    responsive: {
                        0: { items: 1 },
                        481: { items: ((items - 2) > 1) ? (items - 2) : 1 },
                        769: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        991: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1150: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1024: { items: ((items - 1) > 1) ? (items - 1) : 1 },
                        1200: { items: items }
                    }
                };
                if (direction === "rtl") sliderOptions['rtl'] = direction;
                $(this).owlCarousel(sliderOptions);
            }
        });
    </script>
    <div>
        <div class="parallex-banner section-padding overlay-black40 parallex-img bg-fixed parallax"
             data-image-src="Image/image_web/parallax.jpg"
             style="background-image: url('Image/image_web/hehe.jpg'); background-size:100%;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 parallex-description">
                        <div class="parallex-inner">
<%--                            <div class="parallex-inner-logo"><img style="width: 300px; height: 200px; margin-top: -40px" src="Image/image_web/logoshop.jpg" alt=""></div>--%>
                            <div class="parallex-inner-logo"><img src="https://img.freepik.com/premium-photo/book-logo_1045671-467.jpg?w=740" alt=""></div>
                            <div class="parallex-inner-descritpion">
                                <p>Sách là một mặt hàng có nhu cầu không ngừng từ mọi lứa tuổi và tầng lớp xã hội.
                                    Dù cho xu hướng đọc sách có thể biến đổi theo thời gian, nhu cầu cơ bản về kiến thức,
                                    giải trí và phát triển cá nhân vẫn tồn tại ổn định.
                                    Sách đến từ nhiều thể loại và chủ đề khác nhau, từ giáo trình, sách văn học,
                                    sách kỹ năng sống đến sách chuyên ngành và nghiên cứu.
                                    Điều này tạo ra một thị trường đa dạng và phong phú,
                                    cho phép bạn tập trung vào một hoặc nhiều lĩnh vực mà bạn quan tâm.
                                </p>
                                <p>Nhu cầu tìm mua sách cũ trên thị trường hiện nay khá cao.
                                    Có người tìm mua sách để phục vụ công việc, có người tìm mua sách chỉ để sưu tầm.
                                    Nếu không có thị trường sách cũ thì họ rất khó tìm được những cuốn sách đáp ứng nhu cầu của mình,
                                    đặc biệt là dạng sách khoa học kỹ thuật, sách chuyên ngành có số lượng bản in thấp, giờ trở thành hàng hiếm trên thị trường
                                </p>
                            </div><a href="#" class="btn btn-default btn-color mt-25">Mua sắm ngay bây giờ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-padding brand-section gray-bg">
        <div class="container">
            <div class="carousel">
                <div class="page-title">
                    <h2>CỘNG SỰ HỢP TÁC CỦA CHÚNG TÔI</h2>
                </div>
                <div class="swiper-viewport"
                     style="max-height: 100px">
                    <div id="carousel0" class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://statics.vincom.com.vn/containers/vincom_ho/thuong_hieu/anh_logo/Nh%C3%A0%20s%C3%A1ch%20Ph%C6%B0%C6%A1ng%20Nam.png/e798824a8c9999f855717a47bfc80ba9.webp"
                                         alt="LogoNLU" class="img-responsive m-auto" style="height: 90px"/>
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWBdkuB36FhKIFJf9qthxi-XXpv9dCucHdmPvzaxhEnQ&s"
                                         alt="LogoUEL" class="img-responsive m-auto" style="height: 90px"/>
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://hcmussh.edu.vn/img/avatar.png?t=1649046939342"
                                         alt="LogoUSSH" class="img-responsive m-auto" style="height: 90px"/>
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://admin.googleusercontent.com/logo-scs-key4476371"
                                         alt="LogoKHTN" class="img-responsive m-auto" style="height: 90px"/>
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://theme.hstatic.net/1000328521/1001030245/14/share_fb_home.png?v=941"
                                         alt="DongA" class="img-responsive m-auto" />
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://img.giftpop.vn/brand/logo/NSCACHEP.png"
                                         alt="LogoCaChep" class="img-responsive m-auto" style="height: 90px"/>
                                </div>
                            </div>
                            <div class="swiper-slide text-center">
                                <div class="brand-item">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB5ob8_QdrL883rikDyL36eey_0bjRleFBB9WA6-2MiA&s"
                                         alt="HaiAn" class="img-responsive m-auto" style="width: 200px; height: 90px"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination carousel0" ></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#carousel0').swiper({
            mode: 'horizontal',
            slidesPerView: 6,

            paginationClickable: false,
            nextButton: '',
            prevButton: '',
            autoplay: 2500,
            autoplayDisableOnInteraction: true,
            loop: true,
            breakpoints: {
                1201: {
                    slidesPerView: 4,
                    spaceBetween: 40
                },
                992: {
                    slidesPerView: 4,
                    spaceBetween: 30
                },
                768: {
                    slidesPerView: 3,
                    spaceBetween: 30
                },
                640: {
                    slidesPerView: 2,
                    spaceBetween: 10
                },
                320: {
                    slidesPerView: 1,
                    spaceBetween: 10
                }
            }
        });
    </script>
    <div class="container">
        <div class="row"></div>
    </div>
</div>


<jsp:include page="Layout/Footer.jsp" />
</body>
</html>
