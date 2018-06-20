package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConMysql {

	public ConMysql() {
	}

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("鍔犺浇椹卞姩鎴愬姛");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("椹卞姩鍔犺浇澶辫触");
		}
	}

	// 数据库连接字符串
	private static String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8";
	// 用户名
	private static String userName = "root";
	// 密码
	private static String passWord = "zz123456";
	// 连接对象
	static Connection con = null;
	static PreparedStatement ps = null;

	//杩炴帴鏁版嵁搴?
	public static void prepareConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, userName, passWord);
				System.out.println("连接数据库成功");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("杩炴帴澶辫触:" + e.getMessage());
		}
	}

	// 鍏抽棴杩炴帴
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
			throw new RuntimeException("鍏抽棴鏁版嵁搴撳け璐ワ細"+e.getMessage());
		}
	}

	//鍥炴粴
	public static void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("鍥炴粴寮傚父:" + e.getMessage());
		}
	}

	public static void main(String[] args) {
		prepareConnection();
	}

}