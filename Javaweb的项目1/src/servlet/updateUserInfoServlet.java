package servlet;

import dao.PeopleDao;
import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "updateUserInfoServlet", value = "/updateUserInfo")
public class updateUserInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        System.out.println(id+" "+username+" "+password);
        boolean updateSuccess = false;
        updateSuccess = UserDao.updateUser(id, username, password);
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
