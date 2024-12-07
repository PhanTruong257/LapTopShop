<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Thương Mại Điện Tử · Giỏ Hàng Của Tôi</title>
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
    <script type="text/javascript">
        $(function () {
            $(".quantity").change(function () {
                var cartid = $(this).attr("cartid");
                $("#bt" + cartid).trigger("click");
            })
        })

    </script>

</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="listDiv">
    <table class="table table-bordered table-sm table-hover" style="width: 900px; text-align: center;">
        <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Mô tả</th>
            <th>Đơn giá</th>
            <th>Số lượng chọn</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartProds}" var="cartProd">
            <tr>

                <td>${cartProd.productName}</td>
                <td><img src="images/${cartProd.productImage}"></td>
                <td>${cartProd.productDetail}</td>
                <td>${cartProd.productPrice}</td>
                <td>
                    <form action="change_quantity" method="post" id="quantity_form${cartProd.cartId}">
                        <input type="number" cartid="${cartProd.cartId}" class="quantity" name="quantity" min="1"
                               max="${cartProd.productStock}" value="${cartProd.quantity}" style="width:70px;">
                        <input type="hidden" name="cart_id" value="${cartProd.cartId}">
                        <input type="submit" id="bt${cartProd.cartId}" hidden/>
                    </form>

                </td>
                <td>
                    <div style="width: 50px;">
                        <a href="delete_cart?id=${cartProd.cartId}"
                           class="btn btn-danger btn-sm" role="button">Xóa</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${cartTotalPrice!=0}">

    <span style="font-size: 18px; float: right; margin-right: 20px;">
        	Tổng giá:  <span style="color:red;">${cartTotalPrice}</span> VNĐ
    </span>
        <br/>
        <br/>
        <div style="float: right; margin-right: 20px;">

            <a href="submit_order" class="btn btn-primary btn-sm" role="button">Đặt hàng</a>
        </div>
    </c:if>
    <c:if test="${cartTotalPrice==0}">
        <br/>
        <div style="float: right; margin-right: 20px;">

            <a href="product_list" class="btn btn-primary btn-sm" role="button">Đi mua sắm</a>
        </div>
    </c:if>
</div>
</body>
</html>
