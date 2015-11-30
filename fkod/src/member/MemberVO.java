package member;

/**
 * @file_name  : MemberVO.java
 * @author     : dingo44kr@gmail.com
 * @date       : 2015. 11. 30.
 * @story      : 
 */
public class MemberVO {
	private String id; // 아이디  =>hong => 'hong'
	private String password; // 비번
	private String name; // 회원이름
	private String birth; // 생년
	private String phone; //핸드폰
	private String email; // 이메일
	private String gender; // 성별
	private String addr; // 주소
	
	public MemberVO() {
	}
	
	public MemberVO(String id, String password, String name, String birth, 
			String phone, String email, String gender, String addr) {
			this.id = id;
			this.password = password;
			this.name = name;
			this.birth = birth;
			this.phone = phone;
			this.email = email;
			this.gender = gender;
			this.addr = addr;
	}
	
	
	
	public String getId() {
		return id;
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
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getGender() {
		return gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setId(String id) {
		this.id = id;
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
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Override
	public String toString() {
		return " 회원 [아이디=" + id 
				+ ", 비밀번호=" + password 
				+ ", 이름=" + name 
				+ ", 생년=" + birth
				+ ", 핸드폰=" + phone 
				+ ", 이메일=" + email 
				+ ", 성별=" + gender 
				+ ", 주소=" + addr+"]";
	}
	
	
}
