package com.ysd.entity.zmf;

public class UserChecksCondition {

	private String userName;//用户姓名
	private String checkInTimeBigin;//签到开始时间
	private String checkInTimeEnd;//签到结束时间
	private Integer checkState;//签到状态
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCheckInTimeBigin() {
		return checkInTimeBigin;
	}
	public void setCheckInTimeBigin(String checkInTimeBigin) {
		this.checkInTimeBigin = checkInTimeBigin;
	}
	public String getCheckInTimeEnd() {
		return checkInTimeEnd;
	}
	public void setCheckInTimeEnd(String checkInTimeEnd) {
		this.checkInTimeEnd = checkInTimeEnd;
	}
	 
	public Integer getCheckState() {
		return checkState;
	}
	public void setCheckState(Integer checkState) {
		this.checkState = checkState;
	}
	@Override
	public String toString() {
		return "UserChecksCondition [userName=" + userName + ", checkInTimeBigin=" + checkInTimeBigin
				+ ", checkInTimeEnd=" + checkInTimeEnd + ", CheckState=" + checkState + "]";
	}
	
	
}
