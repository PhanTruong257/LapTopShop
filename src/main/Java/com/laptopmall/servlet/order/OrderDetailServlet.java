package com.laptopmall.servlet.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bean.Order;
import com.laptopmall.bean.OrderItem;
import com.laptopmall.bean.User;
import com.laptopmall.dao.OrderDAO;
import com.laptopmall.dao.OrderItemDAO;
import com.laptopmall.dao.UserDAO;

@WebServlet("/order_detail")
public class OrderDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderItemDAO orderItemDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderItemDAO = new OrderItemDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("CURRENT_USER");
        if (user.getRole() == 1) {
            String orderIdStr = req.getParameter("order_id");
            List<OrderItem> orderItems = orderItemDAO.ListOrderItemsByOrderId(Integer.parseInt(orderIdStr));
            req.setAttribute("orderItems", orderItems);
            Order order = orderDAO.getOrderById(Integer.parseInt(orderIdStr));
            UserDAO userDAO = new UserDAO();
            User userView = userDAO.getUserById(order.getUserId());
            req.setAttribute("userView", userView.getRealName());
            req.setAttribute("order", order);
            req.getRequestDispatcher("/backend/order_detail.jsp").forward(req, resp);
        } else {
            String orderIdStr = req.getParameter("order_id");
            List<OrderItem> orderItems = orderItemDAO.ListOrderItemsByUserIdAndOrderId(user.getId(), Integer.parseInt(orderIdStr));
            req.setAttribute("orderItems", orderItems);
            Order order = orderDAO.getOrderById(Integer.parseInt(orderIdStr));
            req.setAttribute("order", order);
            req.getRequestDispatcher("/portal/order_detail.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
