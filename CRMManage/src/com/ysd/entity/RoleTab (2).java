package com.ysd.entity;
//��ɫ��
public class RoleTab {

	private int roleId;//��ɫ���
	private String roleName;//��ɫ����
	private String roleExplain;//��ɫ����
	private String roleCreateTime;//��ɫ����ʱ��
	private String roleLastUpdateTime;//���һ�ν�ɫ�޸�ʱ��
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleExplain() {
		return roleExplain;
	}
	public void setRoleExplain(String roleExplain) {
		this.roleExplain = roleExplain;
	}
	public String getRoleCreateTime() {
		return roleCreateTime;
	}
	public void setRoleCreateTime(String roleCreateTime) {
		this.roleCreateTime = roleCreateTime;
	}
	public String getRoleLastUpdateTime() {
		return roleLastUpdateTime;
	}
	public void setRoleLastUpdateTime(String roleLastUpdateTime) {
		this.roleLastUpdateTime = roleLastUpdateTime;
	}
	@Override
	public String toString() {
		return "RoleTab [roleId=" + roleId + ", roleName=" + roleName + ", roleExplain=" + roleExplain
				+ ", roleCreateTime=" + roleCreateTime + ", roleLastUpdateTime=" + roleLastUpdateTime + "]";
	}
	
}
