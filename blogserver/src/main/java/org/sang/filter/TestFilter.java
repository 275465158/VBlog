package org.sang.filter;

import javax.servlet.*;
import java.io.IOException;

public class TestFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if(1==1) {
            //方式1 直接print到前端，考虑的问题避免后续chain.doFilter()执行
            servletResponse.getWriter().write("filter print ok");

        }
    }

    @Override
    public void destroy() {

    }
}
