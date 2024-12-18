<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="/laptopmall/css/pricing.css" rel="stylesheet">
</head>
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <c:if test="${CURRENT_USER.role==0}">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/laptopmall/product_list">Trang thương mại điện tử</a>
        </h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="/laptopmall/list_cart">Giỏ hàng của tôi</a>
            <a class="p-2 text-dark" href="/laptopmall/list_order">Đơn hàng của tôi</a>
            <a class="p-2 text-dark" href="/laptopmall/portal/user_info.jsp">Thông tin của tôi</a>
        </nav>
        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login.jsp">Đăng xuất</a>
    </c:if>
    <c:if test="${CURRENT_USER.role==1}">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/laptopmall/product_list">Trang quản trị cửa hàng</a>
        </h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="/laptopmall/product_list">Quản lý sản phẩm</a>
            <a class="p-2 text-dark" href="/laptopmall/save_brand">Thêm thương hiệu</a>
            <a class="p-2 text-dark" href="/laptopmall//edit_product">Thêm sản phẩm</a>
            <a class="p-2 text-dark" href="/laptopmall/list_order">Quản lý đơn hàng</a>
        </nav>
        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login.jsp">Đăng xuất</a>
    </c:if>
    <c:if test="${CURRENT_USER.role!=1 && CURRENT_USER.role!=0}">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/laptopmall/product_list">Trang thương mại điện tử</a>
        </h5>
        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
    </c:if>
</div>
</body>
</html>
