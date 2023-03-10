package model;

public class user {
	

	private int id;
	private String name;
	private String email;
	private String password;
	private String mobile;
	private String gender;
	
	public user() {
		
	}

	public user(int id, String name, String email, String password, String mobile, String gender) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String string) {
		this.mobile = string;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return "user [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", mobile="
				+ mobile + ", gender=" + gender + "]";
	}
	
}