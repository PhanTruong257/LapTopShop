<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:out value="Chào bạn, JSTL!"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang thương mại điện tử · Đăng nhập</title>
    <link href="/laptopmall/css/bootstrap.css" rel="stylesheet">
    <script src="/laptopmall/js/jquery-3.3.1.min.js"></script>
    <script src="/laptopmall/js/bootstrap.min.js"></script>
    <style type="text/css">
        div {
            margin: 0 auto;
            width: 300px;
        }

        #main {
            margin-top: 100px;
        }
    </style>
</head>
<body>
<br/>
<br/>
<div id="main">
    <h4 style="text-align: center">Đăng Nhập</h4>
    <c:if test="${not empty errMsg}">
        <span style="color: red;">${errMsg}</span>
    </c:if>
    <%
        session.invalidate();
    %>
    <form action="login" method="post" class="input-group-sm">
        <div class="form-group input-group-sm">
            <label for="login_name">Tài khoản:</label>
            <input type="text" name="login_name" id="login_name" class="form-control" required/>
        </div>
        <div class="form-group input-group-sm">
            <label for="password">Mật khẩu:</label>
            <input type="password" name="password" id="password" class="form-control" required/>
        </div>
        <a href="register.jsp">Chưa có tài khoản? Nhấn vào đây để đăng ký!</a>
        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
    </form>
</div>
</body>
</html>
