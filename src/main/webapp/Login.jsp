<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="google-signin-client_id" content="588971069034-2223dffri7rruaqovf4n9vk5hnf6u28s.apps.googleusercontent.com">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/stylesheet.css">
    <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
    <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="JS/Custom.js" type="text/javascript"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
<jsp:include page="Layout/Header.jsp" />
<% String mess = (String)request.getAttribute("mess");
    if(mess!=null){ %>
    <script>
         alert("<%=mess%>");
    </script>
<% } %>
<div id="account-login" class="container">
    <ul class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
        <li><a href="Login.jsp">Đăng nhập</a></li>
    </ul>
    <div class="row">
        <jsp:include page="/Layout/MenuBarAccount.jsp" />
        <div id="content" class="col-sm-9">
            <div class="row">
                <div class="col-sm-6">
                    <div class="well">
                        <h1 style="font-size: 30px;">KHÁCH HÀNG MỚI</h1>
                        <h2>Đăng ký tài khoản</h2>
                        <p>
                            Bằng cách tạo tài khoản, bạn sẽ có thể mua sắm nhanh hơn, cập nhật trạng thái đơn hàng
                            và theo dõi các đơn hàng bạn đã thực hiện trước đó.</p>
                        <br>
                        <!-- link đăng ký tài khoản -->
                        <a href="Register.jsp"
                           class="btn btn-primary">Tiếp tục</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="well">
                        <h1 style="font-size: 30px;">ĐĂNG NHẬP TÀI KHOẢN</h1>
                        <form action="Login" method="post" id="form">
                            <div class="form-group">
                                <label class="control-label" for="input-email" style="font-size: 18px;">Địa chỉ Email đăng nhập</label>
                                <input type="text" name="email" value="" placeholder="Nhập địa chỉ email" id="input-email" class="form-control"  required/>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-password" style="font-size: 18px;">Mật khẩu</label>
                                <input type="password" name="password" value="" placeholder="Mật khẩu" id="input-password" class="form-control"
                                       title="Vui lòng nhập 6-10 ký tự bao gồm chữ in hoa, chữ thường, số, và các ký tự đặc biệt"
                                       minlength="6" maxlength="10" required />
                                <i class="toggle-password fa-solid fa-eye-slash" style="position: relative;float: right;margin-top: -25px;margin-right: 20px; cursor: pointer" onclick="togglePasswordVisibility('input-password')"></i>
                                <br>
                                <div class="g-recaptcha" data-sitekey="6Lfgxb0kAAAAAApXx43Y6BkDxbvs6QKDPmnIVsHm"></div>
                                <p id="error" style="color:red"></p>
                                <!-- link trang quên mật khẩu -->
                                <a href="Forgottenpassword.jsp">Quên mật khẩu?</a>
                            </div>
                            <input type="submit" value="Đăng nhập" class="btn btn-primary" />
                            <div class="button-google">
                                <button type="button" name="button" id="google" class="g-signin2" data-onsuccess="onSignIn" value=""></button>
                            </div>
                        </form>
                        <script>
                            window.onload = function (){
                                let isValid = false;
                                const form = document.getElementById("form");
                                const error = document.getElementById("error");
                                form.addEventListener("submit", function (event) {
                                    event.preventDefault();
                                    const response =  grecaptcha.getResponse();
                                    if(response){
                                        form.submit();
                                    }
                                    else{
                                        error.innerHTML = "Please check";
                                    }
                                })
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="Layout/Footer.jsp" />
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
    function togglePasswordVisibility(inputId) {
        const passwordInput = document.getElementById(inputId);
        const icon = document.querySelector('.toggle-password');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.add('fa-eye');
            icon.classList.remove('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.add('fa-eye-slash');
            icon.classList.remove('fa-eye');
        }
    }
</script>
<script>
    // Lấy tham chiếu đến phần tử input mật khẩu
    var passwordInput = document.getElementById('input-password');

    // Bắt sự kiện khi người dùng nhập vào input mật khẩu
    passwordInput.addEventListener('input', function(event) {
        // Lấy giá trị hiện tại của input mật khẩu
        var passwordValue = event.target.value;

        // Kiểm tra xem có khoảng trắng trong mật khẩu không
        if (passwordValue.indexOf(' ') !== -1) {
            // Nếu có khoảng trắng, loại bỏ khoảng trắng đó
            event.target.value = passwordValue.replace(/\s/g, '');
        }
    });

</script>
<script>
    function onSignIn(googleUser) {
        // Lấy thông tin người dùng từ tài khoản Google
        var profile = googleUser.getBasicProfile();
        var id_token = googleUser.getAuthResponse().id_token;

        // Gửi yêu cầu đăng ký thành công qua AJAX
        const xhr = new XMLHttpRequest();
        xhr.open('POST', "Login"); // Thay thế '/signup' bằng URL của endpoint xử lý đăng ký trên máy chủ của bạn
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Đăng ký thành công, xử lý phản hồi
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    // Đăng ký thành công, thực hiện các hành động cần thiết
                    console.log('Đăng ký thành công');
                    window.location.href = 'index.jsp'; // Chuyển hướng đến trang đăng ký thành công
                } else {
                    // Đăng ký không thành công, xử lý lỗi
                    console.error('Đăng ký không thành công:', response.error);
                    document.getElementById('ero').textContent = response.error; // Hiển thị thông báo lỗi
                }
            } else {
                // Xử lý lỗi từ máy chủ
                console.error('Đã xảy ra lỗi khi gửi yêu cầu đăng ký:', xhr.statusText);
            }
        };
        xhr.send('id_token=' + id_token); // Gửi mã thông tin của tài khoản Google đến máy chủ
    }
</script>

</body>
</html>
