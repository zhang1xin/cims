package com.oioi77.cims.login.filter;

import com.oioi77.cims.util.validate.Validator;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter(
    filterName = "LoginFilter",
    urlPatterns = "/*"
)
public class LoginFilter implements Filter {

    /**
     * 项目访问路径
     */
    private String ctxPath = null;
    /**
     * 保存不拦截的url
     */
    private static List<String> passUrls;

    @Override
    public void init(FilterConfig filterConfig) {
        passUrls = List.of("login.jsp", "login.do", "logout.do", "static/");
        ctxPath = filterConfig.getServletContext().getContextPath();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取当前请求地址
        String url = request.getRequestURI();
        //截取项目名称保留真实地址
        String subUrl = url.substring(ctxPath.length() + 1);
        //如果匹配放行地址则放行
        for (String urlStr : passUrls) {
            if (subUrl.contains(urlStr)) {
                filterChain.doFilter(request, response);
                return;
            }
        }
        //获得session
        HttpSession session = request.getSession();
        //从session中获取对应值,若值不存在,则重定向到redirectUrl
        Object user = session.getAttribute("user");
        if (Validator.isNotEmpty(user)) {
            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect(ctxPath + "/login.jsp");
        }
    }

}
