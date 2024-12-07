<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Thương Mại Điện Tử·${prod.id==null?"Thêm mới":"Chỉnh sửa"} Sản phẩm</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        .form-group, #main {
            margin: 0 auto;
            width: 300px;
        }

        #main {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%@ include file="/common/top_bar.jsp" %>
<div id="main">
    <h4 style="text-align: center">${prod.id==null?"Thêm mới":"Chỉnh sửa"} Sản phẩm</h4>

    <form action="/laptopmall/save_product" method="post" class="input-group-sm" enctype="multipart/form-data">
        <input type="hidden" name="product_id" value="${prod.id}"/>
        <div class="form-group input-group-sm">
            <label for="product_name">Tên sản phẩm:</label><span style="float: right;color:red;">${info}</span>
            <input type="text" name="product_name" id="product_name" class="form-control"
                   maxlength="20" value="${prod.name}" required/>
        </div>
        <div class="form-group input-group-sm">
            <label for="brand_id">Thương hiệu:</label>
            <select class="form-control" name="brand_id" id="brand_id">
                <c:forEach items="${brands}" var="brand">
                    <option value="${brand.id}" ${prod.brandId==brand.id?"selected":""} >${brand.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group input-group-sm">
            <label for="detail">Mô tả sản phẩm:</label>
            <textarea name="detail" id="detail" class="form-control" required rows="5"
                      cols="20">${prod.detail}</textarea>
        </div>
        <div class="form-group input-group-sm">
            <label for="image">Hình ảnh:</label>
            <input type="file" name="image" id="image" ${prod.id==null? "required":""} />
        </div>
        <div class="form-group input-group-sm">
            <label for="stock">Số lượng trong kho:</label>
            <input type="number" name="stock" id="stock" class="form-control" min="1" value="${prod.stock}" required/>
        </div>
        <div class="form-group input-group-sm">
            <label for="price">Giá:</label>
            <input type="number" name="price" id="price" class="form-control" min="0.00" max="20000.00" step="0.01"
                   value="${prod.price}" required/>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary btn-block" id="bt">${prod.id==null?"Thêm mới":"Cập nhật"}</button>
        <a href="/laptopmall/product_list" class="btn btn-primary btn-block" role="button">Quay lại</a>
    </form>
</div>
</body>
</html>
