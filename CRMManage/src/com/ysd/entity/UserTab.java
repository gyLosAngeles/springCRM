package com.ysd.entity;
//�û���
public class UserTab {

	private int userId;//�û����
	private String userName;//�û�����
	private String userPassWord;//�û�����
	private int userIsLockout;//�Ƿ�����
	private String userUpdateTime;//�û��޸�ʱ��
	private String userCreateTime;//�û�����ʱ��
	private String userLastLoginTime;//���һ�ε�½ʱ��
	private String userLastLoginIp;//���һ�ε�½ip
	private int userPassWrongCout;//�û�����������
	private String userLockoutTime;//�û�����ʱ��
	private String userEmail;//�û���Email
	private String userTelephone;//�û��绰
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassWord() {
		return userPassWord;
	}
	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}
	public int getUserIsLockout() {
		return userIsLockout;
	}
	public void setUserIsLockout(int userIsLockout) {
		this.userIsLockout = userIsLockout;
	}
	public String getUserUpdateTime() {
		return userUpdateTime;
	}
	public void setUserUpdateTime(String userUpdateTime) {
		this.userUpdateTime = userUpdateTime;
	}
	public String getUserCreateTime() {
		return userCreateTime;
	}
	public void setUserCreateTime(String userCreateTime) {
		this.userCreateTime = userCreateTime;
	}
	public String getUserLastLoginTime() {
		return userLastLoginTime;
	}
	public void setUserLastLoginTime(String userLastLoginTime) {
		this.userLastLoginTime = userLastLoginTime;
	}
	public String getUserLastLoginIp() {
		return userLastLoginIp;
	}
	public void setUserLastLoginIp(String userLastLoginIp) {
		this.userLastLoginIp = userLastLoginIp;
	}
	public int getUserPassWrongCout() {
		return userPassWrongCout;
	}
	public void setUserPassWrongCout(int userPassWrongCout) {
		this.userPassWrongCout = userPassWrongCout;
	}
	public String getUserLockoutTime() {
		return userLockoutTime;
	}
	public void setUserLockoutTime(String userLockoutTime) {
		this.userLockoutTime = userLockoutTime;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTelephone() {
		return userTelephone;
	}
	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}
	@Override
	public String toString() {
		return "UserTab [userId=" + userId + ", userName=" + userName + ", userPassWord=" + userPassWord
				+ ", userIsLockout=" + userIsLockout + ", userUpdateTime=" + userUpdateTime + ", userCreateTime="
				+ userCreateTime + ", userLastLoginTime=" + userLastLoginTime + ", userLastLoginIp=" + userLastLoginIp
				+ ", userPassWrongCout=" + userPassWrongCout + ", userLockoutTime=" + userLockoutTime + ", userEmail="
				+ userEmail + ", userTelephone=" + userTelephone + "]";
	}
}
