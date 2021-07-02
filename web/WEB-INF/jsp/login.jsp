<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>

<body>
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <div class="login-area">
        <div class="container">
            <div class="login-box ptb--100">
                <form id="login-form" method="post" action="">
                    <div class="login-form-head">
                        <h4>Đăng nhập</h4>
                    </div>
                    <div class="login-form-body">
                        <div class="form-gp">
                            <input type="email" name="email" id="email" placeholder="Nhập email">
                            <div class="text-danger" id="error-email"></div>
                        </div>
                        <div class="form-gp">
                            <input type="password" name="password" id="password" placeholder="Nhập mật khẩu">
                            <div class="text-danger" id="error-password"></div>
                        </div>
                        <div class="submit-btn-area">
                            <div class="login-other row">
                                <div class="col-12">
                                    <button class="fb-login" id="btnLoggin" type="submit" href="javascript:void(0)">Đăng nhập</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#login-form').validate({
                onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
                    "email": {
                        required: true,
                        email: true,
                        
                    },
                    "password": {
                        required: true,
                        minlength: 8
                    }
                },
                messages: {
                    "email": {
                        required: "Bắt buộc nhập email",
                        email: "Sai định dạng email"
                    },
                    "password": {
                        required: "Bắt buộc nhập password",
                        minlength: "Hãy nhập ít nhất 8 ký tự"
                    }
		},
                errorPlacement: function(error, element) {
                    if (element.attr('name') == 'email') {
                        $("#error-email").text($(error).text());
                    } else if (element.attr('name') == 'password'){
                        $("#error-password").text($(error).text());
                    }
                }
            });
           
           
            $('#login-form').on('submit', function(event) {
                event.preventDefault();
                if ($(this).valid()) {
                    let email = $('#email').val();
                    let password= $('#password').val();
                    $.ajax({
                        type: "POST",
                        url: "user/login.html",
                        data: {
                            email: email,
                            password: password
                        },
                        success: function(data) {
                            if (data == 'index.html') {
                                window.location.href = data;
                            } else {
                                $("#error-password").text('Thông tin đăng nhập sai! Hãy kiểm tra lại');
                                $("#error-email").text('');
                                $("#email").val('');
                                $('#password').val('');
                            }
                        }
                    });
                }
            });

        });
    </script>
</body>

</html>