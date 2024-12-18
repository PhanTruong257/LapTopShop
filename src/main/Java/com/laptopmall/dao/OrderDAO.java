package com.laptopmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.laptopmall.bean.Order;
import com.laptopmall.bean.User;
import com.laptopmall.page.PageInfo;
import com.laptopmall.util.JdbcUtil;

public class OrderDAO {


    public PageInfo<Order> listOrders(Integer userId, Integer currentPage, Integer pageSize) {
        String sql = "select * from `order` where user_id=? order by pay_time desc limit ?,?";
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, (currentPage - 1) * pageSize);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setPayment(rs.getBigDecimal("payment"));
                order.setPayTime(new Date(rs.getTimestamp("pay_time").getTime()));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return new PageInfo<>(list, currentPage, pageSize, getOrderCount(userId));
    }

    private int getOrderCount(Integer userId) {
        String sql = "select count(1) from `order` where user_id=?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return 0;
    }

    public PageInfo<Order> listOrders(Integer currentPage, Integer pageSize) {
        String sql = "select * from `order` order by pay_time desc limit ?,?";
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (currentPage - 1) * pageSize);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setPayment(rs.getBigDecimal("payment"));
                order.setPayTime(new Date(rs.getTimestamp("pay_time").getTime()));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return new PageInfo<>(list, currentPage, pageSize, getOrderCount());
    }


    private int getOrderCount() {
        String sql = "select count(1) from `order`";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return 0;
    }


    public Order getOrderById(Integer id) {
        String sql = "select * from `order` where id=?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setPayment(rs.getBigDecimal("payment"));
                order.setPayTime(new Date(rs.getTimestamp("pay_time").getTime()));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return null;
    }


    public boolean insertOder(Order order) {
        String sql = "insert into `order`(user_id,payment,pay_time) values(?,?,now())";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setBigDecimal(2, order.getPayment());
//			ps.setDate(3, new Date(order.getPayTime().getTime()));
            boolean result = ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            order.setId(rs.getInt(1));
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, null);
        }
        return false;
    }


    public boolean updateOrder(Order newOrder) {
        String sql = "update `order` set user_id=?,payment=?,pay_time=now() where id=?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newOrder.getUserId());
            ps.setBigDecimal(2, newOrder.getPayment());
            ps.setInt(3, newOrder.getId());
            return ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, null);
        }
        return false;
    }


    public List<Order> listOrders(Integer userId) {
        String sql = "select * from `order` where user_id=? order by pay_time desc";
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setPayment(rs.getBigDecimal("payment"));
                order.setPayTime(new Date(rs.getTimestamp("pay_time").getTime()));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return list;
    }


    public List<Order> listOrders() {
        String sql = "select * from `order` order by pay_time desc";
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setPayment(rs.getBigDecimal("payment"));
                order.setPayTime(new Date(rs.getTimestamp("pay_time").getTime()));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, ps, rs);
        }
        return list;
    }

 
}
