package com.ysd.entity.zmf;

public class UserCondition {
	private String userName;//�û���
	private String userCreateTimeBigin;//��ʼʱ��
	private String userCreateTimeEnd;//����ʱ��
	private Integer userIsLockout;//�Ƿ�����
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserCreateTimeBigin() {
		return userCreateTimeBigin;
	}
	public void setUserCreateTimeBigin(String userCreateTimeBigin) {
		this.userCreateTimeBigin = userCreateTimeBigin;
	}
	public String getUserCreateTimeEnd() {
		return userCreateTimeEnd;
	}
	public void setUserCreateTimeEnd(String userCreateTimeEnd) {
		this.userCreateTimeEnd = userCreateTimeEnd;
	}
	public Integer getUserIsLockout() {
		return userIsLockout;
	}
	public void setUserIsLockout(Integer userIsLockout) {
		this.userIsLockout = userIsLockout;
	}
	@Override
	public String toString() {
		return "UserCondition [userName=" + userName + ", userCreateTimeBigin=" + userCreateTimeBigin
				+ ", userCreateTimeEnd=" + userCreateTimeEnd + ", userIsLockout=" + userIsLockout + "]";
	}
	
}
