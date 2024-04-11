<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm</title>
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
        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Thêm sản phẩm</h1>
                        <p class="breadcrumbs"><span><a href="AddProduct.jsp">Trang chủ</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Thêm sản phẩm</p>
                    </div>
                    <div>
                        <a href="AddListProduct" class="btn btn-primary"> Xem tất cả sản phẩm
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Thêm sản phẩm</h2>
                            </div>
                            <div class="card-body">
                                <div class="row ec-vendor-uploads">
                                    <form action="AdminAddProduct" method="post" enctype="multipart/form-data">
                                        <div class="col-lg-4">
                                            <div class="ec-vendor-img-upload">
                                                <div class="ec-vendor-main-img">
                                                    <div class="thumb-upload-set colo-md-12">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <input type='file' id="thumbUpload01"
                                                                       class="ec-image-upload" name="image1"
                                                                       accept=".png, .jpg, .jpeg" required/>
                                                                <label><img
                                                                        src="assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit" /></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <input type='file' id="thumbUpload02"
                                                                       class="ec-image-upload" name="image2"
                                                                       accept=".png, .jpg, .jpeg" />
                                                                <label><img
                                                                        src="assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit" /></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <input type='file' id="thumbUpload03"
                                                                       class="image3"
                                                                       accept=".png, .jpg, .jpeg" />
                                                                <label><img
                                                                        src="assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit" /></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <input type='file' id="thumbUpload04"
                                                                       class="ec-image-upload" name="image4"
                                                                       accept=".png, .jpg, .jpeg" />
                                                                <label><img
                                                                        src="assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit" /></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="ec-vendor-upload-detail">
                                                <div class="col-md-6">
                                                    <label class="form-label">Tên sản phẩm</label>
                                                    <input type="text" class="form-control slug-title" name="nameproduct" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Chọn loại sản phẩm
                                                        <select name="category" class="form-select form-control" required>
                                                            <option value="4">Sách chuyên ngành</option>
                                                            <option value="3">Sách tiếng anh</option>
                                                            <option value="1">Sách giáo trình</option>
                                                            <option value="2">Sách cũ</option>
                                                        </select>
                                                    </label>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="col-12 col-form-label">Thương hiệu</label>
                                                    <div class="col-12">
                                                        <input name="brand" class="form-control" type="text" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Giá</label>
                                                    <input type="number" name="price" class="form-control" required>VNĐ
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Giá bán ra</label>
                                                    <input type="number" class="form-control" name="pricebuy" required>VNĐ
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Số lượng</label>
                                                    <input type="number" class="form-control" name="quantity" required>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="form-label">Chi tiết sản phẩm</label>
                                                    <textarea class="form-control" name="detail" rows="4" required></textarea>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="submit" class="btn btn-primary" style="margin: 10px">Hoàn thành</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
<script src="assets/plugins/tags-input/bootstrap-tagsinput.js"></script>
<script src="assets/plugins/simplebar/simplebar.min.js"></script>
<script src="assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>

<!-- Option Switcher -->
<script src="assets/plugins/options-sidebar/optionswitcher.js"></script>

<!-- Ekka Custom -->
<script src="assets/js/ekka.js"></script>
</body>
</html>
