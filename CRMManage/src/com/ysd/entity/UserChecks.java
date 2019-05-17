package com.ysd.entity;

import org.springframework.stereotype.Component;

//用户签到
@Component
public class UserChecks {

	private int Id;//编号
	private int UserId;//用户编号
	private String UserName;//用户名称
	private String CheckInTime;//签到时间
	private int CheckState;//签到状态
	private int IsCancel;//是否取消签到
	private String CheckOutTime;//退签时间
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getCheckInTime() {
		return CheckInTime;
	}
	public void setCheckInTime(String checkInTime) {
		CheckInTime = checkInTime;
	}
	public int getCheckState() {
		return CheckState;
	}
	public void setCheckState(int checkState) {
		CheckState = checkState;
	}
	public int getIsCancel() {
		return IsCancel;
	}
	public void setIsCancel(int isCancel) {
		IsCancel = isCancel;
	}
	public String getCheckOutTime() {
		return CheckOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		CheckOutTime = checkOutTime;
	}
	@Override
	public String toString() {
		return "UserChecks [Id=" + Id + ", UserId=" + UserId + ", UserName=" + UserName + ", CheckInTime=" + CheckInTime
				+ ", CheckState=" + CheckState + ", IsCancel=" + IsCancel + ", CheckOutTime=" + CheckOutTime + "]";
	}
}
