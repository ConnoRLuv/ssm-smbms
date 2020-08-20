package com.connor.filter;


import com.sun.net.httpserver.HttpServer;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class loginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        if (session.getAttribute("loginUser") == null && (!request.getRequestURI().contains("/login/doLogin.do"))) {
            response.sendRedirect(request.getContextPath() + "/login/doLogin.do");
        } else
            filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}
