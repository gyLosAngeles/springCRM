package com.ysd.entity;
//�û���
public class UserTab {

	private Integer userId;//�û����
	private String userName;//�û�����
	private String userPassWord;//�û�����
	private Integer userIsLockout;//�Ƿ�����
	private String userUpdateTime;//�û��޸�ʱ��
	private String userCreateTime;//�û�����ʱ��
	private String userLastLoginTime;//���һ�ε�½ʱ��
	private String userLastLoginIp;//���һ�ε�½ip
	private Integer userPassWrongCout;//�û�����������
	private String userLockoutTime;//�û�����ʱ��
	private String userEmail;//�û���Email
	private String userTelephone;//�û��绰
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
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
	public Integer getUserIsLockout() {
		return userIsLockout;
	}
	public void setUserIsLockout(Integer userIsLockout) {
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
	public Integer getUserPassWrongCout() {
		return userPassWrongCout;
	}
	public void setUserPassWrongCout(Integer userPassWrongCout) {
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
