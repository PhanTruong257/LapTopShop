package com.laptopmall.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.Brand;
import com.laptopmall.dao.BrandDAO;

@WebServlet("/save_brand")
public class SaveBrandServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BrandDAO brandDAO;

    @Override
    public void init() throws ServletException {
        brandDAO = new BrandDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String tenThuongHieu = req.getParameter("brand_name");
        if (brandDAO.getBrandByName(tenThuongHieu) != null) {
            // Nếu thương hiệu đã tồn tại
            req.setAttribute("info", "Thương hiệu này đã tồn tại");
            req.getRequestDispatcher("/backend/brand_edit.jsp").forward(req, resp);
        } else {
            // Nếu thương hiệu chưa tồn tại
            Brand brand = new Brand();
            brand.setName(tenThuongHieu);
            brandDAO.insertBrand(brand);
            req.setAttribute("info", "Thêm thương hiệu thành công");
            req.getRequestDispatcher("/backend/brand_edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
