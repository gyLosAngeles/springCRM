package com.ysd.entity.zmf;

public class UserChecksCondition {

	private String userName;//�û�����
	private String checkInTimeBigin;//ǩ����ʼʱ��
	private String checkInTimeEnd;//ǩ������ʱ��
	private Integer checkState;//ǩ��״̬
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
