<%@tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true" rtexprvalue="true"%>
<%@attribute name="content" fragment="true" %>
<%@attribute name="extra_css" fragment="true" %>
<%@attribute name="extra_js" fragment="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${title}</title>
    <base href="${base}" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <jsp:invoke fragment="extra_css"></jsp:invoke>
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    
</head>

<body class="body-bg">
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <div class="horizontal-main-wrapper">
        <div class="header-area header-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12  d-none d-lg-block">
                        <div class="horizontal-menu">
                            <nav>
                                <ul id="nav_menu">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/index.html"><i class="ti-dashboard"></i><span>Trang chủ</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/booking/list.html"><i class="ti-layout-sidebar-left"></i><span>Đặt sân</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/booking/create.html"><i class="ti-layout-sidebar-left"></i><span>Phiếu đặt</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/customers/search.html"><i class="ti-layout-sidebar-left"></i><span>Tìm khách hàng</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/customers/create.html"><i class="ti-layout-sidebar-left"></i><span>Thêm khách hàng</span></a>
                                    </li>
                                    
                                    <li style="float:right">
                                        <a class="dropdown-item" id="logout" href="logout.html">Đăng xuất</a>
                                    </li>
                                    <li style="float:right; padding-top: 7px">
                                        ${sessionScope.name}
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:invoke fragment="content"></jsp:invoke>
    </div>
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
    <script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <jsp:invoke fragment="extra_js"></jsp:invoke>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>
