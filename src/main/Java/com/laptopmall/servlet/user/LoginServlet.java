package com.laptopmall.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.User;
import com.laptopmall.dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        // Khởi tạo đối tượng thao tác cơ sở dữ liệu cho người dùng
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // Lấy tham số từ yêu cầu
        String tenDangNhap = req.getParameter("login_name");
        String matKhau = req.getParameter("password");
        // Tìm kiếm trong bảng `user` bằng tên đăng nhập và mật khẩu
        User user = userDAO.getUserByLoginNameAndPassword(tenDangNhap, matKhau);
        if (user == null) {
            // Trả về thông báo lỗi
            req.setAttribute("errMsg", "Tên đăng nhập hoặc mật khẩu không đúng");
            // Chuyển hướng yêu cầu về trang đăng nhập
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            // Lưu thông tin người dùng vào Session
            req.getSession().setAttribute("CURRENT_USER", user);
            // Chuyển hướng đến trang danh sách sản phẩm
            resp.sendRedirect("product_list");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
