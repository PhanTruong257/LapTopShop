<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Thương Mại Điện Tử·Đơn Hàng Của Tôi</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        #listDiv {
            margin: 15px auto;
            width: 900px;
            height: 67%;
        }

        img {
            margin: 0;
            padding: 0;
            width: 100px;
        }

        .table tbody tr td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="listDiv">
    <div>
        <span><strong>Số Đơn Hàng: ${order.id}</strong></span>
        <div style="float: right;">
            <a href="list_order" class="btn btn-primary btn-sm"
               role="button">Quay lại</a>
        </div>
    </div>
    <br/>
    <table class="table table-bordered table-sm table-hover" style="width: 900px; text-align: center;">
        <thead>
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Hình Ảnh</th>
            <th>Đơn Giá</th>
            <th>Số Lượng</th>
            <th>Tổng Tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderItems}" var="orderItem">
            <tr>
                <td>${orderItem.productName}</td>
                <td><img src="images/${orderItem.productImage}"></td>
                <td>${orderItem.productPrice}</td>
                <td>${orderItem.quantity}</td>
                <td>${orderItem.totalPrice}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <span style="font-size: 18px; float: right; margin-right: 20px;">
        	Tổng cộng: ${order.payment} VND
    </span>

</div>
</body>
</html>
