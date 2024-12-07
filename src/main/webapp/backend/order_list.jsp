<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Thương Mại Điện Tử · Quản Lý Đơn Hàng</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        #listDiv {
            margin: 70px auto;
            width: 900px;
            height: 67%;
        }

        .table tbody tr td {
            vertical-align: middle;
        }

    </style>
</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="listDiv">
    <table class="table table-bordered table-sm table-hover" style="width: 900px; text-align: center;">
        <thead>
        <tr>
            <th>Mã đơn hàng</th>
            <th>Số tiền đơn hàng</th>
            <th>Thời gian đặt hàng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="order">
            <tr>
                <td>${order.id}</td>
                <td>${order.payment}</td>
                <td><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <span style="font-size: 18px;">
        Trang&nbsp;${pageInfo.currentPage}&nbsp;/&nbsp;${pageInfo.totalPage}&nbsp; &nbsp;&nbsp;&nbsp;Tổng số đơn hàng ${pageInfo.totalCount}  &nbsp;&nbsp;Tổng doanh thu  <span
            style="color:red;">${salesValue}</span> VNĐ
    </span>
    <ul class="pagination" style="float: right;">
        <li class="page-item"><a class="page-link" href="list_order?currentPage=1">&laquo;</a></li>
        <li class="page-item"><a class="page-link" href="list_order?currentPage=${pageInfo.prePage}">Trang trước</a>
        </li>
        <li class="page-item"><a class="page-link" href="list_order?currentPage=${pageInfo.nextPage}">Trang sau</a></li>
        <li class="page-item"><a class="page-link" href="list_order?currentPage=${pageInfo.totalPage}">&raquo;</a></li>
    </ul>

</div>
</body>
</html>
