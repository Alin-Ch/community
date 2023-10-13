package dao;
//Java数据库连接
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtils {
    //驱动类名
    // MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
    final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    //url
    final static String URL = "jdbc:mysql://localhost:3306/community";
    //数据库用户名 和 密码
    final static String USERNAME = "root";
//    final static String PASSWORD = "cen17776429331";
    final static String PASSWORD = "123456";

    //静态初始化代码块
    static {
        //1.注册驱动程序类，只需注册一次即可
        //捕获异常
        try {
            Class.forName(DRIVER); //注册JDBC驱动
        } catch (ClassNotFoundException e) { // Java 定义在 java.lang 包中的检查性异常类（ClassNotFoundException） 应用程序试图加载类时，找不到相应的类，抛出该异常。
            System.err.println("注册驱动程序失败：" + e.getMessage());
            //System.out.println输出有缓存,System.err.println是立即输出
        }
    }

    /*
    * 链接数据库*/
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // 2.获得数据库连接 与数据库建立链接
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e){
            System.err.println("获得数据库连接失败：" + e.getMessage());
        }
        return conn;
    }

    /*
    * 工程入口*/
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
