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
			System.out.println("加载驱动成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("驱动加载失败");
		}
	}
<<<<<<< HEAD
	// url
	private static String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8&amp";
	// 用户
	private static String userName = "root";
	// 密码
	private static String passWord = "19960626lyf";
=======
	// ���ݿ������ַ���
	private static String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8";
	// �û���
	private static String userName = "root";
	// ����
	private static String passWord = "zz123456";
	// ���Ӷ���
>>>>>>> ac08048666f56f5c1c275c5960b76d96e64192dc
	static Connection con = null;
	static PreparedStatement ps = null;

	//连接数据库
	public static void prepareConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, userName, passWord);
<<<<<<< HEAD
				System.out.println("连接数据库成功");
=======
				System.out.println("�������ݿ�ɹ�");
>>>>>>> ac08048666f56f5c1c275c5960b76d96e64192dc
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("连接失败:" + e.getMessage());
		}
	}

	// 关闭连接
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
			throw new RuntimeException("关闭数据库失败："+e.getMessage());
		}
	}

	//回滚
	public static void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("回滚异常:" + e.getMessage());
		}
	}

	public static void main(String[] args) {
		prepareConnection();
	}

}