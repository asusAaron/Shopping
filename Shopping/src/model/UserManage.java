package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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

	//修改密码
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
	//添加购物车图书
	public boolean addBook(String bookId,String userName)
	{
		String books = getCartlistIds(userName);
		if(books.indexOf(bookId)==-1)
		{
			String sql = "update user set books = ? where userName = ?";
			if(bookId.length()==0)
			{
				books+=bookId;
			}
			else
			{
				books+=",";
				books+=bookId;
			}
			doUpdateBooks(books,userName);
			return true;
		}
		else
		{
			return false;
		}
	}
	//删除购物车图书
	public void deleteBook(String bookId,String userName)
	{
		String books = getCartlistIds(userName);
		if(books.indexOf(bookId)!=-1)
		{
			List<String> idList = new ArrayList<>(Arrays.asList(books.split(",")));
			idList.remove(bookId);
			String newBooks = "";
			if(idList.size()>0)
			{
				newBooks+=idList.get(0);
				for(int i=1;i<idList.size();i++)
				{
					newBooks+=",";
					newBooks+=idList.get(i);
				}
			}
			doUpdateBooks(newBooks,userName);
		}
	}
	private void doUpdateBooks(String books,String userName)
	{
		String sql = "update user set books = ? where userName = ?";
		try {
			ConMysql.prepareConnection();
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setString(1, books);
			ConMysql.ps.setString(2, userName);
			ConMysql.ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
	}
	//得到books字符串
	public String getCartlistIds(String userName)
	{
		String sql = "SELECT * FROM user where userName = ?";
		String result = null;
		try {
			ConMysql.prepareConnection();
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setString(1,userName);

			ResultSet rs = ConMysql.ps.executeQuery();
			if(rs.next())
			{
				result = rs.getString("books");
				if(result==null)
					result = "";
			}
			else
			{
				result = "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
		return result;
	}
	//得到购物车中所有图书
	public List<Book> getCartlistBooks(String userName) throws SQLException {
		BookManage bm = new BookManage();
		return bm.getCartlist(getCartlistIds(userName));
	}
	// 查询所有
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
	// 登录验证
	public boolean userLogin(User user) {
		String sql = "SELECT * FROM user WHERE userName=?";
		boolean flag = false;
		try {
			ConMysql.prepareConnection();
			ConMysql.ps = ConMysql.con.prepareStatement(sql);
			ConMysql.ps.setString(1, user.getName());
			ResultSet rs = ConMysql.ps.executeQuery();
			while (rs.next()) {
				if (rs.getString("password").equals(user.getPassword()))
					flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConMysql.close();
		}
		return flag;
	}
}
