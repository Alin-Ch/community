package servlet;

import dao.NoticeDao;
import dao.PeopleDao;
import entity.Notice;
import entity.People;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "peopleIndexServlet", value = "/servlet/peopleIndex")
public class peopleIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NoticeDao noticeDao = new NoticeDao();
        List<Notice> noticeList = noticeDao.findAll();
        Collections.reverse(noticeList);    //将noticeList反转
        //把数据转移到JSP页面显示
        request.setAttribute("noticeList", noticeList);
        request.getRequestDispatcher("/peopleIndex.jsp").forward(request, response);
    }
}
