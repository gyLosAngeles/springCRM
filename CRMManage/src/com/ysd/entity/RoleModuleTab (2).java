package com.ysd.entity;
//��ɫģ���ϵ��
public class RoleModuleTab {

	private int roleModuleId;//��ɫģ����
	private int roleId;//��ɫ���
	private int moduleId;//ģ����
	private String roleModuleLastUpdateTime;//���һ�ν�ɫ�޸�ʱ��
	public int getRoleModuleId() {
		return roleModuleId;
	}
	public void setRoleModuleId(int roleModuleId) {
		this.roleModuleId = roleModuleId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public String getRoleModuleLastUpdateTime() {
		return roleModuleLastUpdateTime;
	}
	public void setRoleModuleLastUpdateTime(String roleModuleLastUpdateTime) {
		this.roleModuleLastUpdateTime = roleModuleLastUpdateTime;
	}
	@Override
	public String toString() {
		return "RoleModuleTab [roleModuleId=" + roleModuleId + ", roleId=" + roleId + ", moduleId=" + moduleId
				+ ", roleModuleLastUpdateTime=" + roleModuleLastUpdateTime + "]";
	}
	
}
