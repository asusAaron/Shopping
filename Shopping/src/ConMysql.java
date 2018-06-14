package cn.mj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConMysql {

	public ConMysql() {
	}

	static {
		// 加载驱动程序
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("驱动加载失败");
		}
	}
	// 数据库连接字符串
	private static String url = "jdbc:mysql://localhost:3306/book_store?useUnicode=true&characterEncoding=utf8";
	// 用户名
	private static String userName = "root";
	// 密码
	private static String passWord = "********";
	// 连接对象
	static Connection con = null;
	// 语句对象
	static PreparedStatement ps = null;

	// 数据库连接方法
	public static void prepareConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, userName, passWord);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("连接异常:" + e.getMessage());
		}
	}

	// 关闭方法
	public static void close() {
		try {
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("关闭连接异常:" + e.getMessage());
		}
	}

	// 操作回滚
	public static void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("回滚失败:" + e.getMessage());
		}
	}
}