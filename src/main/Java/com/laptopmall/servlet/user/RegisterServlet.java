package com.laptopmall.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.User;
import com.laptopmall.dao.UserDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

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
        String tenDangNhap = req.getParameter("login_name");
        String matKhau = req.getParameter("password");
        String xacNhanMatKhau = req.getParameter("check_password");

        // Kiểm tra mật khẩu xác nhận có khớp không
        if (!matKhau.equals(xacNhanMatKhau)) {
            req.setAttribute("pwdMsg", "Mật khẩu không khớp");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra tên đăng nhập đã tồn tại trong cơ sở dữ liệu chưa
        if (userDAO.getUserByLoginName(tenDangNhap) != null) {
            req.setAttribute("loginNameMsg", "Tên đăng nhập đã tồn tại, vui lòng nhập lại");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // Tạo người dùng mới và lưu vào cơ sở dữ liệu
        User user = new User();
        user.setLoginName(tenDangNhap);
        user.setPassword(matKhau);
        userDAO.insertUser(user);

        // Thông báo đăng ký thành công
        req.setAttribute("loginNameMsg", "Đăng ký thành công");
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
