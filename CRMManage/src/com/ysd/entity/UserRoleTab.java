package com.ysd.entity;
//�û���ɫ��ϵ��
public class UserRoleTab {

	private int userRoleId;//�û���ɫ���
	private int userId;//�û����
	private int roleId;//��ɫ���
	private String userRoleLastUpdateTime;//�û���ɫ���һ���޸�ʱ��
	public int getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getUserRoleLastUpdateTime() {
		return userRoleLastUpdateTime;
	}
	public void setUserRoleLastUpdateTime(String userRoleLastUpdateTime) {
		this.userRoleLastUpdateTime = userRoleLastUpdateTime;
	}
	@Override
	public String toString() {
		return "UserRoleTab [userRoleId=" + userRoleId + ", userId=" + userId + ", roleId=" + roleId
				+ ", userRoleLastUpdateTime=" + userRoleLastUpdateTime + "]";
	}
	
}
