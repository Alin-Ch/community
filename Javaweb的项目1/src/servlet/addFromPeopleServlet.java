package servlet;

import dao.JdbcUtils;
import dao.PeopleDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "addFromPeopleServlet", value = "/addFromPeopleServlet")
public class addFromPeopleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        String health = request.getParameter("health");
        //System.out.println(name+" "+age+" "+sex+" "+health);
        try {
            if (PeopleDao.insert(name, age, sex, health)) {
                request.setAttribute("message", "添加成功");
            } else {
                request.setAttribute("message", "添加失败");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "添加失败：" + e.getMessage());
        }
        // 弹出提示框
        String message = "添加成功！";
        String script = "alert('" + message + "');";

        // 使用响应对象向客户端输出JavaScript代码，并设置Content-Type头部
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<script>" + script + "</script>");
        // 执行重定向
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath+"/servlet/peopleIndex");    //这里要根据上下文，根据来的路径进行不同的重定向
    }

}
