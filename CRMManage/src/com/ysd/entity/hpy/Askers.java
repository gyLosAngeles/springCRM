package com.ysd.entity.hpy;

import org.springframework.stereotype.Component;

@Component
public class Askers {
	private Integer askersId;
	private String askersName;
	private Integer CheckState;
	private String CheckInTime;
	private Integer ChangeState;
	private Double Weight;
	private String RoleName;
	private String BakContent;
	public Integer getAskersId() {
		return askersId;
	}
	public void setAskersId(Integer askersId) {
		this.askersId = askersId;
	}
	public String getAskersName() {
		return askersName;
	}
	public void setAskersName(String askersName) {
		this.askersName = askersName;
	}
	public Integer getCheckState() {
		return CheckState;
	}
	public void setCheckState(Integer checkState) {
		CheckState = checkState;
	}
	public String getCheckInTime() {
		return CheckInTime;
	}
	public void setCheckInTime(String checkInTime) {
		CheckInTime = checkInTime;
	}
	public Integer getChangeState() {
		return ChangeState;
	}
	public void setChangeState(Integer changeState) {
		ChangeState = changeState;
	}
	public Double getWeight() {
		return Weight;
	}
	public void setWeight(Double weight) {
		Weight = weight;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
	public String getBakContent() {
		return BakContent;
	}
	public void setBakContent(String bakContent) {
		BakContent = bakContent;
	}
	
	
}
