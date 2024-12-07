package com.laptopmall.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.User;
import com.laptopmall.dao.UserDAO;

@WebServlet("/save_user")
public class SaveUserInfoServlet extends HttpServlet {

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

        // Lấy thông tin người dùng hiện tại từ session
        User user = (User) req.getSession().getAttribute("CURRENT_USER");

        // Lấy các thông tin mới từ form
        String hoTen = req.getParameter("real_name");
        String soDienThoai = req.getParameter("phone");
        String diaChi = req.getParameter("address");

        // Cập nhật thông tin người dùng
        user.setRealName(hoTen);
        user.setPhone(soDienThoai);
        user.setAddress(diaChi);

        // Cập nhật thông tin người dùng trong cơ sở dữ liệu
        userDAO.updateUser(user);

        // Thông báo lưu thành công
        req.setAttribute("info", "Lưu thông tin thành công");
        req.getRequestDispatcher("/portal/user_info.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
