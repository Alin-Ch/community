package servlet;

import dao.JdbcUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "peoplePublishServlet", value = "/servlet/publishServlet")
public class peoplePublishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从表单中获取公告内容
        String noticeContent = request.getParameter("notice");
        // 获取当前时间
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        // 连接数据库并将公告信息插入到数据库中
        try (Connection conn = JdbcUtils.getConnection()) {
            String sql = "INSERT INTO notice (time, notice) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, time);
            pstmt.setString(2, noticeContent);
            pstmt.executeUpdate();
            // 如果成功插入公告，则重定向用户回到发布公告页面
//            response.sendRedirect("publish.jsp?status=success");
            response.sendRedirect(request.getContextPath() + "/servlet/peopleIndex");
        } catch (SQLException e) {
            // 如果发生异常，则将错误消息返回给用户
            response.sendRedirect("peopleIndex.jsp");
            e.printStackTrace();
        }
    }
}
