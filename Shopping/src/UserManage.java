package cn.mj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserManage {

	// 添加用户
	public int addUser(User user) {

		String sql = "INSERT INTO user(userName,password) VALUES (?,?)";
		int i = 0;
		try {
			ConMysql.prepareConnection();
			ConMysql.con.setAutoCommit(false);
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setString(1, user.getName());
			ConMysql.ps.setString(2, user.getPassword());
			i = ConMysql.ps.executeUpdate();
			ConMysql.con.commit();
		} catch (SQLException e) {
			ConMysql.rollback();
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
		return i;
	}

	// 删除用户
	public int delUserForId(User user) {
		String sql = "DELETE FROM user WHERE userNum=?";
		int i = 0;
		try {
			ConMysql.prepareConnection();
			ConMysql.con.setAutoCommit(false);
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setInt(1, user.getId());
			i = ConMysql.ps.executeUpdate();
			ConMysql.con.commit();
		} catch (SQLException e) {
			ConMysql.rollback();
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
		return i;
	}

	//更改密码
	public void updatePassword(int userNum,String newPassword){
		String sql = "update user set password =? where userNum=?";
		try {
			ConMysql.prepareConnection();
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setString(1, newPassword);
			ConMysql.ps.setInt(2, userNum);
			ConMysql.ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
	}
	// 获取所有用户
	public List<User> getAllUsers() {
		String sql = "SELECT * FROM user";
		List<User> users = new ArrayList<User>();
		try {
			ConMysql.prepareConnection();
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ResultSet rs = ConMysql.ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("userNum"));
				user.setName(rs.getString("userName"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
		return users;
	}
}
