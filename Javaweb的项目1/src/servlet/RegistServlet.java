package servlet;

import dao.JdbcUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "RegistServlet", value = "/servlet/regist")
public class RegistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到提交登录表单的数据：用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(isUsernameExist(username)) {
            //response.setContentType("regist/jsp;charset=UTF-8");
            String errorMessage = "该用户名已被注册，请更换用户名或登录。";
            request.setAttribute("errorMsg", errorMessage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/regist.jsp");
            dispatcher.forward(request, response);
            return;
        }
        try {
            PreparedStatement stmt = conn.prepareStatement(
                    "INSERT INTO users (username,password) VALUES (?,?)");
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private static final long serialVersionUID = 1L;
    private Connection conn;
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = JdbcUtils.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //用username判断用户是否存在
    private boolean isUsernameExist(String username) {
        boolean exist = false;
        try {
            PreparedStatement stmt = conn.prepareStatement(
                    "SELECT * FROM users WHERE username=?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            exist=rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exist;
    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




}
