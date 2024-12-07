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
import com.laptopmall.bean.User;
import com.laptopmall.dao.BrandDAO;
import com.laptopmall.dao.ProductDAO;
import com.laptopmall.page.PageInfo;
import com.laptopmall.page.QueryObject;

@WebServlet("/product_list")
public class ListProductsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private BrandDAO brandDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        brandDAO = new BrandDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("CURRENT_USER");
        String keyword = req.getParameter("keyword");
        String brandIdStr = req.getParameter("brand_id");
        String curPageStr = req.getParameter("current_page");
        keyword = keyword == null ? "" : keyword;
        brandIdStr = brandIdStr == null ? "0" : brandIdStr;

        QueryObject qo = new QueryObject(keyword, Integer.parseInt(brandIdStr));
        if (curPageStr != null) {
            qo.setCurrentPage(Integer.parseInt(curPageStr));
        }

        PageInfo<Product> pageInfo = productDAO.listProducts(qo);
        req.setAttribute("pageInfo", pageInfo);
        for (Product product : pageInfo.getList()) {
            System.out.println(product.toString());
        }

        List<Brand> brands = brandDAO.listBrands();

        for (Brand brand : brands) {
            System.out.println(brand.toString());
        }
        req.setAttribute("brands", brands);

        req.setAttribute("qo", qo);
        req.setAttribute("check", "check");
        if (user.getRole() == 1) {

            req.getRequestDispatcher("/backend/product_list.jsp").forward(req, resp);
        } else {

            req.getRequestDispatcher("/portal/product_list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
