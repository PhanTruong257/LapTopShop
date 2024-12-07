package com.laptopmall.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bo.ProductBO;

@WebServlet("/del_product")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductBO productBO;

    @Override
    public void init() throws ServletException {
        productBO = new ProductBO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String idStr = req.getParameter("id");

        productBO.deleteProductById(Integer.parseInt(idStr));
        resp.sendRedirect("product_list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
