package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import dao.UserDao;
import entity.Users;

@WebServlet(name = "LoginServlet", value = "/servlet/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();//字符的输出流
        //得到提交登录表单的数据：用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //System.out.println(username + "," +  password);
        Users logUser = new UserDao().selectByLogin(new Users(username, password));
        if (logUser != null) {
            //登录成功
            //登录成功把用户的信息存入HttpSession
            HttpSession session = request.getSession();
            session.setAttribute("logedUser", logUser);
            // 如果是管理员admin 请求重定向到 list列表
            if (username.equals("admin")){
                response.sendRedirect(request.getContextPath() + "/servlet/list");
            }else{
                response.sendRedirect(request.getContextPath() + "/servlet/peopleIndex");
            }

        } else {
            //登录失败
            //请求重定向
            //request.getContextPath() 得到 /bookstore
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
