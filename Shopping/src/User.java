package cn.mj;

public class User {
	// ����id
	private Integer id;
	// ��¼�û���������
	private String name;
	private String password;

	// set��get����
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

