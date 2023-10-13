package dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class PeopleDao {
    QueryRunner runner = new QueryRunner(true);
    // 查询所有老人的数据
    public List<People> findAll() {
        try (Connection conn = JdbcUtils.getConnection()) {
            return this.runner.query(conn, "select * from people", new BeanListHandler<People>(People.class));
        } catch (SQLException e) {
            System.err.println("查询所有老人失败：" + e.getMessage());
        }
        return null;
    }

    // 根据id查找老人
    public People findById(int id) {
        try (Connection conn = JdbcUtils.getConnection()) {
            String sql = "select * from people where id=?";
            return this.runner.query(conn, sql, new BeanHandler<People>(People.class),id);
        } catch (SQLException e) {
            System.err.println("查找老人失败：" + e.getMessage());
        }
        return null;
    }

    // 根据名字查找老人
    public People findByName(String name) {
        try (Connection conn = JdbcUtils.getConnection()) {
            String sql = "select * from people where name=?";
            return this.runner.query(conn, sql, new BeanHandler<People>(People.class),name);
        } catch (SQLException e) {
            System.err.println("查找老人失败：" + e.getMessage());
        }
        return null;
    }

    //更新老人信息
    public static boolean updateUser(int id, String name, int age, String sex, String health){
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcUtils.getConnection();
            stmt = conn.prepareStatement("UPDATE people SET name = ?, age = ?, sex = ?, health = ? WHERE id = ?");
            stmt.setString(1, name);
            stmt.setInt(2, age);
            stmt.setString(3, sex);
            stmt.setString(4, health);
            stmt.setInt(5, id);
            int result = stmt.executeUpdate();
            return result == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    //删除老人信息
    public boolean deletePeople(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcUtils.getConnection();
            stmt = conn.prepareStatement("DELETE FROM people WHERE name = ?");
            stmt.setString(1, name);
            int result = stmt.executeUpdate();
            return result == 1;
        } finally {
        }
    }

    //增加老人
    public static boolean insert(String name, int age, String sex, String health) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        PreparedStatement people = null;
        String sql = "INSERT INTO people (name, age, sex, health) VALUES (?, ?, ?, ?)";
        people = conn.prepareStatement(sql);
        people.setString(1, name);
        people.setInt(2, age);
        people.setString(3, sex);
        people.setString(4,  health);

        return people.executeUpdate() > 0;
    }
}
