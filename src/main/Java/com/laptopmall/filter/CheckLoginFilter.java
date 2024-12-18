package com.laptopmall.filter;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.laptopmall.bean.User;


@WebFilter(filterName = "CheckLoginFilter", urlPatterns = "/*")
public class CheckLoginFilter implements Filter {

    private static final String[] ALLOWED_PATHS = {"/index.jsp", "/login", "/login.jsp", "/register", "/register.jsp", "/guest.jsp", "/product_list", "/js/jquery-3.3.1.min.js", "/js/bootstrap.min.js", "/css/bootstrap.css"};

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        String path = req.getServletPath();
        System.out.println(path);
        boolean allowed = isAllowedPath(path);
        User user = (User) session.getAttribute("CURRENT_USER");
        if (!allowed && user == null) {
            ((HttpServletResponse) response).sendRedirect("/laptopmall/login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }

    public boolean isAllowedPath(String path) {
        if (Arrays.asList(ALLOWED_PATHS).contains(path)) {
            return true;
        }

        if (path.startsWith("/js/") || path.startsWith("/css/") || path.startsWith("/images/")) {
            return true;
        }

        return false;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

}
