package servlet;

import dao.JdbcUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "deleteNoticeServlet", value = "/servlet/deleteNotice")
public class deleteNoticeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从URL中获取要删除的公告 ID
        int noticeId = Integer.parseInt(request.getParameter("id"));
        //System.out.println(noticeId);
        // 连接数据库并将公告从数据库中删除
        try (Connection conn = JdbcUtils.getConnection()) {
            String sql = "DELETE FROM notice WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeId);
            pstmt.executeUpdate();
            // 如果成功删除公告，则重定向用户回到公告列表页面
            response.sendRedirect(request.getContextPath() +"/servlet/list");
        } catch (SQLException e) {
            // 如果发生异常，则将错误消息返回给用户
            response.sendRedirect("/servlet/list");
            e.printStackTrace();
        }
    }
}
