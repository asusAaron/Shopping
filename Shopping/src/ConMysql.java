package cn.mj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConMysql {

	public ConMysql() {
	}

	static {
		// ������������
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("��������ʧ��");
		}
	}
	// ���ݿ������ַ���
	private static String url = "jdbc:mysql://localhost:3306/book_store?useUnicode=true&characterEncoding=utf8";
	// �û���
	private static String userName = "root";
	// ����
	private static String passWord = "********";
	// ���Ӷ���
	static Connection con = null;
	// ������
	static PreparedStatement ps = null;

	// ���ݿ����ӷ���
	public static void prepareConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, userName, passWord);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("�����쳣:" + e.getMessage());
		}
	}

	// �رշ���
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
			throw new RuntimeException("�ر������쳣:" + e.getMessage());
		}
	}

	// �����ع�
	public static void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("�ع�ʧ��:" + e.getMessage());
		}
	}
}