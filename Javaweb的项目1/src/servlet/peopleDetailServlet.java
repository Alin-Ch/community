package servlet;

import dao.PeopleDao;
import entity.People;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ViewDetailServlet", value = "/servlet/view")
public class peopleDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");


        //调用DAO
        People people = new PeopleDao().findByName(name);
        if (people!=null){
            request.setAttribute("people",people);
            //页面导航：请求转发
            request.getRequestDispatcher("/detail.jsp").forward(request,response);
        }else {
            response.sendRedirect(request.getContextPath() + "/servlet/list");
        }

    }
}
