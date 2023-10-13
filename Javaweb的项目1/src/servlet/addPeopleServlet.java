package servlet;

import dao.JdbcUtils;
import dao.PeopleDao;
import dao.UserDao;
import entity.Users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "addPeopleServlet", value = "/addPeopleServlet")
public class addPeopleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
        //request.getRequestDispatcher("list.jsp").forward(request, response);请求转发的时候路由未清除
        response.sendRedirect("servlet/list");    //这里要根据上下文，根据来的路径进行不同的重定向
    }

}
