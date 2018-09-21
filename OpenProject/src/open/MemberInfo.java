package open;

public class MemberInfo {
	
	private String userid;
	private String password;
	private String username;
	private String userphoto;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	@Override
	public String toString() {
		return "MemberInfo [userid=" + userid + ", password=" + password + ", username=" + username + ", userphoto="
				+ userphoto + "]";
	}

}
