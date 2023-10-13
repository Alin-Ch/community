package servlet;

import dao.PeopleDao;
import dao.UserDao;
import entity.People;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "updateInfoServlet", value = "/servlet/updateInfo")
public class updatePeopleInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        String health = request.getParameter("health");
        //System.out.println(id+" "+name+" "+age+" "+sex+" "+health);
        boolean updateSuccess = false;
        updateSuccess = PeopleDao.updateUser(id, name, age, sex, health);
        if (updateSuccess) {
            //writer.println("User " + name + " is deleted successfully!");
            //页面导航：请求转发（这样无法清除路由信息，要用重定向）
            //request.getRequestDispatcher("/servlet/list").forward(request, response);
            String redirectUrl = request.getContextPath() + "/servlet/list";
            response.sendRedirect(redirectUrl);
        } else {
        }


    }
}
