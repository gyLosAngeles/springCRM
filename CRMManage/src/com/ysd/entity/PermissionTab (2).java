package com.ysd.entity;
//Ȩ�ޱ�
public class PermissionTab {

	private int permissionId;//Ȩ�ޱ��
	private String permissionValue;//Ȩ��ֵ
	private String permissionModule;//Ȩ��ģ��
	private String permissionName;//Ȩ������
	private String permissionLastUpdateTime;//���һ�ν�ɫ�޸�ʱ��
	public int getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	public String getPermissionValue() {
		return permissionValue;
	}
	public void setPermissionValue(String permissionValue) {
		this.permissionValue = permissionValue;
	}
	public String getPermissionModule() {
		return permissionModule;
	}
	public void setPermissionModule(String permissionModule) {
		this.permissionModule = permissionModule;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	public String getPermissionLastUpdateTime() {
		return permissionLastUpdateTime;
	}
	public void setPermissionLastUpdateTime(String permissionLastUpdateTime) {
		this.permissionLastUpdateTime = permissionLastUpdateTime;
	}
	@Override
	public String toString() {
		return "PermissionTab [permissionId=" + permissionId + ", permissionValue=" + permissionValue
				+ ", permissionModule=" + permissionModule + ", permissionName=" + permissionName
				+ ", permissionLastUpdateTime=" + permissionLastUpdateTime + "]";
	}
	
}
