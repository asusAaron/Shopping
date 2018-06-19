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
			System.out.println("åŠ è½½é©±åŠ¨æˆåŠŸ");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("é©±åŠ¨åŠ è½½å¤±è´¥");
		}
	}
<<<<<<< HEAD
	// url
	private static String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8&amp";
	// ç”¨æˆ·
	private static String userName = "root";
	// å¯†ç 
	private static String passWord = "19960626lyf";
=======
	// Êı¾İ¿âÁ¬½Ó×Ö·û´®
	private static String url = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT%2B8";
	// ÓÃ»§Ãû
	private static String userName = "root";
	// ÃÜÂë
	private static String passWord = "zz123456";
	// Á¬½Ó¶ÔÏó
>>>>>>> ac08048666f56f5c1c275c5960b76d96e64192dc
	static Connection con = null;
	static PreparedStatement ps = null;

	//è¿æ¥æ•°æ®åº“
	public static void prepareConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, userName, passWord);
<<<<<<< HEAD
				System.out.println("è¿æ¥æ•°æ®åº“æˆåŠŸ");
=======
				System.out.println("Á¬½ÓÊı¾İ¿â³É¹¦");
>>>>>>> ac08048666f56f5c1c275c5960b76d96e64192dc
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("è¿æ¥å¤±è´¥:" + e.getMessage());
		}
	}

	// å…³é—­è¿æ¥
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
			throw new RuntimeException("å…³é—­æ•°æ®åº“å¤±è´¥ï¼š"+e.getMessage());
		}
	}

	//å›æ»š
	public static void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("å›æ»šå¼‚å¸¸:" + e.getMessage());
		}
	}

	public static void main(String[] args) {
		prepareConnection();
	}

}