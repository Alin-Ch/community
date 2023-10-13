package servlet;

import dao.PeopleDao;
import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "deleteFoodServlet", value = "/servlet/delete")
public class deletePeopleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        String name = request.getParameter("name");
        PeopleDao peopleDao = new PeopleDao();
        boolean deleted = false;
        try {
            deleted = peopleDao.deletePeople(name);//删除老人信息
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (deleted) {
            //writer.println("User " + name + " is deleted successfully!");
            //页面导航：请求转发
            String redirectUrl = request.getContextPath() + "/servlet/list";
            response.sendRedirect(redirectUrl);
            //request.getRequestDispatcher("/servlet/list").forward(request, response);
        } else {
            writer.println("Deleting user " + name + " failed.");
        }
        writer.close();
    }
}
