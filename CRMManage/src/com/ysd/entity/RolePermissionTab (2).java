package com.ysd.entity;
//��ɫȨ�޹�ϵ
public class RolePermissionTab {

	private int rolePermissionId;//��ɫȨ�ޱ��
	private int roleId;//��ɫ���
	private int permissionId;//Ȩ�ޱ��
	private String rolePermissionLastUpdateTime;//���һ�ν�ɫ�޸�ʱ��
	public int getRolePermissionId() {
		return rolePermissionId;
	}
	public void setRolePermissionId(int rolePermissionId) {
		this.rolePermissionId = rolePermissionId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	public String getRolePermissionLastUpdateTime() {
		return rolePermissionLastUpdateTime;
	}
	public void setRolePermissionLastUpdateTime(String rolePermissionLastUpdateTime) {
		this.rolePermissionLastUpdateTime = rolePermissionLastUpdateTime;
	}
	@Override
	public String toString() {
		return "RolePermissionTab [rolePermissionId=" + rolePermissionId + ", roleId=" + roleId + ", permissionId="
				+ permissionId + ", rolePermissionLastUpdateTime=" + rolePermissionLastUpdateTime + "]";
	}
	
}
