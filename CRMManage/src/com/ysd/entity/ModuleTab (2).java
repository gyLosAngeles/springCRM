package com.ysd.entity;
//ģ���
public class ModuleTab {

	private int moduleId;//ģ����
	private int parentId;//�����
	private String moduleName;//ģ������
	private Double moduleWeight;//ģ��Ȩ��
	private String moduleUrl;//ģ��·��
	private String moduleCreateTime;//ģ�鴴��ʱ��
	private String roleModuleLastUpdateTime;//���һ�ν�ɫ�޸�ʱ��
	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public Double getModuleWeight() {
		return moduleWeight;
	}
	public void setModuleWeight(Double moduleWeight) {
		this.moduleWeight = moduleWeight;
	}
	public String getModuleUrl() {
		return moduleUrl;
	}
	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}
	public String getModuleCreateTime() {
		return moduleCreateTime;
	}
	public void setModuleCreateTime(String moduleCreateTime) {
		this.moduleCreateTime = moduleCreateTime;
	}
	public String getRoleModuleLastUpdateTime() {
		return roleModuleLastUpdateTime;
	}
	public void setRoleModuleLastUpdateTime(String roleModuleLastUpdateTime) {
		this.roleModuleLastUpdateTime = roleModuleLastUpdateTime;
	}
	@Override
	public String toString() {
		return "ModuleTab [moduleId=" + moduleId + ", parentId=" + parentId + ", moduleName=" + moduleName
				+ ", moduleWeight=" + moduleWeight + ", moduleUrl=" + moduleUrl + ", moduleCreateTime="
				+ moduleCreateTime + ", roleModuleLastUpdateTime=" + roleModuleLastUpdateTime + "]";
	}
	
}
