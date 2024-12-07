package com.laptopmall.servlet.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.Brand;
import com.laptopmall.bean.Product;
import com.laptopmall.bo.BrandBO;
import com.laptopmall.bo.ProductBO;

@WebServlet("/edit_product")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductBO productBO;
    private BrandBO brandBO;

    @Override
    public void init() throws ServletException {
        productBO = new ProductBO();
        brandBO = new BrandBO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String idStr = req.getParameter("id");

        if (idStr != null && !"".equals(idStr)) {

            Product product = productBO.getProductById(Integer.parseInt(idStr));
            req.setAttribute("prod", product);
        }
        List<Brand> brands = brandBO.listBrands();
        req.setAttribute("brands", brands);

        req.getRequestDispatcher("/backend/product_edit.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
