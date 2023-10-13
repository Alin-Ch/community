package servlet;

import dao.UserDao;
import entity.Users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "userDetailServlet", value = "/userDetailServlet")
public class userDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        //调用DAO
        Users user = new UserDao().findByName(username);
        if (user!=null){
            request.setAttribute("user",user);
            //页面导航：请求转发
            request.getRequestDispatcher("/userDetail.jsp").forward(request,response);
        }
        else{
            //如果用户是空的，找不到，就重定向到list.jsp
            request.getRequestDispatcher("/userDetail.jsp").forward(request,response);
        }
    }
}
