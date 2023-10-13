package servlet;

import dao.NoticeDao;
import dao.UserDao;
import dao.PeopleDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import entity.*;

@WebServlet(name = "FoodsListServlet", value = "/servlet/list")
public class ListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        //
        PeopleDao peopleDao = new PeopleDao();
        List<People> peopleList = peopleDao.findAll();
        NoticeDao noticeDao = new NoticeDao();
        List<Notice> noticeList = noticeDao.findAll();
        Collections.reverse(noticeList);    //将noticeList反转
        UserDao userDao = new UserDao();
        List<Users> userList = userDao.findAll();
        //把数据转移到JSP页面显示
        request.setAttribute("peopleList", peopleList);
        request.setAttribute("noticeList", noticeList);
        request.setAttribute("usersList", userList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }
}
