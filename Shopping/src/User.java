package cn.mj;

public class User {
	// 公用id
	private Integer id;
	// 登录用户名、密码
	private String name;
	private String password;

	// set、get方法
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id=id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

