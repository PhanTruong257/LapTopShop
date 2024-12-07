package com.laptopmall.servlet.cart;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.Cart;
import com.laptopmall.bean.Product;
import com.laptopmall.bean.User;
import com.laptopmall.dao.CartDAO;
import com.laptopmall.dao.ProductDAO;
import com.laptopmall.vo.CartProductVO;

@WebServlet("/list_cart")
public class ListCartsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("CURRENT_USER");

        List<Cart> carts = cartDAO.listCartByUserId(user.getId());

        List<CartProductVO> cartProductVOs = new ArrayList<>();

        BigDecimal cartTotalPrice = new BigDecimal("0");
        for (Cart cart : carts) {
            CartProductVO cartProductVO = new CartProductVO();

            Product product = productDAO.getProductById(cart.getProductId());

            cartProductVO.setProductName(product.getName());
            cartProductVO.setProductImage(product.getImage());
            cartProductVO.setProductDetail(product.getDetail());
            cartProductVO.setProductStock(product.getStock());
            cartProductVO.setProductPrice(product.getPrice());
            cartProductVO.setQuantity(cart.getQuantity());

            BigDecimal prodSum = product.getPrice().multiply(new BigDecimal(cart.getQuantity().toString()));
            cartTotalPrice = cartTotalPrice.add(prodSum);
            cartProductVO.setCartId(cart.getId());
            cartProductVOs.add(cartProductVO);
        }
        req.setAttribute("cartTotalPrice", cartTotalPrice);
        req.setAttribute("cartProds", cartProductVOs);
        req.getRequestDispatcher("/portal/shop_cart.jsp").forward(req, resp);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
