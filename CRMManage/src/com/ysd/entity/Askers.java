package com.ysd.entity;

import org.springframework.stereotype.Component;

//��ѯʦ
@Component
public class Askers {

	private int askerId;//��ѯʦ���
	private String askerName;//��ѯʦ����
	private int checkState;//ǩ��״̬
	private String checkInTime;//
	private int changeState;//
	private Double weight;//Ȩ��
	private String roleName;//��ɫ
	private String bakContent;//��ע
	public int getAskerId() {
		return askerId;
	}
	public void setAskerId(int askerId) {
		this.askerId = askerId;
	}
	public String getAskerName() {
		return askerName;
	}
	public void setAskerName(String askerName) {
		this.askerName = askerName;
	}
	public int getCheckState() {
		return checkState;
	}
	public void setCheckState(int checkState) {
		this.checkState = checkState;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public int getChangeState() {
		return changeState;
	}
	public void setChangeState(int changeState) {
		this.changeState = changeState;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getBakContent() {
		return bakContent;
	}
	public void setBakContent(String bakContent) {
		this.bakContent = bakContent;
	}
	@Override
	public String toString() {
		return "Askers [askerId=" + askerId + ", askerName=" + askerName + ", checkState=" + checkState
				+ ", checkInTime=" + checkInTime + ", changeState=" + changeState + ", weight=" + weight + ", roleName="
				+ roleName + ", bakContent=" + bakContent + "]";
	}
	
}
