package com.ysd.entity;
//�û�ǩ��
public class UserChecks {

	private int Id;//���
	private int UserId;//�û����
	private String UserName;//�û�����
	private String CheckInTime;//ǩ��ʱ��
	private int CheckState;//ǩ��״̬
	private int IsCancel;//�Ƿ�ȡ��ǩ��
	private String CheckOutTime;//��ǩʱ��
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
	public UserChecks(int id, int userId, String userName, String checkInTime, int checkState, int isCancel,
			String checkOutTime) {
		super();
		Id = id;
		UserId = userId;
		UserName = userName;
		CheckInTime = checkInTime;
		CheckState = checkState;
		IsCancel = isCancel;
		CheckOutTime = checkOutTime;
	}
	
}
