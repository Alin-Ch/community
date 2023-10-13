package dao;

import entity.People;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import entity.Users;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao {
    //apache dbutil 组件库中的类，所有的 CRUD 操作都通过这个类完成
    QueryRunner runner = new QueryRunner(true); //true: 解决like 查询

    // 查询所有用户的数据
    public List<Users> findAll() {
        try (Connection conn = JdbcUtils.getConnection()) {
            return this.runner.query(conn, "select * from users WHERE username != 'admin'", new BeanListHandler<Users>(Users.class));
        } catch (SQLException e) {
            System.err.println("查询所有用户失败：" + e.getMessage());
        }
        return null;
    }
    // 根据名字查找用户
    public Users findByName(String username) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users user = null;
        try {
            // 获取数据库连接
            conn = JdbcUtils.getConnection();
            String sql = "select * from users where username=?";
            // 创建PreparedStatement对象
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            // 执行查询语句，返回结果集
            rs = stmt.executeQuery();
            // 将ResultSet映射为Java对象
            if (rs.next()) {
                user = new Users();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //更新用户信息
    public static boolean updateUser(int id, String username, String password){
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcUtils.getConnection();
            stmt = conn.prepareStatement("UPDATE users SET username = ?, password = ?  WHERE id = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setInt(3, id);
            int result = stmt.executeUpdate();
            return result == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public Users selectByLogin(Users user) {

        try(Connection conn = JdbcUtils.getConnection();) {
            String sql = "select username username, password password " +
                    "from users where username=? and password=?";
            //查询
            return this.runner.query(conn,sql,new BeanHandler<>(Users.class),user.getUsername(), user.getPassword());
        } catch (SQLException e) {
            System.err.println("登录失败：" + e.getMessage());
        }
        return null;
    }

    //删除人员信息
    public boolean deleteUser(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcUtils.getConnection();
            stmt = conn.prepareStatement("DELETE FROM users WHERE username = ?");
            stmt.setString(1, username);
            int result = stmt.executeUpdate();
            return result == 1;
        } finally {
        }
    }









}
