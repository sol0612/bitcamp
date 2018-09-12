package member.model;

public class LoginInfo {

	private String userId;
	private String userName;
	private String userPhoto;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	@Override
	public String toString() {
		return "LoginInfo [userId=" + userId + ", userName=" + userName + ", userPhoto=" + userPhoto + "]";
	}

	

}
