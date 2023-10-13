package dao;

import entity.Notice;
import entity.People;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class NoticeDao {
    QueryRunner runner = new QueryRunner(true);
    // 查询所有公告的数据 使用QueryRunner实现查询数据操作
    public List<Notice> findAll() {
        //JDBCUtils，只是对jdbc连接数据库的操作做了一个封装，而getConnection 这个方法就可以实现对数据库的连接。
        try (Connection conn = JdbcUtils.getConnection()) {
            return this.runner.query(conn, "select * from notice", new BeanListHandler<Notice>(Notice.class));
            //选择notice数据表中的全部记录                                   后台系统，增加公告 BeanListHandler：将查询结果的每一行封装成指定类型的Notice集合
        } catch (SQLException e) {
            System.err.println("查询所有公告失败：" + e.getMessage());
        }
        return null;
    }

}
