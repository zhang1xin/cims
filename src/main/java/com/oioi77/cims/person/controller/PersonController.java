package com.oioi77.cims.person.controller;

import com.google.gson.Gson;
import com.oioi77.cims.person.entity.Person;
import com.oioi77.cims.person.factory.PersonFactory;
import com.oioi77.cims.person.service.PersonService;
import com.oioi77.cims.util.datautil.DataUtils;
import com.oioi77.cims.util.validate.Validator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * [干部收入管理系统]
 * [人员管理-人员逻辑层表现类]
 */

@WebServlet(
        name = "PersonController",
        urlPatterns = "/person.do",
        loadOnStartup = 0
)
public class PersonController extends HttpServlet {
    /**
     * 获取人员模块逻辑层实现类
     */
    private PersonService personService = PersonFactory.getPersonService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1, 验证客户端的操作(标识符 用于定义用户行为)
        String kc = request.getParameter("kc");
        if (Validator.isNotEmpty(kc) && "delete".equals(kc)) {
            // 1. 收集参数
            String id = request.getParameter("id");
            // 2. 调用逻辑层
            if (Validator.isInteger(id)) {
                personService.delete(Integer.valueOf(id));
            }
            // 3. 返回响应
            response.sendRedirect(request.getContextPath() + "/person.do");

        } else if (Validator.isNotEmpty(kc) && "card".equals(kc)) {
            String personCard = request.getParameter("personCard");
            if (Validator.isNotEmpty(personCard) && personCard.length() == 18){
                // 1.查询结果
                Map<String, Object> result = personService.queryCountByPersonCard(personCard);
                // 2. 转换JSON
                Gson gson = new Gson();
                String json = gson.toJson(result);
                // 3. 返回响应
                response.setContentType("application/json;charset=UTF-8");
                PrintWriter writer = response.getWriter();
                writer.write(json);
                writer.flush();
                writer.close();
            }
            
        } else if (Validator.isNotEmpty(kc) && "subsidy".equals(kc)){
            String type = request.getParameter("type");
            if (Validator.isInteger(type) && ("1".equals(type) || "2".equals(type))) {
                // 1.查询结果
                List<Map<String, Object>> result = personService.queryPersonBySubsidy(Integer.parseInt(type));
                // 2. 转换JSON
                Gson gson = new Gson();
                String json = gson.toJson(result);
                // 3. 返回响应
                response.setContentType("application/json;charset=UTF-8");
                PrintWriter writer = response.getWriter();
                writer.write(json);
                writer.flush();
                writer.close();
            }
        }
        else if (Validator.isNotEmpty(kc) && "batch".equals(kc)) {
            // 1. 收集参数
            String[] ids = request.getParameterValues("ids");
            // 2. 调用逻辑层
            personService.delete(ids);
            // 3. 返回响应
            response.sendRedirect(request.getContextPath() + "/person.do");

        } else if (Validator.isNotEmpty(kc) && "create".equals(kc)) {
            // 1.收集参数
            Person entity = new Person();
            String name = request.getParameter("name");
            entity.setName(name);
            String personCard = request.getParameter("personCard");
            entity.setPersonCard(personCard);
            String state = request.getParameter("state");
            if (Validator.isInteger(state)) {
                entity.setState(Integer.valueOf(state));
            }
            String grade = request.getParameter("grade");
            entity.setGrade(grade);
            String startedDate = request.getParameter("startedDate");
            if (Validator.isDate(startedDate)) {
                entity.setStartedDate(DataUtils.stringToDate(startedDate));
            }
            String hotting = request.getParameter("hotting");
            if (Validator.isInteger(hotting)) {
                entity.setHotting(1);
            }
            String property = request.getParameter("property");
            if (Validator.isInteger(property)) {
                entity.setProperty(1);
            }
            String reasons = request.getParameter("reasons");
            entity.setReasons(reasons);

            // 2.封装参数

            // 3.调用逻辑层
            personService.insert(entity);
            //4. 返回响应
            response.sendRedirect(request.getContextPath() + "/person.do");
        } else if (Validator.isNotEmpty(kc) && "load".equals(kc)) {
            // 1. 收集主键ID
            String id = request.getParameter("id");
            if (Validator.isInteger(id)) {
                request.setAttribute("entity", personService.queryById(Integer.valueOf(id)));
                request.getRequestDispatcher("/views/person/update.jsp").forward(request,response);
            } else {
                // 2. 返回响应
                response.sendRedirect(request.getContextPath() + "/person.do");
            }
        } else if (Validator.isNotEmpty(kc) && "update".equals(kc)) {
            // 1.收集参数
            Person entity = new Person();
            String id = request.getParameter("id");
            if (Validator.isInteger(id)){
                entity.setId(Integer.valueOf(id));
            }
            String name = request.getParameter("name");
            entity.setName(name);
            String personCard = request.getParameter("personCard");
            entity.setPersonCard(personCard);
            String state = request.getParameter("state");
            if (Validator.isInteger(state)) {
                entity.setState(Integer.valueOf(state));
            }
            String grade = request.getParameter("grade");
            entity.setGrade(grade);
            String startedDate = request.getParameter("startedDate");
            if (Validator.isDate(startedDate)) {
                entity.setStartedDate(DataUtils.stringToDate(startedDate));
            }
            String hotting = request.getParameter("hotting");
            if (Validator.isInteger(hotting)) {
                entity.setHotting(1);
            }
            String property = request.getParameter("property");
            if (Validator.isInteger(property)) {
                entity.setProperty(1);
            }
            String reasons = request.getParameter("reasons");
            entity.setReasons(reasons);

            // 2.封装参数

            // 3.调用逻辑层
            personService.update(entity);
            //4. 返回响应
            response.sendRedirect(request.getContextPath() + "/person.do");

        } else {

            // 1. 收集客户端搜索参数
            Map<String, Object> params = new HashMap<>();

            String name = request.getParameter("name");
            params.put("name", name);
            String card = request.getParameter("card");
            params.put("card", card);
            String state = request.getParameter("state");
            if (Validator.isInteger(state)) {
                params.put("state", Integer.valueOf(state));
            }

            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            if (Validator.isDate(startDate) && Validator.isDate(endDate)) {
                LocalDate startDate2 = LocalDate.parse(startDate);
                LocalDate endDate2 = LocalDate.parse(endDate);
                if (startDate2.isBefore(endDate2)) {
                    params.put("startDate", DataUtils.stringToDate(startDate));
                    params.put("endDate", DataUtils.stringToDate(endDate));
                }
            }

            String hotting = request.getParameter("hotting");
            String property = request.getParameter("property");
            if (Validator.isInteger(hotting)) {
                params.put("hotting", 1);
            }
            if (Validator.isInteger(property)) {
                params.put("property", 1);
            }


            /** 分页查询 */
            // 1, 计算分页相关参数
            // 当前页
            int thisPage = 1;
            String page = request.getParameter("thisPage");
            if (Validator.isInteger(page)) {
                thisPage = Integer.valueOf(page);
            }
            // 每页展示条数 ;
            int pageNumber = 10;
            // 分页起始条数
            int startNumber = (thisPage - 1) * pageNumber;

            // 封装查询参数
//        Map<String, Object> params = Map.of(
//                "name",null == name?"":name,
//                "card",null == card?"":card,
//                "state",stateNumber,
//                "startDate","",
//                "endDate","",
//                "start",startNumber,
//                "limit",pageNumber);

            params.put("start", startNumber);
            params.put("limit", pageNumber);


            // 总条数
            long count = personService.queryByCount(params);
            // 最大页码
            int maxPage = (int) Math.ceil((count * 1.0) / pageNumber);

            // 调用数据库分页查询
            List<Person> list = personService.quertByPage(params);


            /** 全量查询 */
            // 1. 查询数据库数据
//          List<Person> list = personService.queryAll();

            // 2. 数据写入请求中
            request.setAttribute("list", list);
            request.setAttribute("thisPage", thisPage);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("params", params);
            request.setAttribute("count", count);
            // 3. 跳转到人员展示
            request.getRequestDispatcher("/views/person/list.jsp").forward(request, response);
        }

    }
}
