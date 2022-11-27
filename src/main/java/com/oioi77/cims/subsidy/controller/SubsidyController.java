package com.oioi77.cims.subsidy.controller;

import com.oioi77.cims.util.validate.Validator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * [干部收入管理系统]
 * [离退休补贴-补贴逻辑层表现类]
 */

@WebServlet(
        name = "SubsidyController",
        urlPatterns = "/subsidy.do",
        loadOnStartup = 0
)
public class SubsidyController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 收集补贴类型 1:供暖 2:物业
        String type = request.getParameter("type");
        if (Validator.isInteger(type) && ("1".equals(type) || "2".equals(type))) {
            // 1. 分页参数

            // 2. 查询数据
            request.setAttribute("type", type);

            // 3. 返回响应
            request.getRequestDispatcher("/views/subsidy/list.jsp").forward(request, response);
        }

    }
}
