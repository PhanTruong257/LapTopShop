<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Thương Mại Điện Tử · Chỉnh Sửa Sản Phẩm</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        .form-group, #main {
            margin: 0 auto;
            width: 300px;
        }

        #main {
            margin-top: 100px;
        }
    </style>
</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="main">
    <h4 style="text-align: center">Thêm Danh Mục Mới</h4>

    <form action="/laptopmall/save_brand" method="post" class="input-group-sm">
        <div class="form-group input-group-sm">
            <label for="brand_name">Tên danh mục:</label><span style="float: right;color:red;">${info}</span>
            <input type="text" name="brand_name" id="brand_name" class="form-control"
                   maxlength="20" required/>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary btn-block" id="bt">Thêm</button>
        <a href="/laptopmall/product_list" class="btn btn-primary btn-block" role="button">Quay lại</a>
    </form>
</div>
</body>
</html>
