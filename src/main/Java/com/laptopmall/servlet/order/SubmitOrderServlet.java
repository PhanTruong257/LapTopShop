package com.laptopmall.servlet.order;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.Cart;
import com.laptopmall.bean.Order;
import com.laptopmall.bean.OrderItem;
import com.laptopmall.bean.Product;
import com.laptopmall.bean.User;
import com.laptopmall.dao.CartDAO;
import com.laptopmall.dao.OrderDAO;
import com.laptopmall.dao.OrderItemDAO;
import com.laptopmall.dao.ProductDAO;

@WebServlet("/submit_order")
public class SubmitOrderServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;
    private ProductDAO productDAO;
    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        productDAO = new ProductDAO();
        orderDAO = new OrderDAO();
        orderItemDAO = new OrderItemDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        User user = (User) req.getSession().getAttribute("CURRENT_USER");
        List<Cart> carts = cartDAO.listCartByUserId(user.getId());

        Order order = new Order();
        order.setUserId(user.getId());
        orderDAO.insertOder(order);

        BigDecimal payment = new BigDecimal("0");
        for (Cart cart : carts) {
            Product product = productDAO.getProductById(cart.getProductId());

            OrderItem orderItem = new OrderItem();
            orderItem.setUser_id(user.getId());
            orderItem.setOrderId(order.getId());
            orderItem.setProductName(product.getName());
            orderItem.setProductImage(product.getImage());
            orderItem.setProductPrice(product.getPrice());
            orderItem.setQuantity(cart.getQuantity());

            BigDecimal sum = product.getPrice().multiply(new BigDecimal(cart.getQuantity().toString()));
            orderItem.setTotalPrice(sum);
            orderItemDAO.insertOrderItem(orderItem);

            payment = payment.add(sum);

            product.setStock(product.getStock() - cart.getQuantity());
            productDAO.updateProduct(product);
        }

        order.setPayment(payment);
        orderDAO.updateOrder(order);

        cartDAO.deleteCartByUserId(user.getId());

        req.setAttribute("orderId", order.getId());
        req.getRequestDispatcher("/portal/submit_order_success.jsp").forward(req, resp);
    }


}
