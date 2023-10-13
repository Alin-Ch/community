package servlet;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "deleteUserServlet", value = "/deleteUser")
public class deleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        UserDao userDao = new UserDao();
        boolean deleted = false;
        try {
            deleted = userDao.deleteUser(username);//删除老人信息
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (deleted) {
            //writer.println("User " + username + " is deleted successfully!");
            //页面导航：请求转发
            String redirectUrl = request.getContextPath() + "/servlet/list";
            response.sendRedirect(redirectUrl);
            //request.getRequestDispatcher("/servlet/list").forward(request, response);
        } else {
            writer.println("Deleting user " + username + " failed.");
        }
        writer.close();
    }
}
