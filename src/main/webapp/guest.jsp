<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang thương mại điện tử · Sản phẩm</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        #listDiv {
            margin: 15px auto;
            width: 900px;
            height: 67%;
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        img {
            margin: 0;
            padding: 0;
            width: 100px;
        }

        .stock {
            margin: 0 20px;
        }

        input, select {
            margin: 0px 10px;
        }
    </style>
    <script type="text/javascript">
        function goPage(page) {
            $("#currentPage").val(page);
            $("#queryFrom").submit();
        }

        $(function () {
            if (${pageInfo.currentPage} >
            ${pageInfo.totalPage} && ${pageInfo.totalPage != 0})
            {
                $("#currentPage").val(1);
                $("#queryFrom").submit();
            }
        });
    </script>
</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="listDiv">
    <div style="height: 40px;">
        <form action="product_list" method="post" id="queryFrom"
              class="form-inline input-group-sm"
              role="form" style="float: left;">
            Từ khóa:
            <input type="text" class="form-control" name="keyword" style="width: 110px;"
                   value="${not empty qo.keyword ? qo.keyword : ''}">
            Thương hiệu:
            <select class="form-control" name="brand_id">
                <option value="0">-Tất cả-</option>
                <c:forEach items="${brands}" var="brand">
                    <option value="${brand.id}"
                        ${qo.brandId == brand.id ? "selected" : ""}>${brand.name}</option>
                </c:forEach>
            </select>
            <input id="currentPage" name="current_page" type="hidden" value="${qo.currentPage}">
            <button type="submit" class="btn btn-primary btn-sm">Lọc</button>
        </form>
    </div>

    <table class="table table-bordered table-sm table-hover" style="width: 900px; text-align: center;">
        <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Mô tả</th>
            <th>Kho</th>
            <th>Đơn giá</th>
            <th>Số lượng chọn</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="prod">
            <form action="add_to_cart" method="post">
                <tr>
                    <td>${prod.name != null ? prod.name : 'Chưa có tên sản phẩm'}</td>
                    <td><img src="images/${prod.image}" alt="${prod.name}"></td>
                    <td>${prod.detail != null ? prod.detail : 'Chưa có mô tả'}</td>
                    <td>${prod.stock != null ? prod.stock : '0'}</td>
                    <td>${prod.price != null ? prod.price : '0'}</td>
                    <td>
                        <c:if test="${prod.stock != 0}">
                            <input type="number" name="quantity" min="1" max="${prod.stock}" value="1"
                                   style="width:50px;">
                        </c:if>
                        <c:if test="${prod.stock == 0}">
                            <span style="color:red;">Hết hàng</span>
                        </c:if>
                    </td>
                    <td>
                        <input type="hidden" name="product_id" value="${prod.id}">
                        <input type="submit" class="btn btn-danger btn-sm"
                            ${prod.stock == 0 ? "disabled" : ""} value="Thêm vào giỏ hàng">
                    </td>
                </tr>
            </form>
        </c:forEach>
        </tbody>
    </table>

    <span style="font-size: 18px;">
        Trang ${pageInfo.totalPage == 0 ? "1" : pageInfo.currentPage} /
        ${pageInfo.totalPage == 0 ? "1" : pageInfo.totalPage}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tổng ${pageInfo.totalCount != null ? pageInfo.totalCount : '0'} sản phẩm
    </span>

    <c:if test="${pageInfo.totalCount != 0}">
        <ul class="pagination" style="float: right;">
            <li class="page-item"><a class="page-link" href="#" onclick="goPage(1);">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="#" onclick="goPage(${pageInfo.prePage});">Trang trước</a>
            </li>
            <li class="page-item"><a class="page-link" href="#" onclick="goPage(${pageInfo.nextPage});">Trang sau</a>
            </li>
            <li class="page-item"><a class="page-link" href="#" onclick="goPage(${pageInfo.totalPage});">&raquo;</a>
            </li>
        </ul>
    </c:if>
</div>
</body>
</html>
