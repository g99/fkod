package admin;

import java.io.Serializable;

public class AdminVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String userid;
	private String password;
	private String name;
	private String birth;
	private String addr;
	private String gender;
	private String email;
	private String phone;
	
	private static AdminVO instance = new AdminVO();
	public static AdminVO getInstnace(){
		return instance;
	}
	public AdminVO() {
	}
	public AdminVO(String userid,String password,String name,String birth,String addr,String gender,
			String email,String phone) {
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.addr = addr;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getUserid() {
		return userid;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getBirth() {
		return birth;
	}
	public String getAddr() {
		return addr;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getGender() {
		return gender;
	}
	public static AdminVO getInstance() {
		return instance;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public static void setInstance(AdminVO instance) {
		AdminVO.instance = instance;
	}
	@Override
	public String toString() {
		return "AdminVO [아이디=" + userid 
				    + ", 비밀번호=" + password 
				    + ", 이름=" + name 
				    + ", 생년=" + birth
				    + ", 주소=" + addr 
				    + ", 성별=" + gender 
				    + ", email=" + email 
				    + ", phone=" + phone + "]";
	}

	

	

}
